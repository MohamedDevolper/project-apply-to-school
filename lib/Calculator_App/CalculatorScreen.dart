import 'package:basics_project_flutter/Calculator_App/CalculatorButton.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CalculatorScreen extends StatefulWidget {
  static const String routeName = '';

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  String textView = '';
  String saveNumber = '';
  String saveOp = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(
          'CalculatorScreen',
          style: TextStyle(
            color: Colors.white,
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Container(
        child: Column(
          children: [
            Expanded(
              child: Container(
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.all(16),
                child: Text(
                  textView,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  CalculatorButton(buttonTitle: '7', onClikedButton: onDigitClicked),
                  CalculatorButton(buttonTitle: '8', onClikedButton: onDigitClicked),
                  CalculatorButton(buttonTitle: '9', onClikedButton: onDigitClicked),
                  CalculatorButton(buttonTitle: '/', onClikedButton: onClikedOperator),
                ],
              ),
            ),
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  CalculatorButton(buttonTitle: '4', onClikedButton: onDigitClicked),
                  CalculatorButton(buttonTitle: '5', onClikedButton: onDigitClicked),
                  CalculatorButton(buttonTitle: '6', onClikedButton: onDigitClicked),
                  CalculatorButton(buttonTitle: '*', onClikedButton: onClikedOperator),
                ],
              ),
            ),
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  CalculatorButton(buttonTitle: '1', onClikedButton: onDigitClicked),
                  CalculatorButton(buttonTitle: '2', onClikedButton: onDigitClicked),
                  CalculatorButton(buttonTitle: '3', onClikedButton: onDigitClicked),
                  CalculatorButton(buttonTitle: '-', onClikedButton: onClikedOperator),
                ],
              ),
            ),
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  CalculatorButton(buttonTitle: '.', onClikedButton: onDigitClicked),
                  CalculatorButton(buttonTitle: '0', onClikedButton: onDigitClicked),
                  CalculatorButton(buttonTitle: '+', onClikedButton: onClikedOperator),
                  CalculatorButton(buttonTitle: '=', onClikedButton: onClikedEqual),
                ],
              ),
            ),
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  CalculatorButton(buttonTitle: 'C', onClikedButton: onClearAll), // زر Clear
                  CalculatorButton(buttonTitle: '⌫', onClikedButton: onBackspace), // زر Backspace
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void onDigitClicked(String buttonTitle) {
    setState(() {

      if (buttonTitle == '.' && textView.contains('.')) {
        return;
      }
      textView += buttonTitle;
    });
  }


  void onClikedOperator(String operator) {
    if (saveNumber.isEmpty) {
      saveNumber = textView;
      saveOp = operator;
      setState(() {
        textView = '';
      });
    } else {
      String newNumber = textView;
      String res = calculte(saveNumber, newNumber, saveOp);
      saveOp = operator;
      saveNumber = res;
      setState(() {
        textView = '';
      });
    }
  }

  void onClikedEqual(String op) {
    if (saveNumber.isNotEmpty && saveOp.isNotEmpty) {
      String res = calculte(saveNumber, textView, saveOp);
      setState(() {
        textView = res;
        saveNumber = '';
        saveOp = '';
      });
    }
  }

  // دالة لتنفيذ العملية الحسابية
  String calculte(String lhs, String rhs, String op) {
    double n1 = double.parse(lhs);
    double n2 = double.parse(rhs);
    double res = 0;
    if (op == '+') {
      res = n1 + n2;
    } else if (op == '-') {
      res = n1 - n2;
    } else if (op == '/') {
      res = n1 / n2;
    } else if (op == '*') {
      res = n1 * n2;
    }
    return res.toString();
  }

  // دالة لمسح جميع البيانات
  void onClearAll(String _) {
    setState(() {
      textView = '';
      saveNumber = '';
      saveOp = '';
    });
  }

  // دالة لحذف آخر رقم (Backspace)
  void onBackspace(String _) {
    setState(() {
      if (textView.isNotEmpty) {
        textView = textView.substring(0, textView.length - 1);
      }
    });
  }
}
