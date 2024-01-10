import 'package:flutter/material.dart';

class gridview02 extends StatefulWidget {
  const gridview02({super.key});

  @override
  State<gridview02> createState() => _gridview02State();
}

class _gridview02State extends State<gridview02> {

 var arrCount=[
   {
     "Image":"https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSZ719Z6hBIOhAXVdshkWgH5IxYlgteXuknGQ&usqp=CAU"
   },{
     "Image":"https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSZ719Z6hBIOhAXVdshkWgH5IxYlgteXuknGQ&usqp=CAU"
   },{
     "Image":"https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSZ719Z6hBIOhAXVdshkWgH5IxYlgteXuknGQ&usqp=CAU"
   },{
     "Image":"https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSZ719Z6hBIOhAXVdshkWgH5IxYlgteXuknGQ&usqp=CAU"
   },{
     "Image":"https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSZ719Z6hBIOhAXVdshkWgH5IxYlgteXuknGQ&usqp=CAU"
   },{
     "Image":"https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSZ719Z6hBIOhAXVdshkWgH5IxYlgteXuknGQ&usqp=CAU"
   },{
     "Image":"https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSZ719Z6hBIOhAXVdshkWgH5IxYlgteXuknGQ&usqp=CAU"
   },{
     "Image":"https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSZ719Z6hBIOhAXVdshkWgH5IxYlgteXuknGQ&usqp=CAU"
   },{
     "Image":"https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSZ719Z6hBIOhAXVdshkWgH5IxYlgteXuknGQ&usqp=CAU"
   },{
     "Image":"https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSZ719Z6hBIOhAXVdshkWgH5IxYlgteXuknGQ&usqp=CAU"
   },{
     "Image":"https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSZ719Z6hBIOhAXVdshkWgH5IxYlgteXuknGQ&usqp=CAU"
   },
 ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Grid View Builder"),
        centerTitle: true,
        backgroundColor: Colors.amber,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3,crossAxisSpacing: 20,mainAxisSpacing: 20), itemBuilder: (context,index){
          return Container(
            clipBehavior: Clip.antiAlias,
            height: 100,
            width: 100,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(9)
            ),
            child: Image.network("${arrCount[index]["Image"]}",fit: BoxFit.cover,),
          );
        },itemCount: arrCount.length,),
      ),
    );
  }
}
