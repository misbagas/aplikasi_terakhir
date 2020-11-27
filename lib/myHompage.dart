import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyhomePage extends StatefulWidget {
  @override
  _MyhomePageState createState() => _MyhomePageState();
}

class _MyhomePageState extends State<MyhomePage> {
  int weight = 3;
  int height = 49;
  double bmi = 0;

  String calculate() {
    setState(() {
      bmi = weight / pow(weight / 100, 2);
      return bmi.toStringAsFixed(1);
    });
  }

  String getResult() {
    if (bmi >= 25) {
      return "overweight";
    } else if (bmi > 18.5) {
      return "normal";
    } else {
      return "Hasil";
    }
  }

  String getDescription() {
    if (bmi >= 25) {
      return ("Lu punya berat badan tinggi di atas normal rata rata");
    } else if (bmi > 18.5) {
      return "berat badan anda normal";
    } else {
      return "berat badan anda tidak tinggi";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "BMI",
        ),
        centerTitle: true,
      ),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          TextField(
            onChanged: (value) {
              height = int.parse(value);
            },
            decoration: InputDecoration(hintText: 'Height'),
          ),
          SizedBox(
            height: 20,
          ),
          TextField(
            onChanged: (value) {
              weight = int.parse(value);
            },
            decoration: InputDecoration(hintText: 'Weight'),
          ),
          SizedBox(
            height: 20,
          ),
          RaisedButton(
            onPressed: calculate,
            child: Text("Calculate"),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(getResult(),),
                SizedBox(height: 20,),
                Text(getDescription()),
              ],),
          )
        ],
      ),
    );
  }
}
