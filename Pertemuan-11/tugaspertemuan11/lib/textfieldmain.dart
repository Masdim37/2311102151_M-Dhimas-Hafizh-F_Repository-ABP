import 'package:flutter/material.dart';

main() => runApp(flutter1());


class flutter1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
   return MaterialApp(
    home: Scaffold(
    appBar:AppBar(title: Text("ini aplikasi saya ")) ,
    body: TextField(
      maxLength: 20,
      decoration: InputDecoration(
        border: new OutlineInputBorder(
          borderRadius: new BorderRadius.circular(40),
          borderSide: BorderSide(color: Colors.green)
        ),
        filled: true,
        fillColor: Colors.blue,
        labelText: "username",
        hintText: "silahkan masukan user name ",
        helperText: "masukan hanya 20 karakter",
        prefixIcon: Icon(Icons.supervisor_account)
      ),
    ),
      
    ),); 
  }

}