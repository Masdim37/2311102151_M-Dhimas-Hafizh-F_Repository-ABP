import 'package:flutter/material.dart';

main() => runApp(flutter1());


class flutter1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
   return MaterialApp(
    home: Scaffold(
    appBar:AppBar(title: Text("ini aplikasi saya ")) ,
    body: Container(
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 30),
      decoration: BoxDecoration(
        color: Colors.red,
        border: Border(
          bottom: BorderSide(width: 3,color: Colors.black12),
          left: BorderSide(width: 3,color: Colors.black12),
          right: BorderSide(width: 3, color: Colors.deepPurpleAccent),
          top: BorderSide(width: 3, color: Colors.teal)

        )
      ),
      child: Center(child: Text("belajar container"),),
      //height: 200,
      //width: 200,
      width: double.infinity,
      height: 100,
    ),
    ),
    ); 
  }

}