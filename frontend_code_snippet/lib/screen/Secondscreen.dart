import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';

class Secondscreen extends StatefulWidget {
  // const Secondscreen({key, int rn}) : super(key: key);
  final int rn1;
  Secondscreen({this.rn1, int rn});

  @override
  State<Secondscreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<Secondscreen> {
  List<dynamic> users = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(' API Call'),
      ),
      body: ListView.builder(
        itemCount: users.length,
        itemBuilder: (context, index) {
          //print(itemCount);
          // final user = users[index];
          final fn = users[index]["firstName"];
          final ln = users[index]["lastName"];
          // final mn = user["Month"];
          final sn = users[index]["sales"];
          // final yr = user["Year"];
          final st = users[index]["target"];
          print(fn);
          print(ln);
          // print(mn);
          print(sn);
          // print(yr);
          print(st);
          return ListTile(
            title: Text("First Name :" +
                fn +
                " , Last Name :" +
                ln +
                ",  Sales :" +
                "$sn" +
                ",  Sales Target :" +
                "$st"),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: fetchUsers,
      ),
    );
  }

  void fetchUsers() async {
    print('fetchusers called');
    // const url = 'http://127.0.0.1:7777/';
    // final uri = Uri.parse(url);
    // print(uri);
    //final response = await http.get(uri);
    // print(response);
    // final body = response.body;
    // print(body);
    // final json = jsonDecode(body);
    // print(json);
    // setState(() {
    //   users = json[0]['salesData'];
    //   print(users);
    // });
    // print('fetchUsers completed');
    // print(users);
    String str = 'http://127.0.0.1:7777/user/';

    int rn1 = 0;
    str += rn1.toString();
    var url = Uri.parse(str);
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
