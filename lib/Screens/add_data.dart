import 'dart:developer';

import 'package:chandu_firebase_module_practise/Widgets/uihelper_class.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AddData extends StatefulWidget {
  const AddData({super.key});

  @override
  State<AddData> createState() => _AddDataState();
}

class _AddDataState extends State<AddData> {
  TextEditingController titleController = TextEditingController();
  TextEditingController descController = TextEditingController();

  addData(String title,String desc)async{
    if(title=="" && desc==""){
      return UiHelper.CustomAlertBox(context, "Enter required field's");
    }
    else{
      FirebaseFirestore.instance.collection("Notes").doc(title).set({
        "Title":title,
        // "Description":desc,
      }).then((value){
        return log("Data Inserted");
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text("Add Data"),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
        UiHelper.CustomTextField(titleController, "Enter Title", false, Icons.title),
        UiHelper.CustomTextField(descController, "Enter Description", false, Icons.description_outlined),
        SizedBox(height: 20,),
        ElevatedButton(onPressed: (){
          addData(titleController.text.toString(), descController.text.toString());
        }, child: Text("Add Data"))
      ],),
    );
  }
}
