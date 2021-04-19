import 'package:flutter/material.dart';
import 'package:group_project_1/listviews/EventListView.dart';
class FitnessEventPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _State();
}
class _State extends State<FitnessEventPage> {
  String latitudeData="";
  String longitudeData="";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Event Page'),
      ),
      body: ListView(
        children: <Widget>[
          Padding(padding: const EdgeInsets.all(20),
            child: Text(
              'Upcoming Events',
              style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30),
            ),
          ),
          EventListView(),
          Container(
            child: Row(
              children: <Widget>[
                Padding(padding: const EdgeInsets.all(20),
                  child: Text('Track Your Event ',style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                  ),
                ),
              ],
            ),
          )
        ],

      ),
    );
  }

}