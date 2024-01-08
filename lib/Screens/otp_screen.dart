import 'package:chandu_firebase_module_practise/Screens/home_screen.dart';
import 'package:chandu_firebase_module_practise/Widgets/uihelper_class.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class OTPscreen extends StatefulWidget {
  String verificationId;
   OTPscreen({super.key,required this.verificationId});

  @override
  State<OTPscreen> createState() => _OTPscreenState();
}

class _OTPscreenState extends State<OTPscreen> {
  TextEditingController otpController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: Text("OTP Screen"),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          UiHelper.CustomTextField(otpController, "Enter OTP", false, Icons.confirmation_number),
          SizedBox(height: 20,),
          ElevatedButton(onPressed: ()async{
            try{
              PhoneAuthCredential credential = await PhoneAuthProvider.credential(verificationId: widget.verificationId, smsCode: otpController.text.toString());
              FirebaseAuth.instance.signInWithCredential(credential).then((value){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>HomeScreen()));
              });
            }
            catch(ex){
              return UiHelper.CustomAlertBox(context, ex.toString());
            }
          }, child: Text("OTP")),
        ],
      ),
    );
  }
}
