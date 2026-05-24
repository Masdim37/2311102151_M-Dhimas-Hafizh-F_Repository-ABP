import 'package:flutter/material.dart';

main() => runApp(flutter1());


class flutter1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
   return MaterialApp(
    home: Scaffold(
    appBar:AppBar(title: Text("ini aplikasi saya ")) ,
    body: Center(child: 
    OutlinedButton(
      onPressed: (){
        print("button di tekan ");
      }, 
      style: OutlinedButton.styleFrom(
        backgroundColor: Colors.amberAccent
      ),
      child: new Text("login")
      ),),
    ),
    ); 
  }

}