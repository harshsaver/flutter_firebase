import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

void main() => runApp(MyApp());

String uText,dText;

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              TextField(onChanged: (text1){uText = text1;},),
              RaisedButton(onPressed: (){_uploadToServer(uText);}, child: Text("Set"),),
              Text(dText),
              RaisedButton(onPressed: (){dText = "getData()";}, child: Text("Get"),),
            ],
          ),
        ),
      ),
    );
  }

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return null;
  }
}



  void _uploadToServer(String u){
    FirebaseDatabase.instance.reference().child('testNode')
        .set({
      'title': 'Test Title',
      'content': u
    });
  }

Future<String> getData() async {
  String result = (await FirebaseDatabase.instance.reference().child("test").once()).value;
  print("I got " + result);
  return result;
}

