import 'package:flutter/material.dart';
import 'package:groupProject/LoginPage.dart';
import 'package:groupProject/listviews/EventListView.dart';
import 'package:groupProject/About.dart';
import 'About.dart';
/*
Fitness Event Page, main page of the app
 */
class FitnessEventPage extends StatefulWidget {

  @override
  State<StatefulWidget> createState() => new _State();
}
class _State extends State<FitnessEventPage> {
  String latitudeData = "";
  String longitudeData = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavDrawer(),
      appBar: AppBar(
        title: Text('We Fit'),
      ),
      body:ListView(children: <Widget>[
          Padding(padding: const EdgeInsets.all(20),
            child: Text('Upcoming Events', style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30),),),
          EventListView(),
          Card(
            margin: EdgeInsets.symmetric(horizontal: 20.0,vertical: 5.0),
            clipBehavior: Clip.antiAlias,
            color: Colors.yellow,
            elevation: 5.0,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 22.0),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Column(
                      children: <Widget>[Text(
                        "Welcome Back",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                        ),),
                        SizedBox(
                          height: 5.0,
                        ),
                        Text(
                          'Making excuses burns zero calories per hour. Don’t let the scale define you. Be active, be healthy, be happy!!',
                          style: TextStyle(
                            fontSize: 20.0,
                            color: Colors.black,
                          ),
                        ),
                        ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
    padding: EdgeInsets.fromLTRB(10, 20, 10, 10),
              child:Text('Task for Today\n Chakrasana',style: TextStyle(fontSize: 30),textAlign: TextAlign.center,)),
          Container(
            child:Image.asset('images/asana.png')
          ),
          Container(child:Text('How to Perform?',style:TextStyle(fontSize: 30,color: Colors.amber,fontWeight: FontWeight.bold),textAlign: TextAlign.center,)),
          Container(
            child: Text('Lie flat on your back on the floor. Your hands must be placed behind your shoulders. '
                'Press your feet and palms, and lift your entire body off the mat. Hold the pose for a minute, or as long as you are comfortable. '
                'Then, release by bending your arms and legs, and gently lowering your back on the ground. ', style:TextStyle(fontSize: 15),textAlign: TextAlign.center,),
          )
          // Container(
          //   child: Row(
          //     children: <Widget>[
          //       Padding(padding: const EdgeInsets.all(20), child: Text('Track Your Event ',style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),),),
          //     ],
          //   ),
          // )
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.blue,
        child: Text('Version 1.0.0 \n @2021 WeFit Inc.', style: TextStyle(fontSize: 15), textAlign: TextAlign.center),
      ),
    );
  }

}
//This is the code for the side Nav-bar
class NavDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Text(
              'My Fit',
              style: TextStyle(color: Colors.blue,fontWeight: FontWeight.bold, fontSize: 25),
            ),
            decoration: BoxDecoration(
                color: Colors.blue,
                image: DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage('images/logo.jpg'))),
          ),

          ListTile(
            leading: Icon(Icons.border_color),
            title: Text('About Us'),
                  onTap: (){Navigator.push((context),MaterialPageRoute(builder: (context) => About()),);},
          ),
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text('Logout'),
            onTap: (){Navigator.push((context),MaterialPageRoute(builder: (context) => LoginPage()),);},
          ),
        ],
      ),
    );
  }
}