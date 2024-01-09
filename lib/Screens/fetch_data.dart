import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Fetchdata extends StatefulWidget {
  const Fetchdata({super.key});

  @override
  State<Fetchdata> createState() => _FetchdataState();
}

class _FetchdataState extends State<Fetchdata> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: Text("Fetch Data"),
        centerTitle: true,
      ),
      body: StreamBuilder(stream: FirebaseFirestore.instance.collection("User").orderBy("Email",descending: true).snapshots(), builder: (context,snapshots){
        if(snapshots.connectionState==ConnectionState.active){
          if(snapshots.hasData){
            return ListView.builder(itemBuilder: (context,index){
              return ListTile(
                leading: CircleAvatar(child: Text("${index+1}")),
                title: Text("${snapshots.data!.docs[index]["Email"]}"),
              );
            },itemCount: snapshots.data!.docs.length,);
          }
          else if(snapshots.hasError){
            return Center(child: Text("${snapshots.hasError.toString()}"),);
          }
          else{
            return Center(child: Text("Data Not Found !!"),);
          }

        }
        else{
          return Center(child: CircularProgressIndicator(),);
        }
      }),
    );
  }
}
