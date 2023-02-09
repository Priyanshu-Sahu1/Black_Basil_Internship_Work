import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';

class SecondScreenWithData extends StatelessWidget {
  // Declare a field that holds the Person data
  final rn1;

  // In the constructor, require a Person
  SecondScreenWithData({Key key, @required this.rn1, int rn}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Second Screen With Data"),
      ),
      body: new Center(
          child: new Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          // Display passed data from first screen
          new Text(" "),
          new ElevatedButton(
              child: new Text("Display Data"),
              onPressed: () async {
                // Navigate back to first screen when tapped!
                String str = 'http://127.0.0.1:7777/user/';

                //int rn1 = 0;
                str += rn1.toString();
                var url = Uri.parse(str);
                if (await canLaunchUrl(url)) {
                  await launchUrl(url);
                } else {
                  throw 'Could not launch $url';
                }
              }),
        ],
      )),
    );
  }
}
