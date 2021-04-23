import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'MapSample.dart';
class Event extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _State();
}
class _State extends State<Event> {
  @override
  Widget build(BuildContext context) {
        return new Scaffold(
          appBar: new AppBar(
            title: new Text('Event'),
          ),
          body: StreamBuilder(
            stream: FirebaseFirestore.instance.collection('events').snapshots(),
            builder: (BuildContext context,AsyncSnapshot<QuerySnapshot> snapshot){
             if(!snapshot.hasData) return Center(
               child: CircularProgressIndicator(),
             );
              return Container(
                child: ListView(
                  children: <Widget>[
                    Container(child:Column(children: <Widget>[Text(snapshot.data.docs[0]['title'],style: TextStyle( color: Colors.blue,fontSize: 30,fontWeight: FontWeight.bold)),
                        Padding(padding: EdgeInsets.all(30),child:Text(snapshot.data.docs[0]['description'],style: TextStyle(fontSize: 22, fontStyle: FontStyle.italic, color: Colors.blueGrey, ))),
                      Container(child:Row(children: <Widget>[Padding(padding: EdgeInsets.only(left:100,right: 30),child:Text('Date : ',style: TextStyle(fontSize: 22))),
                        Text(snapshot.data.docs[0]['date'],style: TextStyle(fontSize: 20)),
                      ])),
                      Container(child:Row(children: <Widget>[Padding(padding: EdgeInsets.only(left:40,right: 30),child:Text('Location : ',style: TextStyle(fontSize: 22))),
                        Text(snapshot.data.docs[0]['location'],style: TextStyle(fontSize: 20)),
                      ])),
                      Container(child: Row(children: <Widget>[RaisedButton(child:Text("Open Location"),onPressed:(){MapUtils.openMap(snapshot.data.docs[0]['latitude'],snapshot.data.docs[0]['longitude']);})],
                          mainAxisAlignment: MainAxisAlignment.center,
                        ))

                  ],
                ),
              ),
                  ]
                )
              );
            },

          ));

  }
}