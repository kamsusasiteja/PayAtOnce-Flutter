import 'package:flutter/material.dart';

class SelectionPage extends StatefulWidget {
  @override
  createState() => _SelectionPage();
}

class _SelectionPage extends State<SelectionPage> {
  int totalSum = 0;

  Map<String, bool> values = {
    'Internet': false,
    'Electricity': false,
    'DTH': false,
    'Water': false,
    'Dairy Products': false,
    'Insurance': false,
  };
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
        children: values.keys.map((String key) {
          return new CheckboxListTile(
            title: new Text(key),
            value: values[key],
            onChanged: (bool value) {
              setState(() {
                values[key] = value;
                totalSum = value? totalSum + 600 : totalSum - 600;
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

//CheckboxListTile(
//title: Text("Internet"),
//value: ,
//onChanged: (bool value) {
//setState(() {
//totalSum = value ? (totalSum + 600) : (totalSum - 600);
//});
//},
//),
//CheckboxListTile(
//title: Text("DTH"),
//value: false,
//onChanged: (bool value) {
//setState(() {
//totalSum = value ? (totalSum + 600) : (totalSum - 600);
//});
//},
//)
