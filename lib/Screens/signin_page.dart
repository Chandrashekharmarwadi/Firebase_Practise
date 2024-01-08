import 'dart:developer';

import 'package:chandu_firebase_module_practise/Screens/forgatepassward_page.dart';
import 'package:chandu_firebase_module_practise/Screens/home_screen.dart';
import 'package:chandu_firebase_module_practise/Screens/verify_user.dart';
import 'package:chandu_firebase_module_practise/Widgets/uihelper_class.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';


class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
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
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>HomeScreen()));
        });
      }
      on FirebaseAuthException catch(ex){
        return UiHelper.CustomAlertBox(context, ex.code.toString());
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sign In"),
        centerTitle: true,
        backgroundColor: Colors.amber,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Sign In",style: TextStyle(fontSize: 32,fontWeight: FontWeight.bold),),
          UiHelper.CustomTextField(emailController, "Enter Email", false, Icons.mail),
          UiHelper.CustomTextField(passwordController, "Enter Password", false, Icons.lock),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(onPressed: (){
                SignIn(emailController.text.toString(), passwordController.text.toString());
              }, child: Text("Sign In")),
              TextButton(onPressed: (){
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>ForgatePassword()));
              }, child: Text("Forgate Password"))
            ],
          ),
          ElevatedButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>VerifyUser()));
          }, child: Text("Verify"))
        ],
      ),
    );
  }
}
