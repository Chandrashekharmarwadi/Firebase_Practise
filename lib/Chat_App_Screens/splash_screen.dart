import 'dart:async';

import 'package:chandu_firebase_module_practise/Chat_App_Screens/sign_up_screen.dart';
import 'package:flutter/material.dart';

import 'home_screen_chat.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 3),(){
      Navigator.push(context, MaterialPageRoute(builder: (context)=>HomeScreenChat()));
    });
  }
  
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0XFFe2ebdf),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.message,size: 180*0.8,),
              SizedBox(height: 25*0.2,),
              Text("Welcome to chat app ",style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),)
            ],
          ),
        ),
      ),
    );
  }
}
