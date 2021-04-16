// import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class About extends StatefulWidget {
  About({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _State createState() => _State();
}

class _State extends State<About> {
  void customLaunch(command) async {
    if (await canLaunch(command)) {
      await launch(command);
    } else {
      print(' could not launch $command');
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        title: Text('We Fit'),
    ),
        body: Padding(
        padding: EdgeInsets.all(10),
    child: ListView(
    children: <Widget>[
    Container(
      child: Image(image: AssetImage("images/about.jpeg"),),
    ),
      ElevatedButton(
        onPressed: () {
          customLaunch(
              'mailto:your@email.com?subject=test%20subject&body=test%20body');
        },
        child: Text('Email'),
      ),
      ElevatedButton(
        onPressed: () {
          customLaunch('tel:+437 568 5232');
        },
        child: Text('Phone'),
      )
    ]
    )
    )
    );}
}

