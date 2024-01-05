import 'package:chandu_firebase_module_practise/Screens/signin_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: Text("Home"),
        centerTitle: true,
        actions: [
          IconButton(onPressed: (){
            FirebaseAuth.instance.signOut().then((value){
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>SignIn()));
            });
          }, icon: Icon(Icons.logout)),
        ],
      ),
    );
  }
}
