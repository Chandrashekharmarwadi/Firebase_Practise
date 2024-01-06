import 'package:chandu_firebase_module_practise/Widgets/uihelper_class.dart';
import 'package:flutter/material.dart';

class VerifyUser extends StatefulWidget {
  const VerifyUser({super.key});

  @override
  State<VerifyUser> createState() => _VerifyUserState();
}

class _VerifyUserState extends State<VerifyUser> {
  TextEditingController phoneController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: Text("Verify User"),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
        UiHelper.CustomTextField(phoneController, "Enter Phone Number", false, Icons.phone),
        ElevatedButton(onPressed: (){}, child: Text("Number")),
      ],),
    );
  }
}
