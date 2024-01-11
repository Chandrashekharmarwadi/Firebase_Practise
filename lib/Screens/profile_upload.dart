import 'dart:developer';
import 'dart:io';

import 'package:chandu_firebase_module_practise/Widgets/uihelper_class.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
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

  auth(String title) {
    if (title == "" && pickedimage == null) {
      return log("Enter Required field's");
    } else {
      uploadImage();
    }
  }

  uploadImage() async {
    UploadTask uploadTask = FirebaseStorage.instance
        .ref("Profile picture")
        .child(imagenameController.text.toString())
        .putFile(pickedimage!);

    TaskSnapshot taskSnapshot = await uploadTask;
    String imageurl = await taskSnapshot.ref.getDownloadURL();
    String imagename = await imagenameController.text.toString();

    FirebaseFirestore.instance.collection("Images").doc(imagename).set({
      "Image":imagename,
      "Image URL":imageurl
    }).then((value){
      return log("Data Uploaded");
    });
  }

  _showAlert() {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Pick image from"),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ListTile(
                  onTap: () {
                    imgPicker(ImageSource.gallery);
                    Navigator.pop(context);
                  },
                  title: Text("Gallery"),
                  trailing: Icon(Icons.image),
                ),
                ListTile(
                  onTap: () {
                    imgPicker(ImageSource.camera);
                    Navigator.pop(context);
                  },
                  title: Text("Camera"),
                  trailing: Icon(Icons.camera_alt),
                ),
              ],
            ),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text("Ok"))
            ],
          );
        });
  }
// Profile Upload Not Working
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
              onTap: () {
                _showAlert();
              },
              child: pickedimage != null
                  ? CircleAvatar(
                      radius: 70,
                      backgroundImage: FileImage(pickedimage!),
                    )
                  : CircleAvatar(
                      radius: 70,
                      child: Icon(Icons.person, size: 70),
                    )),
          SizedBox(
            height: 20,
          ),
          UiHelper.CustomTextField(
              imagenameController, "Enter Image Name", false, Icons.image),
          SizedBox(
            height: 20,
          ),
          ElevatedButton(
              onPressed: () {
                auth(imagenameController.text.toString());
              },
              child: Text("Save")),
        ],
      ),
    );
  }

  imgPicker(ImageSource imageSource) async {
    try {
      final image = await ImagePicker().pickImage(source: imageSource);
      if (image == null) return;
      final tempImage = File(image.path);
      setState(() {
        pickedimage = tempImage;
      });
    } catch (ex) {
      log(ex.toString());
    }
  }
}
