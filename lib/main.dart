import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

void main() => runApp(MyApp());

String text;

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          TextField(),
          RaisedButton(onPressed: (){}, child: Text("Button1"),),
          Text(text),
          RaisedButton(onPressed: (){}, child: Text("Button2"),),
        ],
      ),
    );
  }
}



  void _uploadToServer(){


  }

