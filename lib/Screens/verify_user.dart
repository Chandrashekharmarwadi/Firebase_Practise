import 'package:chandu_firebase_module_practise/Screens/otp_screen.dart';
import 'package:chandu_firebase_module_practise/Widgets/uihelper_class.dart';
import 'package:firebase_auth/firebase_auth.dart';
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
      //Phone Authentication Not Working
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          UiHelper.CustomTextField(
              phoneController, "Enter Phone Number", false, Icons.phone),
          ElevatedButton(
              onPressed: () async {
                await FirebaseAuth.instance.verifyPhoneNumber(
                    verificationCompleted: (PhoneAuthCredential credential) {},
                    verificationFailed: (FirebaseAuthException ex) {},
                    codeSent: (String verificationId, int? resendtoken) {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>OTPscreen(verificationId: verificationId,)));
                    },
                    codeAutoRetrievalTimeout: (String verificationId) {},phoneNumber: phoneController.text.toString());
              },
              child: Text("Number")),
        ],
      ),
    );
  }
}
