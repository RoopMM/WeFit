import 'package:flutter/material.dart';


class SignIn extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _State();
}

class _State extends State<SignIn> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('SIGN UP'),
        ),
        body: Padding(
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
                    controller: nameController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'User Name',
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
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
                      labelText: 'Password',
                    ),
                  ),
                ),
                Container(
                    padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
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
                          labelText:'Confirm Password'
                      ),
                    )
                ),
                Container(
                    child: Row(
                      children: <Widget>[
                        TextButton(
                          child: Text(
                            'SIGN UP',
                            style: TextStyle(fontSize: 20),
                          ),
                          onPressed: () {
                            //signup screen
                            if(formkey.currentState.validate()){

                            }
                            else{
                              return null;
                            }
                          },
                        )
                      ],
                      mainAxisAlignment: MainAxisAlignment.center,
                    ))
              ],
            )))
    );
  }
}