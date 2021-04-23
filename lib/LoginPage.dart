import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:groupProject/SignIn.dart';
import 'package:groupProject/Payment.dart';
import 'package:groupProject/FitnessEventPage.dart';

import 'MapSample.dart';

class LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _State();
}

class _State extends State<LoginPage> {
  FirebaseAuth _auth = FirebaseAuth.instance;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('WE FIT'),
        ),
        body:
        Padding(
            padding: EdgeInsets.all(10),
              child:Form(
                key: formkey,
              child: ListView(
              children: <Widget>[
                Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(10),
                    child: Text(
                      'WeFit',
                      style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.w500,
                          fontSize: 30),
                    )),
                Container(
                  padding: EdgeInsets.all(10),
                  child: TextFormField(
                    validator: (value){
                      if (value==null||value.isEmpty) {
                        return 'Required';
                      }
                      else {
                        return null;
                      }
                    },
                    controller: emailController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Email ',
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: TextFormField(
                    validator: (value){
                      if (value==null||value.isEmpty) {
                        return 'Required';
                      }
                      else {
                        return null;
                      }
                    },
                    obscureText: true,
                    controller: passwordController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Password ',
                    ),
                  ),
                ),
                Text((''),
                ),
                Container(
                    padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                    child: ElevatedButton(
                      child: Text('Login'),
                      onPressed: () {
                        if(formkey.currentState.validate()){
                          _signInWithEmailAndPassword();
                        }
                        else{
                          return null;
                        }
                      },
                    )),


                Container(
                    child: Row(
                      children: <Widget>[
                        Text('Do not have an account?'),
                        TextButton(
                          child: Text(
                            'Sign Up',
                            style: TextStyle(fontSize: 20),
                          ),
                          onPressed: () {
                            //signup screen
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => SignIn()),
                            );
                          },
                        )
                      ],
                      mainAxisAlignment: MainAxisAlignment.center,
                    )),
                Container(
                    child: Row(
                      children: <Widget>[
                        TextButton(
                          child: Text(
                            'Pay',
                            style: TextStyle(fontSize: 20),
                          ),
                          onPressed: () {
                            //signup screen
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => Payment()),
                            );
                          },
                        )
                      ],
                      mainAxisAlignment: MainAxisAlignment.center,
                    )),
                Container(
                    child: Row(
                      children: <Widget>[
                    RaisedButton(child:Text("Open Maps"),onPressed:(){
                      MapUtils.openMap(-3.823216,-38.481700);
                    }
                    )],
                      mainAxisAlignment: MainAxisAlignment.center,
                    )),
              ],
            )))
    );
  }
  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void _signInWithEmailAndPassword() async {
    try {
      final User user = (await _auth.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      ))
          .user;
      if (!user.emailVerified) {
        await user.sendEmailVerification();
      }
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) {
        return FitnessEventPage(
        );
      }));
    } catch (e) {
      print(e.toString());
    }
  }

  void _signOut() async {
    await _auth.signOut();
  }
}