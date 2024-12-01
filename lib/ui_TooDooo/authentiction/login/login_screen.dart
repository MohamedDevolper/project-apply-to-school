import 'package:basics_project_flutter/Image_path.dart';
import 'package:basics_project_flutter/cooore/utils/email_validate.dart';
import 'package:basics_project_flutter/cooore/utils/image_utils.dart';
import 'package:basics_project_flutter/ui_TooDooo/widgets/custom_text_fprm_field.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {

  TextEditingController emailAdressControler = TextEditingController();
  TextEditingController passwordControler = TextEditingController();
  var formKey = GlobalKey<FormState>();
   LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
       //title: Text('Kidney App',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: Color(0xFF019874)),),
        backgroundColor:Colors.transparent,
        elevation: 0,
       leading: GestureDetector(
          onTap: () {
            Navigator.pop(context); // العودة للصفحة السابقة عند الضغط
          },
          child: Row(
            children: const [
              Icon(Icons.arrow_back_ios_new, color: Colors.black),
              SizedBox(width: 2), // مسافة صغيرة بين الأيقونة والنص
              Expanded(
                child: Text(
                  "Back",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 12,fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),

      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: SingleChildScrollView(
          child: Column(
           //crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              const SizedBox(height: 8),
              Row(
                children: [
                  Image.asset(
                    getImagePathByNamed('Vector.png'), // مسار صورة الأيقونة
                    width: 45,
                    height: 15,
                  ),
                  const SizedBox(width: 10),
                  Image.asset(
                    getImagePathByNamed('Kidney+.png'), // مسار صورة النص "Kidney+"
                    width: 55,
                    height: 15,
                  ),
                ],

              ),
               Container(
                 alignment: Alignment.topCenter,
                   child: Text('                   Welcome Back!',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w700,color: Color(0xFF000000)),)),

               SizedBox(height: 8,),
               Column(
                 crossAxisAlignment: CrossAxisAlignment.center,
                 children: [
                   Image.asset(getImagePathByNamed('LoginScreen.png')),
                 ],
               ),


              const SizedBox(height: 10), // مسافة بين الصور والـ Container
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.50, // 70% من الشاشة
                child: Container(
                  //alignment: Alignment.bottomCenter,
                  width: double.infinity,
                  padding: const EdgeInsets.all(20),
                  margin: EdgeInsets.symmetric(vertical: 5,horizontal: 3),
                  decoration: BoxDecoration(
          
          
                    color: Color(0xFFD9D9D9),
                    borderRadius: BorderRadius.circular(45), // الحواف الدائرية
                    border: Border.all(color: Color(0xFFD9D9D9), width: 8), // الإطار
                  ),
                    child: Form(
                      key: formKey,
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
          
          
                          children: [
          
                            Container(
                              alignment: Alignment.center,
                              child: const Text(
                                'Login With Us!',
                                style: TextStyle(
                                  fontSize: 23,
                                  fontWeight: FontWeight.w700,
                                  color: Color(0xFF000000),
                                ),
                              ),
                            ),
                            // const SizedBox(height: 10),
                            // Container(
                            //   alignment: Alignment.center,
                            //   child: const Text(
                            //     'Your Information is safe with us',
                            //     style: TextStyle(
                            //       fontSize: 15,
                            //       color: Colors.black54,
                            //     ),
                            //   ),
                            // ),
          
                           // const SizedBox(height: 25),

                            //const SizedBox(height: 20),

                            const SizedBox(height: 20),
                            Text('Enter E-mail:',style: TextStyle(fontSize: 17,fontWeight: FontWeight.w500,color: Colors.black),),
                            CustomTextFormField(
                              controller: emailAdressControler,
                              hint:'Enter Your E-mail',keyboardType: TextInputType.emailAddress,
                              validator: (input){
                                if(input == null || input.trim().isEmpty){
                                  return 'Please, Enter E-mail Address ';
                                }
                                if(!isValidtionEmail(input)){
                                  return 'Sorry, E-mail Not Corect ';
          
                                }
                                return null;
                              },
          
                            ),
                            const SizedBox(height: 20),
                            Text('Enter Password:',style: TextStyle(fontSize: 17,fontWeight: FontWeight.w500,color: Colors.black),),
                            CustomTextFormField(
                              controller: passwordControler,
                              hint:'Enter Your Password',keyboardType: TextInputType.visiblePassword,isSecureText: true,
                            validator: (input){
                              if(input == null || input.trim().isEmpty){
                                return 'Please, Enter Password ';
                              }
                              if(input.length<6){
                                return 'Sorry, Password Should be at least 6 character ';
                              }
                              return null;
                            },
                            ),
                          SizedBox(height:15,),
                          Container(
                            alignment: Alignment.center,
                              child: Text('Forgot Passowrd', style: TextStyle(fontSize: 20,fontWeight: FontWeight.w900,color:Color(0xFF019874)),)),
                          SizedBox(height: 20,),
                          //  const SizedBox(height: 20),

                           // const SizedBox(height:20),
                            //CustomTextFormField(label: 'Enter your full name',),
                            Container(
                              alignment: Alignment.center,
                              child: ElevatedButton(
                                onPressed: () {
                                  Login();
                                },
          
                                style: ElevatedButton.styleFrom(
                                  backgroundColor:Color(0xFF019874) ,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 80),
                                ),
                                child: const Text(
                                  'Sign In',
                                  style: TextStyle(fontSize: 20, color: Colors.white,fontWeight: FontWeight.w700),
                                ),
                              ),
                            ),
                            const SizedBox(height: 20),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text(
                                  'Dont have an account?',
                                  style: TextStyle(color: Colors.black,fontSize: 18,fontWeight: FontWeight.w500),
                                ),
                                GestureDetector(
                                  onTap: () {},
                                  child: const Text(
                                    ' Sign In',
                                    style: TextStyle(
                                      color: Colors.green,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 18,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
          
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(String hintText, {bool isPassword = false}) {
    return TextField(
      obscureText: isPassword,
      decoration: InputDecoration(
        hintText: hintText,
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.grey.shade400),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.grey.shade400),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Colors.green),
        ),
      ),
    );

  }
  void Login() {
    if(formKey.currentState?.validate() == false){
      return;

    }
  }


}