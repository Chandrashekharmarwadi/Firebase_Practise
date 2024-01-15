import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class FetchProfile extends StatefulWidget {
  const FetchProfile({super.key});

  @override
  State<FetchProfile> createState() => _FetchProfileState();
}

class _FetchProfileState extends State<FetchProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan,
        title: Text("Fetch Profile"),
        centerTitle: true,
      ),
      body: StreamBuilder(stream: FirebaseFirestore.instance.collection("Images").snapshots(), builder: (context,snapshots){
        if(snapshots.connectionState==ConnectionState.active){
          if(snapshots.hasData){
            return ListView.builder(itemBuilder: (context,index){
              return ListTile(
                leading: CircleAvatar(
                  backgroundImage: NetworkImage("${snapshots.data!.docs[index]["Image URL"]}"),
                ),
                title: Text("${snapshots.data!.docs[index]["Image"]}"),
              );
            },itemCount: snapshots.data!.docs.length,);
          }
          else if(snapshots.hasError){
            return Center(child: Text("${snapshots.hasError.toString()}"),);
          }
          else{
            return Center(child: Text("Data not found !!"),);
          }
        }
        else{
          return Center(child: CircularProgressIndicator(),);
        }
      }),
    );
  }
}
