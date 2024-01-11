import 'package:chandu_firebase_module_practise/Chat_App_Screens/log_in_screen.dart';
import 'package:chandu_firebase_module_practise/Chat_App_Screens/splash_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class CheckChatUserApp extends StatefulWidget {
  const CheckChatUserApp({super.key});

  @override
  State<CheckChatUserApp> createState() => _CheckChatUserAppState();
}

class _CheckChatUserAppState extends State<CheckChatUserApp> {
  @override
  Widget build(BuildContext context) {
    return checkchatuser();
  }
  checkchatuser(){
    final chatUser = FirebaseAuth.instance.currentUser;
    if(chatUser!=null){
      return SplashScreen();
    }
    else{
      return LogInScreen();
    }
  }
}
