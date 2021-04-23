 import 'dart:ui';
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
                  title: Text('We Fit'),),
        body: Padding(padding: EdgeInsets.all(20),
              child: ListView(children: <Widget>[Text('Contact Us', style: TextStyle(color: Colors.blue, fontWeight: FontWeight.w500, fontSize: 30),textAlign: TextAlign.center,),
                Text('Welcome to Wefit!\n We are here to provide our loved users with extra-ordinary experience of fitness, This app can help you to stay fit by socializing with others.'
                    'This app guarantee you experience that no app has ever done before. Feel free to submit your enquires, we are available 24X7.',textAlign: TextAlign.center,style: TextStyle(color: Colors.blueGrey, fontWeight: FontWeight.w500, fontSize: 18)),
                    Text('Version 1.0.0 \n @2021 WeFit Inc.', textAlign: TextAlign.center),
                  Image(image: AssetImage("images/about.jpeg"),),
                    Padding(padding: EdgeInsets.all(10), child: FloatingActionButton(child:Icon(Icons.attach_email), onPressed: () {customLaunch('mailto:enquiry@wefit.ca?subject=test%20subject&body=test%20body');},),),
                      Padding(padding: EdgeInsets.all(10), child: FloatingActionButton(child: Icon(Icons.add_ic_call), onPressed: () {customLaunch('tel:+437 568 5232');},),)

    ],
              ),
    )
    );}
}

