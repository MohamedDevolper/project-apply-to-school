
import 'package:basics_project_flutter/Image_path.dart';
import 'package:basics_project_flutter/cooore/app_routes.dart';
import 'package:basics_project_flutter/cooore/utils/dialogs-utilis.dart';
import 'package:basics_project_flutter/cooore/utils/email_validate.dart';
import 'package:basics_project_flutter/cooore/utils/image_utils.dart';
import 'package:basics_project_flutter/database/model/user.dart';
import 'package:basics_project_flutter/database/model/user.dart'as MyUser;
import 'package:basics_project_flutter/database/user_access.dart';
import 'package:basics_project_flutter/database/user_access.dart';
import 'package:basics_project_flutter/main.dart';
import 'package:basics_project_flutter/ui_TooDooo/widgets/custom_text_fprm_field.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import '../../../database/model/user.dart';

class RegisterScreen extends StatefulWidget {


  RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController fullNameControler = TextEditingController();

  TextEditingController userNameControler = TextEditingController();

  TextEditingController emailAdressControler = TextEditingController();

  TextEditingController passwordControler = TextEditingController();

  TextEditingController passwordConfirmationControler = TextEditingController();

  var formKey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: Image.asset(getImagePathByNamed('project.png'),
          color: Color(0xFF019874),
          // المسار إلى الصورة
          height: 40, // ضبط ارتفاع الصورة
        ),
        centerTitle: true,
        backgroundColor:  Colors.white,

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
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              const SizedBox(height: 0),
              Row(
                children: [
                  Image.asset(
                    getImagePathByNamed('IMG_20241212_000339-removebg-preview.png'), // مسار صورة الأيقونة
                    width: 100,
                    height: 90,
                  ),
                  const SizedBox(width: 4),
                  Image.asset(
                    getImagePathByNamed('project.png'), // مسار صورة النص "Kidney+"
                    width: 100,
                    height: 40,
                  ),
                ],
              ),
              const SizedBox(height: 13), // مسافة بين الصور والـ Container
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.80, // 70% من الشاشة
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(


                    color: Color(0xFFD9D9D9),
                    borderRadius: BorderRadius.circular(45), // الحواف الدائرية
                    border: Border.all(color: Color(0xFFD9D9D9), width: 8), // الإطار
                  ),
                  
                  child: SingleChildScrollView(
                    child: Form(
                      key: formKey,
                      child: Column(
                    
                        crossAxisAlignment: CrossAxisAlignment.start,
                    
                    
                        children: [
                    
                          Container(
                            alignment: Alignment.center,
                            child: const Text(
                              'Register With Us!',
                              style: TextStyle(
                                fontSize: 23,
                                fontWeight: FontWeight.w700,
                                color: Color(0xFF000000),
                              ),
                            ),
                          ),
                          const SizedBox(height: 10),
                          Container(
                            alignment: Alignment.center,
                            child: const Text(
                              'Your Information is safe with us',
                              style: TextStyle(
                                fontSize: 15,
                                color: Colors.black54,
                              ),
                            ),
                          ),
                    
                          const SizedBox(height: 10),
                          Text('Enter Full Name:',style: TextStyle(fontSize: 17,fontWeight: FontWeight.w500,color: Colors.black),),
                    
                    
                          CustomTextFormField(
                    
                    
                            controller: fullNameControler,
                            hint:'Enter Your Full Name',keyboardType: TextInputType.name,
                    
                            validator: (input){
                              if(input == null || input.trim().isEmpty){
                                return 'Please, Enter Full Name ';
                              }
                              if(input is int){
                                return 'Sorry, The Invalid Name !';
                              }
                              return null;
                            },
                    
                          ),
                          const SizedBox(height: 19),
                          Text('Enter User Name:',style: TextStyle(fontSize: 17,fontWeight: FontWeight.w500,color: Colors.black),),
                          CustomTextFormField(
                    
                            controller: userNameControler,
                            hint:'Enter Your User Name',keyboardType: TextInputType.name,
                            validator: (input){
                              if(input == null || input.trim().isEmpty){
                                return 'Please, Enter User Name ';
                              }
                              return null;
                    
                            },
                    
                          ),
                          const SizedBox(height: 19),
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
                          const SizedBox(height: 19),
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
                          const SizedBox(height: 20),
                          Text('Enter Re-Password:',style: TextStyle(fontSize: 17,fontWeight: FontWeight.w500,color: Colors.black),),
                          CustomTextFormField(
                            controller: passwordConfirmationControler,
                            hint:'Confirm Your Password',keyboardType: TextInputType.visiblePassword,isSecureText: true,
                            validator: (input){
                              if(input == null || input.trim().isEmpty){
                                return 'Please, Enter Password ';
                              }
                              if(input != passwordControler.text){
                                return 'Sorry,Password Does Not Match';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height:19),
                          //CustomTextFormField(label: 'Enter your full name',),
                          Container(
                            alignment: Alignment.center,
                            child: ElevatedButton(
                              onPressed: () {
                                register(emailAdressControler.text,passwordControler.text);
                              },
                    
                              style: ElevatedButton.styleFrom(
                                backgroundColor:Color(0xFF019874) ,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 80),
                              ),
                              child: const Text(
                                'Sign Up',
                                style: TextStyle(fontSize: 20, color: Colors.white,fontWeight: FontWeight.w700),
                              ),
                            ),
                          ),
                          const SizedBox(height: 18),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                'Already have account',
                                style: TextStyle(color: Colors.black,fontSize: 16,fontWeight: FontWeight.w500),
                    
                              ),
                              TextButton(onPressed:(){
                                Navigator.pushReplacementNamed(context,AppRoute.loginRoute);
                    
                              }, child: Text('Sign In ',style: TextStyle(fontSize:  15,color: Colors.green,fontWeight: FontWeight.w500,decoration: TextDecoration.underline ),)),
                    
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

  void register(String email , String password) async{
    if(formKey.currentState?.validate() == false){
      return;

    }

    try{
      DialogUtils.showLoadingDialoge(context, message:'Create Account');
      var userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: email, password: password);
      await UserAccess.addUser(MyUser.User(
        id:userCredential.user?.uid ,
        fullName: fullNameControler.text,
        userName: userNameControler.text,
        email: emailAdressControler.text,
      ));
      DialogUtils.hideDailog(context);
      DialogUtils.showMessageDialog(context,message: 'Registration  Successfully',postActionTitle: 'Login',
          posAction: (){
            Navigator.pushReplacementNamed(context, AppRoute.loginRoute);
          }
      );


    } on FirebaseAuthException catch(e){
      DialogUtils.hideDailog(context);
      if (e.code == 'weak-password') {
        DialogUtils.showMessageDialog(context,message: 'The password provided is too weak.',postActionTitle: 'Try Again ');

      } else if (e.code == 'email-already-in-use') {
        DialogUtils.showMessageDialog(context,message: 'The account already exists for that email try another account',postActionTitle: 'OK');

      }
    }catch(e){
      DialogUtils.hideDailog(context);
      DialogUtils.showMessageDialog(context,message: e.toString(),postActionTitle: 'OK');

    }
  }
}