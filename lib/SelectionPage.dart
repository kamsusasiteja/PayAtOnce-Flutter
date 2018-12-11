import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class SelectionPage extends StatefulWidget {
  @override
  createState() => _SelectionPage();
}

class _SelectionPage extends State<SelectionPage> {

  @override
  void initState() {

  }

  int totalSum = 0;

  Map<String, bool> values = {
    'Internet': false,
    'Electricity': false,
    'DTH': false,
    'Water': false,
    'Dairy Products': false,
    'Insurance': false,
  };

  Map<String, int> value1 = {
    "DTH": 499,
    "Dairy Products": 900,
    "Electricity": 1589,
    "Insurance": 2599,
    "Internet": 759,
    "Water": 399
  };

//  _fetchPost() async {
//    final response = await http.get('https://pay-at-once-8f86e.firebaseio.com/users/9182163905.json');
//    if (response.statusCode == 200) {
//      value1 = json.decode(response.body);
//    }
//  }

  @override
  Widget build(BuildContext context) {

    final name = Text(
      'Select Bills to Pay',
      style: TextStyle(fontSize: 24.0),
    );

    var selectionPanel = Card(
      elevation: 4.0,
      margin: EdgeInsets.only(left: 10.0, right: 10.0),
      child: ListView(
        shrinkWrap: true,
        padding: EdgeInsets.only(left: 18.0, right: 18.0),
        children: value1.keys.map((String key) {
          return new CheckboxListTile(
            title: new Text(key),
            value: values[key],
            onChanged: (bool value) {
              setState(() {
                values[key] = value;
                totalSum = value? totalSum + value1[key] : totalSum - value1[key];
                });
            },
          );
        }).toList(),
      ),
    );

    final totalDisplay = Card(
      elevation: 4,
      margin: EdgeInsets.only(left: 10.0, right: 10.0),
      child: Column(
        children: <Widget>[
          SizedBox(height: 10.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Total :',
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(width: 10.0),
              Text(
                '₹ ' + totalSum.toString(),
                style: TextStyle(fontSize: 20.0),
              )
            ],
          ),
          SizedBox(height: 10.0),
        ],
      ),
    );

    return Scaffold(
      appBar: AppBar(
        title: Text("Pay At Once", style: TextStyle(color: Colors.black)),
        iconTheme: IconThemeData(color: Colors.black),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          SizedBox(height: 10.0),
          Center(child: name),
          SizedBox(height: 10.0),
          Center(child: selectionPanel),
          SizedBox(height: 10.0),
          totalDisplay,
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        icon: Icon(
            IconData(0xe86c,
                fontFamily: 'MaterialIcons', matchTextDirection: true),
            color: Colors.white),
        label: Text("Check Out"),
        elevation: 4.0,
        onPressed: () {
          Navigator.of(context).pushNamed('/SuccessPage');
        },
        backgroundColor: Colors.green,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
