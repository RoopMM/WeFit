import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
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
              return Center(
                child: Column(
                  children: <Widget>[
                    Container(child:Text(snapshot.data.docs[0]['field3'],style: TextStyle( color: Colors.blue,fontSize: 30))),
                    Container(padding: EdgeInsets.all(30),child:Text(snapshot.data.docs[0]['field1'],style: TextStyle(fontSize: 22))),
                    Container(padding: EdgeInsets.all(30),child:Text('Date',style: TextStyle(fontSize: 22))),
                    Container(child:Text(snapshot.data.docs[0]['field2'],style: TextStyle(fontSize: 20))),

                  ],
                ),
              );
            },

          ));

  }
}

