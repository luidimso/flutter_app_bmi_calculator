import 'package:flutter/material.dart';

void main(){
 runApp(MaterialApp(
   home: new Home()
 ));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BMI Calculator"),
        centerTitle: true,
        backgroundColor: Colors.green,
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.refresh),
              onPressed: () {}
          )
        ],
      ),
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Icon(Icons.person_outline,
            size: 120,
            color: Colors.green
          ),
          TextField(
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              labelText: "Weight",
              labelStyle: TextStyle(
                color: Colors.green
              )
            ),
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.green,
              fontSize: 25
            )
          ),
          TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  labelText: "Height",
                  labelStyle: TextStyle(
                      color: Colors.green
                  )
              ),
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.green,
                  fontSize: 25
              )
          )
        ],
      )
    );
  }
}
