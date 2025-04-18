import 'dart:convert';
import 'package:basics_project_flutter/cooore/utils/image_utils.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

class OptionPage extends StatefulWidget {
  @override
  _OptionPageState createState() => _OptionPageState();
}

class _OptionPageState extends State<OptionPage> {
  final Map<String, List<String>> localizedQuestions = {
    'en': [
      'Have you been losing weight recently?',
      'Do you have any swelling in your body?',
      'Are you experiencing difficulty breathing?',
      'Do you often feel fatigued or tired?',
      'Have you noticed blood in your urine?',
      'Are you urinating more than usual?',
      'Do you have difficulty sleeping?',
      'Does your skin feel itchy?',
      'Have you had a fever recently?',
      'Are you experiencing lower back pain?',
      'Do you feel nauseous?',
      'Are you experiencing sharp flank pain?',
      'Have you noticed your urine appearing cloudy?',
      'Do you frequently feel the need to urinate?',
      'Do you have high blood pressure?',
      'Are you experiencing muscle cramps?',
      'Do you feel a loss of concentration?'
    ],
    'ar': [
      'هل فقدت الوزن مؤخرًا؟',
      'هل لديك أي تورم في جسمك؟',
      'هل تواجه صعوبة في التنفس؟',
      'هل تشعر بالتعب أو الإرهاق غالبًا؟',
      'هل لاحظت وجود دم في البول؟',
      'هل تتبول أكثر من المعتاد؟',
      'هل تواجه صعوبة في النوم؟',
      'هل تشعر بحكة في الجلد؟',
      'هل أصبت بحمى مؤخرًا؟',
      'هل تعاني من آلام أسفل الظهر؟',
      'هل تشعر بالغثيان؟',
      'هل تعاني من ألم حاد في الجنب؟',
      'هل لاحظت أن البول يبدو عكرًا؟',
      'هل تشعر بالحاجة المتكررة للتبول؟',
      'هل تعاني من ارتفاع ضغط الدم؟',
      'هل تعاني من تشنجات عضلية؟',
      'هل تشعر بفقدان التركيز؟'
    ]
  };

  String currentLanguage = 'en';
  final Map<int, String> answers = {};
  final Map<int, bool> errors = {};
  String result = "";
  String warning = "";
  bool isLoading = false;

