import 'package:flutter/material.dart';

class EventListView extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          EventList(
            image: 'images/run.jpeg',
            caption: 'Marathon',
          ),
          EventList(
            image: 'images/yoga.jpeg',
            caption: 'Outdoor Yoga',
          ),
          EventList(
            image: 'images/zumba.jpeg',
            caption: 'Zumba Dance',
          ),
        ],

      ),
    );
  }
}

class EventList extends StatelessWidget {
  final String image;
  final String caption;

  EventList({this.image, this.caption});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      child: InkWell(
        onTap: (){},
        child: ListTile(
          title: Image.asset(image),
          subtitle: Container(
            alignment:Alignment.topCenter,
            child: Text(caption),
          ),
        ),
      ),
    );
  }
}