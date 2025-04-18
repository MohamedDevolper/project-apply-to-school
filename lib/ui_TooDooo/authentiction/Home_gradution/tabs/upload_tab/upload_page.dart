import 'dart:convert';
import 'dart:io';
import 'package:basics_project_flutter/cooore/utils/image_utils.dart';
import 'package:dio/dio.dart';
import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class UploadPage extends StatefulWidget {
  const UploadPage({super.key});

  @override
  State<UploadPage> createState() => _UploadPageState();
}

class _UploadPageState extends State<UploadPage> {
  File? _image;
  String extractedText = '';
  String resultMessage = '';
  bool isLoading = false;
  late TextRecognizer textRecognizer;

  String? recognizedText = "";
  String? ureaValue = "";
  String? creatinineValue = "";
  int? age = 50;
  int? gender = 1;

  @override
  void initState() {
    super.initState();
    textRecognizer = TextRecognizer(script: TextRecognitionScript.latin);
  }

  // اختيار صورة من الكاميرا أو المعرض
  Future _pickImage(ImageSource source) async {
    try {
      final image = await ImagePicker().pickImage(source: source);
      if (image != null) {
        setState(() {
          _image = File(image.path);
        });
        await textRecognition2(File(image.path));
      }
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }

  // استخراج النصوص من الصورة باستخدام OCR
  Future<void> textRecognition2(File img) async {
    try {
      final inputImage = InputImage.fromFilePath(img.path);
      final RecognizedText recognized = await textRecognizer.processImage(inputImage);

      recognizedText = "";

      Map<TextLine, Rect> lineMap = {};
      for (TextBlock block in recognized.blocks) {
        for (TextLine line in block.lines) {
          lineMap[line] = line.boundingBox;
        }
      }

      String? ureaDetectedText;
      String? creatinineDetectedText;

      for (var entry in lineMap.entries) {
        final text = entry.key.text.toLowerCase();
        final rect = entry.value;

        if (text.contains("urea")) {
          ureaDetectedText = entry.key.text;
          ureaValue = _findValueNear(rect, lineMap);
        } else if (text.contains("creatinine")) {
          creatinineDetectedText = entry.key.text;
          creatinineValue = _findValueNear(rect, lineMap);
        }
      }

      if (ureaDetectedText != null && ureaValue != null) {
        recognizedText = (recognizedText ?? '') + "$ureaDetectedText $ureaValue\n";
      }
      if (creatinineDetectedText != null && creatinineValue != null) {
        recognizedText = (recognizedText ?? '') + "$creatinineDetectedText $creatinineValue\n";
      }

      if (recognizedText!.isEmpty) {
        recognizedText = "No relevant data found";
      }
    } catch (e) {
      setState(() {
        extractedText = "حدث خطأ أثناء استخراج النصوص: $e";
      });
    }
  }

  // البحث عن القيمة بالقرب من النص المكتشف
  String? _findValueNear(Rect keyRect, Map<TextLine, Rect> lineMap) {
    for (var entry in lineMap.entries) {
      final text = entry.key.text;
      final rect = entry.value;

      if (RegExp(r'^\d+(\.\d+)?$').hasMatch(text)) {
        final isCloseHorizontally =
        (rect.left > keyRect.right && rect.left - keyRect.right < 50);
        final isCloseVertically = (rect.top - keyRect.top).abs() < 20;

        if (isCloseHorizontally || isCloseVertically) {
          return text; // Return the numeric value
        }
      }
    }
    return null;
  }


  Future<void> sendDataToApi() async {
    if (ureaValue == null || creatinineValue == null || age == null || gender == null) {
      setState(() {
        resultMessage = 'لم يتم استخراج جميع القيم المطلوبة من النص.';
      });
      return;
    }

    try {
      setState(() {
        isLoading = true;
      });


      await Future.delayed(const Duration(seconds: 3));

      Dio dio = Dio();
      var response = await dio.get(
        'http://192.168.54.210:8000/check', // تأكد من عنوان API الخاص بك
        queryParameters: {
          'urea': ureaValue,
          'creatinine': creatinineValue,
          'age': age,
          'gender': gender,
        },
      );

      if (response.statusCode == 200) {
        setState(() {
          resultMessage = '${response.data}';
        });
      } else {
        setState(() {
          resultMessage = 'خطأ في الخادم: ${response.statusCode}';
        });
      }
    } catch (e) {
      setState(() {
        resultMessage = 'فشل في الاتصال بالخادم: $e';
      });
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset(getImagePathByNamed('project.png'),
           color: Color(0xFF019874),
           // المسار إلى الصورة
          height: 40, // ضبط ارتفاع الصورة
        ),
        centerTitle: true,



        backgroundColor: Colors.white,
        elevation: 0,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Row(
            children: const [
              Icon(Icons.arrow_back_ios_new, color: Colors.black),
              SizedBox(width: 2),
              Expanded(
                child: Text(
                  "Back",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      body: _buildImageRecognitionScreen(),

      backgroundColor: Colors.white,

    );
  }

  // تعريف واجهة الشاشة الرئيسية
  Widget _buildImageRecognitionScreen() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),

      child: SingleChildScrollView(
        child: Column(

          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 8),
            const SizedBox(height: 15),
            Row(
              children: [
                Text('Please Upload The Medicl Report : ',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w900,color: Colors.black),)
              ],
            ),
            SizedBox(height: 10,),
            Container(
              width: double.infinity,
              height: 250,
              decoration: BoxDecoration(
                color: Colors.grey[200],
                border: Border.all(
                  color: Colors.black,
                  width: 3,
                ),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Center(
                child: _image == null
                    ? const Icon(
                  Icons.add_a_photo,
                  size: 60,
                  color: Colors.black54,
                )
                    : ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.file(
                    _image!,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 15),
            _buildActionButton(
              icon: Icons.camera_alt,
              label: 'Take a photo',
              onPressed: () => _pickImage(ImageSource.camera),
            ),
            const SizedBox(height: 10),
            _buildActionButton(
              icon: Icons.photo_album,
              label: 'Upload Image',
              onPressed: () => _pickImage(ImageSource.gallery),
            ),
            const SizedBox(height: 20),
            if (isLoading)
              const Center(
                child: CircularProgressIndicator(
                  color: Color(0xFF019874),
                ),
              )
            else
              _buildActionButton(
                icon: Icons.visibility,
                label: 'Show Result',
                onPressed: () => sendDataToApi(),
              ),
            const SizedBox(height: 20),
            if (resultMessage.isNotEmpty)
              Text(
                resultMessage,
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
          ],
        ),
      ),
    );
  }


  Widget _buildActionButton({
    required IconData icon,
    required String label,
    required VoidCallback onPressed,
  }) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: MaterialButton(
        color: const Color(0xFF019874),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        onPressed: onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: Colors.white),
            const SizedBox(width: 10),
            Text(
              label,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
