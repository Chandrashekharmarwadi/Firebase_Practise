import 'dart:developer';

import 'package:chandu_firebase_module_practise/Widgets/uihelper_class.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../Widgets/custom_button.dart';
import '../Widgets/custom_text_field.dart';
import 'log_in_screen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  // TextEditingController confirmedPasswordController = TextEditingController();

  SignUp(String email, String password)async{
    if(email==""&&password==""){
      return UiHelper.CustomAlertBox(context, "Enter required field");
    }
    else{
      UserCredential? userCredential;
      try{
        userCredential=await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password).then((value) {
          return UiHelper.CustomAlertBox(context, "User Created");
        }).then((value){
          FirebaseFirestore.instance.collection("Chat").doc(email).set({
            "Email":email,
            "Password":password
          });
        }).then((value){
          log("Data Inserted");
        });
      }
      on FirebaseAuthException catch (ex){
        return UiHelper.CustomAlertBox(context, ex.code.toString());
      }
    }
  }


  @override
  Widget build(BuildContext context) {
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
                  "Let's create an account for you!",
                  style: TextStyle(
                      fontSize: 19,
                      fontWeight: FontWeight.w700,
                      color: Colors.black),
                ),
                SizedBox(
                  height: 15,
                ),
                CustomTextField01(
                  controller: emailController,
                  text: "Email",
                  toHide: false,
                ),
                CustomTextField01(
                    controller: passwordController,
                    text: "Password",
                    toHide: false),
                // CustomTextField01(
                //     controller: confirmedPasswordController,
                //     text: "Confirm Password",
                //     toHide: false),
                SizedBox(
                  height: 10,
                ),
                Custom_Button(onPressed: () {
                  SignUp(emailController.text.toString(), passwordController.text.toString());
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>LogInScreen()));
                }, textButton: "Sign Up"),
                SizedBox(
                  height: 35,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Already a member ?",
                      style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
                    ),
                    TextButton(
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>LogInScreen()));
                        },
                        child: Text(
                          "Login Now",
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                            fontWeight: FontWeight.bold
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
