import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class HomeScreenChat extends StatefulWidget {
  const HomeScreenChat({super.key});

  @override
  State<HomeScreenChat> createState() => _HomeScreenChatState();
}

class _HomeScreenChatState extends State<HomeScreenChat> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: Text("My Chat"),
        centerTitle: true,
      ),
       body: StreamBuilder(stream: FirebaseFirestore.instance.collection("Chat").snapshots(), builder: (context,snapshots){
         if(snapshots.connectionState==ConnectionState.active){
           if(snapshots.hasData){
             return ListView.builder(itemBuilder: (context,index){
               return ListTile(
                 leading: CircleAvatar(child: Text("${index+1}"),),
                 title: Text("${snapshots.data!.docs[index]["Email"]}"),
                 subtitle: Text("${snapshots.data!.docs[index]["Password"]}"),
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
