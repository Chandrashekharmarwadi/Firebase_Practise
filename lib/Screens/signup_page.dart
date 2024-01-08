

import 'package:chandu_firebase_module_practise/Screens/signin_page.dart';
import 'package:chandu_firebase_module_practise/Widgets/uihelper_class.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'dart:developer';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignInState();
}

class _SignInState extends State<SignUp> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

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
         FirebaseFirestore.instance.collection("User").doc(email).set({
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
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: Text("Sign Up"),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Sign Up",style: TextStyle(fontSize: 32,fontWeight: FontWeight.bold),),
          UiHelper.CustomTextField(emailController, "Enter Email", false, Icons.mail),
          UiHelper.CustomTextField(passwordController, "Enter Password", true, Icons.lock),
          SizedBox(height: 20,),
          ElevatedButton(onPressed: (){
            SignUp(emailController.text.toString(), passwordController.text.toString());
          }, child: Text("Sign Up")),

          ElevatedButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>SignIn()));
          }, child: Text("Sign In"))
        ],
      ),
    );
  }
}