  Future<void> _sendData() async {
    setState(() {
      isLoading = true;
    });

    bool hasErrors = false;
    for (int i = 0; i < localizedQuestions[currentLanguage]!.length; i++) {
      if (!answers.containsKey(i)) {
        errors[i] = true;
        hasErrors = true;
      } else {
        errors[i] = false;
      }
    }

    if (hasErrors) {
      setState(() {
        result = "";
        warning = currentLanguage == 'en'
            ? "Please select an answer for all questions."
            : "يرجى اختيار إجابة لجميع الأسئلة.";
        isLoading = false;
      });
      return;
    }

    if (answers.values.every((answer) => answer == "No")) {
      setState(() {
        result = currentLanguage == 'en'
            ? "You are normal and do not suffer from any kidney diseases."
            : "أنت طبيعي ولا تعاني من أي أمراض كلوية.";
        warning = "";
        isLoading = false;
      });
      return;
    }

    var headers = {
      'Content-Type': 'application/json',
    };

    var data = json.encode({
      "answers": List.generate(
        localizedQuestions[currentLanguage]!.length,
            (index) => answers[index] ?? "No",
      ),
    });

    Dio dio = Dio();
    try {
      var response = await dio.request(
        'http://192.168.54.210:8001/predict',
        options: Options(
          method: 'POST',
          headers: headers,
        ),
        data: data,
      );

      if (response.statusCode == 200) {
        await Future.delayed(Duration(seconds: 3));

        setState(() {
          result = response.data['prediction_description'] ?? 'No result';
          warning = result == "Kidney Stones"
              ? (currentLanguage == 'en'
              ? "Kidney stones are solid deposits of minerals and salts that form in your kidneys. Immediate medical attention is recommended."
              : "حصوات الكلى هي ترسبات صلبة من المعادن والأملاح تتشكل في الكلى. يوصى بالعناية الطبية الفورية.")
              : result == "Chronic Kidney Disease"
              ? (currentLanguage == 'en'
              ? "Chronic Kidney Disease (CKD) is a long-term condition where the kidneys gradually lose function. Early detection is crucial."
              : "مرض الكلى المزمن هو حالة طويلة الأمد تفقد فيها الكلى وظائفها تدريجيًا. الكشف المبكر مهم للغاية.")
              : result == "Acute Nephritis"
              ? (currentLanguage == 'en'
              ? "Acute nephritis refers to inflammation of the kidneys. Seek immediate medical care to prevent complications."
              : "التهاب الكلية الحاد يشير إلى التهاب الكلى. اطلب الرعاية الطبية الفورية لتجنب المضاعفات.")
              : currentLanguage == 'en'
              ? "No significant symptoms detected."
              : "لم يتم اكتشاف أعراض مهمة.";
        });
      } else {
        setState(() {
          result = currentLanguage == 'en' ? 'Error in response' : 'خطأ في الاستجابة';
          warning = '';
        });
      }
    } catch (e) {
      setState(() {
        result = currentLanguage == 'en' ? 'Server error' : 'خطأ في الخادم';
        warning = '';
      });
      print(e);
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
          color: Colors.white,
          // المسار إلى الصورة
          height: 40, // ضبط ارتفاع الصورة
        ),
        centerTitle: true,
        backgroundColor: const Color(0xFF019874),
      ),
      drawer: Drawer(
        child: Container(
          color: const Color(0xFFE8F5E9),
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              DrawerHeader(
                decoration: BoxDecoration(
                  color: Color(0xFF019874),
                ),
                child: Text(
                  currentLanguage == 'en' ? 'Select Language' : 'اختيار اللغة',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              ListTile(
                title: Text(
                  'English',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: currentLanguage == 'en' ? Colors.black : Colors.grey,
                  ),
                ),
                onTap: () {
                  setState(() {
                    currentLanguage = 'en';
                  });
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text(
                  'Arabic',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: currentLanguage == 'ar' ? Colors.black : Colors.grey,
                  ),
                ),
                onTap: () {
                  setState(() {
                    currentLanguage = 'ar';
                  });
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
      ),
      body: Container(
        color: Colors.white,
        child: Column(

          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(16.0),
              color: const Color(0xFFE8F5E9),
              child: Text(
                currentLanguage == 'en'
                    ? 'Select the symptoms you are experiencing:'
                    : 'حدد الأعراض التي تعاني منها:',
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF388E3C),
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.all(8.0),
                itemCount: localizedQuestions[currentLanguage]!.length,
                itemBuilder: (context, index) {
                  return Card(
                    margin: const EdgeInsets.symmetric(vertical: 8.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    elevation: 5,
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Text(
                                  localizedQuestions[currentLanguage]![index],
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black87,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 10),
                              DropdownButtonHideUnderline(
                                child: DropdownButton<String>(
                                  value: answers[index],
                                  hint: Text(
                                    currentLanguage == 'en' ? 'Select' : 'اختر',
                                    style: const TextStyle(color: Colors.black54),
                                  ),
                                  onChanged: (String? newValue) {
                                    if (newValue != null) {
                                      setState(() {
                                        answers[index] = newValue;
                                        errors[index] = false;
                                      });
                                    }
                                  },
                                  items: ['Yes', 'No']
                                      .map<DropdownMenuItem<String>>(
                                          (String value) {
                                        return DropdownMenuItem<String>(
                                          value: value,
                                          child: Text(value,style: TextStyle(color:Colors.teal),),
                                        );
                                      }).toList(),
                                ),
                              ),
                            ],
                          ),
                          if (errors[index] == true)
                            Padding(
                              padding: const EdgeInsets.only(top: 8.0),
                              child: Text(
                                currentLanguage == 'en'
                                    ? 'This question is required.'
                                    : 'هذه السؤال مطلوب.',
                                style: TextStyle(
                                  color: Colors.red,
                                  fontSize: 14,
                                ),
                              ),
                            ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton(
                onPressed: isLoading ? null : _sendData,
                child: isLoading
                    ? CircularProgressIndicator(color: Colors.white)
                    : Text(
                  currentLanguage == 'en' ? 'Show result' : 'عرض النتيجة ',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white, // النص أبيض
                    fontWeight: FontWeight.bold,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF019874), // لون زيتي
                  padding: EdgeInsets.symmetric(vertical: 18.0, horizontal: 128.0), // مساحة أكبر
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                    side: BorderSide(color: Color(0xFF019874), width: 4), // Border زيتي
                  ),
                ),
              ),
            ),
            if (result.isNotEmpty) ...[
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  result,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.teal, // لون جميل للنتيجة
                    shadows: [
                      Shadow(
                        offset: Offset(1.0, 1.0),
                        blurRadius: 4.0,
                        color: Colors.grey.withOpacity(0.6),

                      ),
                    ],
                  ),
                ),
              ),
              if (warning.isNotEmpty)
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    warning,
                    style: TextStyle(
                      color: Colors.black, // لون مميز للتحذير
                      fontSize: 20,
                      fontStyle: FontStyle.normal,
                    ),
                  ),
                ),
            ]

          ],
        ),
      ),
    );
  }
}
