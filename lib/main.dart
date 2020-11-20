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
  TextEditingController weightController = TextEditingController();
  TextEditingController heightController = TextEditingController();

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String _info = "Enter your data!";

  void _resetFields(){
    weightController.text = "";
    heightController.text = "";

    setState(() {
      _info = "Enter your data!";
      _formKey = GlobalKey<FormState>();
    });
  }

  void calc() {
    setState(() {
      double weight = double.parse(weightController.text);
      double height = double.parse(heightController.text) / 100;
      double bmi = weight / (height * height);

      if(bmi < 18.6) {
        _info = "Under weight (${bmi.toStringAsPrecision(2)})";
      } else {
        _info = "Not under weight (${bmi.toStringAsPrecision(3)})";
      }
    });
  }

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
              onPressed: _resetFields
          )
        ],
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Icon(Icons.person_outline,
                  size: 120,
                  color: Colors.green
              ),
              TextFormField(
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
                ),
                controller: weightController,
                validator: (value) {
                  if(value.isEmpty) {
                    return "Enter your weight!";
                  }
                },
              ),
              TextFormField(
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
                ),
                controller: heightController,
                validator: (value) {
                  if(value.isEmpty) {
                    return "Enter your height!";
                  }
                }
              ),
              Padding(
                padding: EdgeInsets.only(
                    top: 10,
                    bottom: 10
                ),
                child: Container(
                  height: 50,
                  child: RaisedButton(
                    onPressed: () {
                      if(_formKey.currentState.validate()) {
                        calc();
                      }
                    },
                    child: Text("Calc",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 25
                        )
                    ),
                    color: Colors.green,
                  ),
                ),
              ),
              Text(_info,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.green,
                      fontSize: 25
                  )
              )
            ],
          ),
        ),
      )
    );
  }
}
