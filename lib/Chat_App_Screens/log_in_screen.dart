import 'package:chandu_firebase_module_practise/Chat_App_Screens/sign_up_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../Widgets/custom_button.dart';
import '../Widgets/custom_text_field.dart';
import '../Widgets/uihelper_class.dart';
import 'home_screen_chat.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({super.key});

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  SignIn(String email , String password)async{
    if(email==""&& password==""){
      return UiHelper.CustomAlertBox(context, "Enter Required Field");
    }
    else{
      try{
        UserCredential? userCredential;
        userCredential=await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password).then((value){
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>HomeScreenChat()));
        });
      }
      on FirebaseAuthException catch(ex){
        return UiHelper.CustomAlertBox(context, ex.code.toString());
      }
    }
  }
  @override
  Widget build(BuildContext context) {
    // final height = MediaQuery.of(context).size.height;
    // final width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0XFFe2ebdf),
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.message,
                  size: 110,
                ),
                SizedBox(
                  height: 40,
                ),
                Text(
                  "Welcome back you have been missed!",
                  style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w500,
                      color: Colors.black),
                ),
                SizedBox(
                  height: 20*0.2,
                ),
                CustomTextField01(
                    controller: emailController, text: "Email", toHide: false),
                CustomTextField01(
                    controller: passwordController,
                    text: "Password",
                    toHide: true),
                SizedBox(
                  height: 20*0.2,
                ),
                Custom_Button(onPressed: () {
                  SignIn(emailController.text.toString(), passwordController.text.toString());
                  // Navigator.push(context, MaterialPageRoute(builder: (contex)=>HomeScreenChat()));
                }, textButton: "Sign In"),
                SizedBox(height: 15,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Not a member?",
                      style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
                    ),
                    TextButton(
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>SignUpScreen()));
                        },
                        child: Text(
                          "Register Now",
                          style: TextStyle(
                            fontSize: 17,fontWeight: FontWeight.bold,
                            color: Colors.black
                          ),
                        ))
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
