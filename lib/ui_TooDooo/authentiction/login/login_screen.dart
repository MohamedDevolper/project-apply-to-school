import 'package:basics_project_flutter/Image_path.dart';
import 'package:basics_project_flutter/cooore/app_routes.dart';
import 'package:basics_project_flutter/cooore/utils/dialogs-utilis.dart';
import 'package:basics_project_flutter/cooore/utils/email_validate.dart';
import 'package:basics_project_flutter/cooore/utils/image_utils.dart';
import 'package:basics_project_flutter/database/user_access.dart';
import 'package:basics_project_flutter/ui_TooDooo/widgets/custom_text_fprm_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {


   LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailAdressControler = TextEditingController();

  TextEditingController passwordControler = TextEditingController();

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

              const SizedBox(height: 1),
              Row(
                children: [
                  Image.asset(
                    getImagePathByNamed('IMG_20241212_000339-removebg-preview.png'), // مسار صورة الأيقونة
                    width: 95,
                    height: 80,
                  ),
                  const SizedBox(width: 1),
                  Image.asset(
                    getImagePathByNamed('project.png'), // مسار صورة النص "Kidney+"
                    width: 100,
                    height: 40,
                  ),
                ],

              ),
               Container(
                 alignment: Alignment.topCenter,
                   child: Text('                   Welcome Back!',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w700,color: Color(0xFF000000)),)),

               SizedBox(height: 1,),
               Column(
                 crossAxisAlignment: CrossAxisAlignment.center,
                 children: [

                   Image.asset(getImagePathByNamed('Sign In.png'),height: 220,),

                 ],
               ),


              const SizedBox(height: 0), // مسافة بين الصور والـ Container
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

                            const SizedBox(height: 10),
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
                            const SizedBox(height: 10),
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
                          SizedBox(height:8,),
                          Container(
                            alignment: Alignment.center,
                              child: Text('Forgot Passowrd', style: TextStyle(fontSize: 20,fontWeight: FontWeight.w900,color:Color(0xFF019874)),)),
                          SizedBox(height: 10,),
                          //  const SizedBox(height: 20),

                           // const SizedBox(height:20),
                            //CustomTextFormField(label: 'Enter your full name',),
                            Container(
                              alignment: Alignment.center,
                              child: ElevatedButton(
                                onPressed: () {
                                  Login(emailAdressControler.text,passwordControler.text);
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

                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text(
                                  'Don’t have an account?',
                                  style: TextStyle(color: Colors.black,fontSize: 16,fontWeight: FontWeight.w500),

                                ),
                                TextButton(onPressed:(){
                                  Navigator.pushReplacementNamed(context,AppRoute.registerRoute);

                                }, child: Text('Create Account ',style: TextStyle(fontSize:  15,color: Colors.green,fontWeight: FontWeight.w500,decoration: TextDecoration.underline ),)),

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

  void Login(String email,String password) async{
    if(formKey.currentState?.validate() == false){
      return;

    }
    try {
      DialogUtils.showLoadingDialoge(context, message: 'please waiting few moments');
      final UserCredential credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email,
          password: password

      );
      UserAccess.getUser(credential.user!.uid);
      DialogUtils.hideDailog(context);
      DialogUtils.showMessageDialog(context,message:  'User logged in Successfully',postActionTitle: 'OK',posAction: (){
        Navigator.pushReplacementNamed(context, AppRoute.gradutionRoute);
      });
    } on FirebaseAuthException catch (e) {
      DialogUtils.hideDailog(context);
      if (e.code == 'user-not-found'||e.code == 'wrong-password'|| e.code == 'invalid-credential') {
        DialogUtils.showMessageDialog(context, message:'wrong E-mail or Password!.',postActionTitle: 'TryAgain',
         );

      }
    }
  }
}