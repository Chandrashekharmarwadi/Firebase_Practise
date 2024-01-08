import 'package:chandu_firebase_module_practise/Screens/signin_page.dart';
import 'package:chandu_firebase_module_practise/Widgets/uihelper_class.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ForgatePassword extends StatefulWidget {
  const ForgatePassword({super.key});

  @override
  State<ForgatePassword> createState() => _ForgatePasswordState();
}

class _ForgatePasswordState extends State<ForgatePassword> {
  TextEditingController emailController = TextEditingController();

  ForgatePassword(String email)async{
    if(email==""){
      return UiHelper.CustomAlertBox(context, "Email is required");
    }
    else{
        try{
          FirebaseAuth.instance.sendPasswordResetEmail(email: email).then((value){
            return UiHelper.CustomAlertBox(context, "Password reset mail has been send on email Account");
          });
        }
        catch (e){
          return UiHelper.CustomAlertBox(context, e.toString());
        }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: Text("Forgate Password"),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          UiHelper.CustomTextField(emailController, "Enter Email", false, Icons.mail),
          SizedBox(height: 20,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(onPressed: (){
                ForgatePassword(emailController.text.toString());
              }, child: Text("Forgate Password")),
              TextButton(onPressed: (){
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>SignIn()));
              }, child: Text("Sign In"))
            ],
          ),
        ],
      ),
    );
  }
}
