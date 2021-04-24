import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'MapSample.dart';
import 'Payment.dart';
class Event extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _State();
}
class _State extends State<Event> {
  int counter=0;
  String value;
  increment(){
    setState(() {
      counter++;
    });
  }
  decrement(){
    setState(() {
      counter--;
    });
  }
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
                        Padding(padding: EdgeInsets.all(30),child:Text(snapshot.data.docs[0]['description'],style: TextStyle(fontSize: 20, fontStyle: FontStyle.italic, color: Colors.blueGrey, ))),
                      Container(child:Row(children: <Widget>[Padding(padding: EdgeInsets.only(left:100,right: 10),child:Text('Date : ',style: TextStyle(fontSize: 18))),
                        Text(snapshot.data.docs[0]['date'],style: TextStyle(fontSize: 18)),
                      ])),
                      Container(child:Row(children: <Widget>[Padding(padding: EdgeInsets.only(left:100,right: 10),child:Text('Time : ',style: TextStyle(fontSize: 18))),
                        Text(snapshot.data.docs[0]['time'],style: TextStyle(fontSize: 18)),
                      ])),
                      Container(child:Row(children: <Widget>[Padding(padding: EdgeInsets.only(left:40,right: 10),child:Text('Location : ',style: TextStyle(fontSize: 18))),
                        Text(snapshot.data.docs[0]['location'],style: TextStyle(fontSize: 18)),
                      ])),
                      Container(child:Column(children: <Widget>[FloatingActionButton(child:Icon(Icons.add_location_alt_rounded),onPressed:(){MapUtils.openMap(snapshot.data.docs[0]['latitude'],snapshot.data.docs[0]['longitude']);})],
                          mainAxisAlignment: MainAxisAlignment.center,
                      )),
                      Container(
                        child: Column(
                          children: <Widget>[
                            Text(
                              '$counter',style: TextStyle(fontSize: 40),
                            ),
                            SizedBox(
                              height: 20.0,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  ElevatedButton(onPressed: (){
                                      decrement();
                                  }, child: Icon(Icons.remove),
                                  ),
                                  SizedBox(width: 20,),
                                  ElevatedButton(onPressed: (){
                                          increment();
                                  }, child: Icon(Icons.add),
                                  )
                                ]
                            )
                          ],
                        ),
                      ),
                      Container(padding: EdgeInsets.fromLTRB(10, 50, 10, 10),
                        child: Text((snapshot.data.docs[0]['price']*counter).toString()),

                      ),
                      Container(padding: EdgeInsets.fromLTRB(10, 50, 10, 10),
                        child: ElevatedButton(child:Text("Book Now"),onPressed:(){Navigator.push(context, MaterialPageRoute(builder: (context) => Payment(


                        )),);},
                        ),
                      ),
                ],
                    )
                    )
                  ]
              )
              );
            },
          )
        );
  }
}