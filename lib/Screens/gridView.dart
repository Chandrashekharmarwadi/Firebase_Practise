import 'package:flutter/material.dart';

class gridview extends StatefulWidget {
  const gridview({super.key});

  @override
  State<gridview> createState() => _gridviewState();
}

class _gridviewState extends State<gridview> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Grid View"),
        centerTitle: true,
        backgroundColor: Colors.amber,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,crossAxisSpacing: 20,mainAxisSpacing: 20),
          children: [
            Container(
                clipBehavior: Clip.antiAlias,
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(9)
                ),
                child: Image.network("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSZ719Z6hBIOhAXVdshkWgH5IxYlgteXuknGQ&usqp=CAU",fit: BoxFit.cover,)),
            Container(
                clipBehavior: Clip.antiAlias,
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(9)
                ),
                child: Image.network("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTiSe8m2FQVSQzSvbryLHXx8eCb1QG7GaYZ8g&usqp=CAU",fit: BoxFit.cover,)),
            Container(
                clipBehavior: Clip.antiAlias,
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(9)
                ),
                child: Image.network("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSZ719Z6hBIOhAXVdshkWgH5IxYlgteXuknGQ&usqp=CAU",fit: BoxFit.cover,)),
            Container(
                clipBehavior: Clip.antiAlias,
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(9)
                ),
                child: Image.network("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTiSe8m2FQVSQzSvbryLHXx8eCb1QG7GaYZ8g&usqp=CAU",fit: BoxFit.cover,)),
            Container(
                clipBehavior: Clip.antiAlias,
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(9)
                ),
                child: Image.network("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSZ719Z6hBIOhAXVdshkWgH5IxYlgteXuknGQ&usqp=CAU",fit: BoxFit.cover,)),
            Container(
                clipBehavior: Clip.antiAlias,
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(9)
                ),
                child: Image.network("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTiSe8m2FQVSQzSvbryLHXx8eCb1QG7GaYZ8g&usqp=CAU",fit: BoxFit.cover,))
          ],
        ),
      ),
    );
  }
}
