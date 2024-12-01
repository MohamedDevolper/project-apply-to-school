import 'package:flutter/material.dart';

typedef Validator = String? Function(String?);

class CustomTextFormField extends StatefulWidget {
  final String hint;
  final TextInputType keyboardType;
  final bool isSecureText;
  final Validator? validator;
  final TextEditingController? controller;

  CustomTextFormField({
    required this.hint,
    this.keyboardType = TextInputType.text,
    this.isSecureText = false,
    this.validator,
    this.controller,
    Key? key,
  }) : super(key: key);

  @override
  _CustomTextFormFieldState createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  bool _isPasswordVisible = false; // للتحكم في عرض/إخفاء كلمة المرور

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      validator: widget.validator,
      obscureText: widget.isSecureText && !_isPasswordVisible,
      keyboardType: widget.keyboardType,
      cursorColor: Colors.black,
      style: const TextStyle(
        fontSize: 18,
        color: Colors.black, // لون النص المُدخل
        fontWeight: FontWeight.w400,
      ),
      decoration: InputDecoration(

        hintText:widget.hint,
        filled: true,
        fillColor: Colors.white, // خلفية الحقل نفسه
       // labelText: widget.hint, // النص الخاص بـ label
       //  floatingLabelBehavior: FloatingLabelBehavior.auto, // تحريك النص للأعلى عند الكتابة
       //  labelStyle: const TextStyle(
       //    fontSize: 19,
       //    fontWeight: FontWeight.w400,
       //    color: Colors.black54,
       //  ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(18),
          borderSide: const BorderSide(color: Colors.grey, width: 1.5),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(18),
          borderSide: const BorderSide(color: Colors.grey, width: 2),
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        suffixIcon: widget.isSecureText
            ? IconButton(
          icon: Icon(
            _isPasswordVisible ? Icons.visibility : Icons.visibility_off,
            color: Colors.black38,
          ),
          onPressed: () {
            setState(() {
              _isPasswordVisible = !_isPasswordVisible;
            });
          },
        )
            : null, // إذا لم يكن الحقل كلمة مرور، لا تظهر أيقونة
      ),
    );
  }
}
