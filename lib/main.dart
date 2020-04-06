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
        body: SafeArea(
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: TextField(onChanged: (text1){uText = text1;},),
                ),
                RaisedButton(onPressed: (){

                  _uploadToServer(uText);

                  }, child: Text("Set"),),  //call function to upload to server
                Text(dText??"Text yet to come"),
                RaisedButton(onPressed: (){getData();}, child: Text("Get"),),
              ],
            ),
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



  void _uploadToServer(String u){ //function to upload to server

    FirebaseDatabase.instance.reference().child("Users").push()
        .set({
      'Name': " ",
      'Age': " "
    });

    getData();
  }

Future<String> getData() async {
  String result = (await FirebaseDatabase.instance.reference().child("value").once()).value;
  print("I got " + result);
  dText = result;
  return result;
}

