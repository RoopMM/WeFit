import 'package:flutter/material.dart';


class Payment extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _State();
}

class _State extends State<Payment> {

  final formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('PAYMENT'),
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
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Card Number'
                        ),
                      ),
                    ),
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
                        obscureText: true,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'CVV',
                        ),
                      ),
                    ),
                    Container(
                        padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
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
                          decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText:' Expiry Date'
                          ),
                        )
                    ),
                    ElevatedButton(
                        onPressed:(){
                          if(formkey.currentState.validate()){

                          }
                          else{
                            return null;
                          }
                        },
                        child: Text('PAY NOW'))
                  ],
                )))
    );
  }
}