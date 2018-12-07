import 'package:flutter/material.dart';

class SuccessPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Pay At Once", style: TextStyle(color: Colors.black)),
        iconTheme: IconThemeData(color: Colors.black),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: ListView(children: [
        Container(
          child: Image.asset(
            "assets/tick3.gif",
            alignment: Alignment.topCenter,
          ),
        ),
        Padding(
          padding: EdgeInsets.all(10.0),
          child: const Card(
            elevation: 4.0,
            child: Text(
              "Bills Paid",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.teal,
                fontSize: 34,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.all(10.0),
          child: const Card(
            elevation: 4.0,
            child: Text(
              "Thankyou for using Pay At Once",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.teal,
                fontSize: 22,
                fontWeight: FontWeight.w200,
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.all(10.0),
          child: FlatButton(
            onPressed: () {},
            child: Row(
              children: [
                Padding(
                  padding:
                      EdgeInsets.only(left: 8, top: 2, right: 2, bottom: 2),
                  child: Text(
                    "Download Bill",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.w200,
                    ),
                  ),
                ),
                Icon(
                  Icons.archive,
                  color: Colors.deepPurpleAccent,
                )
              ],
              mainAxisAlignment: MainAxisAlignment.center,
            ),
          ),
        ),
      ]),
    );
  }
}
