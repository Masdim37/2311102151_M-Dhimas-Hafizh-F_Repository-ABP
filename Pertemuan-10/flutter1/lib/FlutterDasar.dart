//=== MAIN 1 (Button) ===
// import 'package:flutter/material.dart';

// main() => runApp(flutter1());

// class flutter1 extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//    return MaterialApp(
//     home: Scaffold(
//     appBar:AppBar(title: Text("ini aplikasi saya ")) ,
//     body: Center(child:
//     OutlinedButton(
//       onPressed: (){
//         print("button di tekan ");
//       },
//       style: OutlinedButton.styleFrom(
//         backgroundColor: Colors.amberAccent
//       ),
//       child: new Text("login")
//       ),),
//     ),
//     );
//   }
// }

// === MAIN 2 (Container) ===
// import 'package:flutter/material.dart';

// main() => runApp(flutter1());

// class flutter1 extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//    return MaterialApp(
//     home: Scaffold(
//     appBar:AppBar(title: Text("ini aplikasi saya ")) ,
//     body: Container(
//       padding: EdgeInsets.symmetric(vertical: 20, horizontal: 30),
//       decoration: BoxDecoration(
//         color: Colors.red,
//         border: Border(
//           bottom: BorderSide(width: 3,color: Colors.black12),
//           left: BorderSide(width: 3,color: Colors.black12),
//           right: BorderSide(width: 3, color: Colors.deepPurpleAccent),
//           top: BorderSide(width: 3, color: Colors.teal)

//         )
//       ),
//       child: Center(child: Text("belajar container"),),
//       //height: 200,
//       //width: 200,
//       width: double.infinity,
//       height: 100,
//     ),
//     ),
//     );
//   }

// }

// === MAIN 3 (flutter1) ===
// import 'package:flutter/material.dart';

// main() => runApp(flutter1());

// class flutter1 extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//    return MaterialApp(
//     home: Scaffold(
//     appBar:AppBar(title: Text("ini aplikasi saya ")) ,
//     body: Text("ini data saya "),
//     ),);
//   }

// }

// === MAIN 4 (Row & Column) ===
// import 'package:flutter/material.dart';

// main() => runApp(flutter1());

// class flutter1 extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//    return MaterialApp(
//     home: Scaffold(
//     appBar:AppBar(title:
//       Text("login ")) ,
//     body: Column(
//       children: [
//         Text("FROM LOGIN"),
//         Padding(
//           padding:EdgeInsets.all(20) ,
//           child: TextField( decoration: InputDecoration(
//             border: OutlineInputBorder(),
//             hintText: "silahkan masukan username"
//           ),
//           ),
//           ),
//         Padding(
//           padding:EdgeInsets.all(20) ,
//           child: TextField(
//             obscureText: true,
//             decoration: InputDecoration(
//             border: OutlineInputBorder(),
//             hintText: "silahkan masukan password"
//           )),
//           ),

//         ElevatedButton(onPressed: (){} ,child: Text("data")),

//       ],
//     ),

//     ),
//     );
//   }

// }

// === MAIN 5 (textfield) ===
// import 'package:flutter/material.dart';

// main() => runApp(flutter1());

// class flutter1 extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//    return MaterialApp(
//     home: Scaffold(
//     appBar:AppBar(title: Text("ini aplikasi saya ")) ,
//     body: TextField(
//       maxLength: 20,
//       decoration: InputDecoration(
//         border: new OutlineInputBorder(
//           borderRadius: new BorderRadius.circular(40),
//           borderSide: BorderSide(color: Colors.green)
//         ),
//         filled: true,
//         fillColor: Colors.blue,
//         labelText: "username",
//         hintText: "silahkan masukan user name ",
//         helperText: "masukan hanya 20 karakter",
//         prefixIcon: Icon(Icons.supervisor_account)
//       ),
//     ),

//     ),);
//   }

// }
