import 'package:flutter/material.dart';
import 'package:groupProject/LoginPage.dart';
import 'package:groupProject/listviews/EventListView.dart';
import 'package:groupProject/About.dart';
import 'About.dart';
import 'Account.dart';
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
        title: Text('Event Page'),
      ),
      body:Container(width: 400,height:1000,
        child:Column(children: <Widget>[
          Padding(padding: const EdgeInsets.all(20),
            child: Text('Upcoming Events', style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30),),),
          EventListView(),
          Padding(padding: const EdgeInsets.all(20),
            child: Text('Track Your Event ',style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),),),
          // Container(
          //   child: Row(
          //     children: <Widget>[
          //       Padding(padding: const EdgeInsets.all(20), child: Text('Track Your Event ',style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),),),
          //     ],
          //   ),
          // )
        ],
      ),
    ));
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
                    image: AssetImage('images/run.jpeg'))),
          ),
          ListTile(
            leading: Icon(Icons.input),
            title: Text('Welcome'),
            onTap: () => {},
          ),
          ListTile(
            leading: Icon(Icons.verified_user),
            title: Text('Profile'),
            onTap: (){Navigator.push((context),MaterialPageRoute(builder: (context) => Account()),);},
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Settings'),
            onTap: () => {Navigator.of(context).pop()},
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