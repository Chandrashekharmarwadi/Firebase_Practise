import 'package:chandu_firebase_module_practise/Widgets/uihelper_class.dart';
import 'package:flutter/material.dart';

class OTPscreen extends StatefulWidget {
  const OTPscreen({super.key});

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
        children: [
          UiHelper.CustomTextField(otpController, "Enter OTP", false, Icons.confirmation_number),
          SizedBox(height: 20,),
          ElevatedButton(onPressed: (){}, child: Text("OTP")),
        ],
      ),
    );
  }
}
