

import 'dart:developer';
import 'dart:io';


import 'package:chandu_firebase_module_practise/Widgets/uihelper_class.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';


class UploadProfile extends StatefulWidget {
  const UploadProfile({super.key});

  @override
  State<UploadProfile> createState() => _UploadProfileState();
}

class _UploadProfileState extends State<UploadProfile> {
  TextEditingController imagenameController = TextEditingController();
  File? pickedimage;

  _showAlert(){
    return showDialog(context: context, builder: (BuildContext context){
      return AlertDialog(
        title:Text("Pick image from"),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              onTap: (){
                pickedImage(ImageSource.gallery);
                Navigator.pop(context);
              },
              title: Text("Gallery"),
              trailing: Icon(Icons.image),
            ),
            ListTile(
              onTap: (){
                pickedImage(ImageSource.camera);
                Navigator.pop(context);
              },
              title: Text("Camera"),
              trailing: Icon(Icons.camera_alt),
            ),
          ],
        ),
        actions: [
          TextButton(onPressed: (){
            Navigator.pop(context);
          }, child: Text("Ok"))
        ],
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text("Upload Profile"),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: (){
              _showAlert();
            },
            child: pickedimage==null? CircleAvatar(
              radius: 70,
              child: Icon(Icons.person,size: 70),
            ) : CircleAvatar(
              radius: 70,
             backgroundImage: FileImage(pickedimage!),
            )
          ),
          SizedBox(height: 20,),
          UiHelper.CustomTextField(imagenameController, "Enter Image Name", false, Icons.image),
          SizedBox(height: 20,),
          ElevatedButton(onPressed: (){}, child: Text("Save")),
        ],
      ),
    );
  }
  pickedImage(ImageSource imageSource)async{
    try{
      final photo = await ImagePicker().pickImage(source: imageSource);
      if(photo==null)return;
      final tempImage = File(photo.path);
      setState(() {
        pickedimage==tempImage;
      });
    }
    catch(ex){
       log(ex.toString());
    }
  }
}
