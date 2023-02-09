import 'dart:html';
import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:flutterwebapp_reload_detector/flutterwebapp_reload_detector.dart';
import 'package:frontend_code_snippet/screen/SecondScreenWithData.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:url_launcher/url_launcher.dart';
import 'Secondscreen.dart';
//import 'package:dio/dio.dart';
//import 'package:web_'

//import 'package:flutter/material.dart';
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Get Request',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: DashboardScreen(),
    );
  }
}

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({key}) : super(key: key);

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  //setting the expansion function for the navigation rail
  List<dynamic> users = [];
  bool isExpanded = false;
  String greetings = '';
  String str = '';
  String sal = '';
  String target = '';
  String month = '';
  String year = '';
  int rn1 = 0;
  int rn = 0;
  int fn1 = 0;
  // var url = Uri.parse("https://www.geeksforgeeks.org/");
  // launch(url)

  @override
  Widget build(BuildContext context) {
    myfunction();
    //records :{"name":len(x)}
    var itemCount;
    return Scaffold(
      body: Row(
        children: [
          //Let's start by adding the Navigation Rail
          NavigationRail(
              extended: isExpanded,
              backgroundColor: Colors.deepPurple.shade400,
              unselectedIconTheme:
                  IconThemeData(color: Colors.white, opacity: 1),
              unselectedLabelTextStyle: TextStyle(
                color: Colors.white,
              ),
              selectedIconTheme:
                  IconThemeData(color: Colors.deepPurple.shade900),
              destinations: [
                NavigationRailDestination(
                  icon: Icon(Icons.home),
                  label: Text("Home"),
                ),
                NavigationRailDestination(
                  icon: Icon(Icons.bar_chart),
                  label: Text("Reports"),
                ),
                NavigationRailDestination(
                  icon: Icon(Icons.person),
                  label: Text("Profile"),
                ),
                NavigationRailDestination(
                  icon: Icon(Icons.settings),
                  label: Text("Settings"),
                ),
              ],
              selectedIndex: 0),
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(40.0),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //let's add the navigation menu for this project
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          onPressed: () {
                            //let's trigger the navigation expansion
                            setState(() {
                              isExpanded = !isExpanded;
                            });
                          },
                          icon: Icon(Icons.menu),
                        ),
                        CircleAvatar(
                          backgroundImage: NetworkImage(
                              "https://c8.alamy.com/comp/T53X3B/company-name-logo-design-for-drag-mobile-design-ui-ux-blue-and-red-brand-name-design-with-place-for-tagline-abstract-creative-logo-template-for-T53X3B.jpg"),
                          radius: 30.0,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    //Now let's start with the dashboard main reports
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Flexible(
                          child: Card(
                            child: Padding(
                              padding: const EdgeInsets.all(18.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.article,
                                        size: 26.0,
                                      ),
                                      SizedBox(
                                        width: 15.0,
                                      ),
                                      Text(
                                        "Completed Projects",
                                        style: TextStyle(
                                          fontSize: 26.0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 20.0,
                                  ),
                                  Text(
                                    "6 Projects",
                                    style: TextStyle(
                                      fontSize: 36,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        Flexible(
                          child: Card(
                            child: Padding(
                              padding: const EdgeInsets.all(18.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.comment,
                                        size: 26.0,
                                        color: Colors.red,
                                      ),
                                      SizedBox(
                                        width: 15.0,
                                      ),
                                      Text(
                                        "Happy Clients",
                                        style: TextStyle(
                                          color: Colors.red,
                                          fontSize: 26.0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    height: 20.0,
                                  ),
                                  Text(
                                    "+25 Clients",
                                    style: TextStyle(
                                      color: Colors.red,
                                      fontSize: 36,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        Flexible(
                          child: Card(
                            child: Padding(
                              padding: const EdgeInsets.all(18.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      InkWell(
                                        child: Icon(Icons.people,
                                            size: 26.0, color: Colors.amber),
                                        onTap: () {
                                          print("icon called");
                                        },
                                      ),
                                      SizedBox(
                                        width: 15.0,
                                      ),
                                      Text(
                                        "Company Members",
                                        style: TextStyle(
                                          fontSize: 26.0,
                                          color: Colors.amber,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    height: 20.0,
                                  ),
                                  Text(
                                    "+7 Employees",
                                    style: TextStyle(
                                      fontSize: 36,
                                      color: Colors.amber,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        Flexible(
                          child: Card(
                            child: Padding(
                              padding: const EdgeInsets.all(18.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.monetization_on_outlined,
                                        size: 26.0,
                                        color: Colors.green,
                                      ),
                                      SizedBox(
                                        width: 15.0,
                                      ),
                                      Text(
                                        "Avg Revenue",
                                        style: TextStyle(
                                          fontSize: 26.0,
                                          color: Colors.green,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    height: 20.0,
                                  ),
                                  Text(
                                    "Dollar 500",
                                    style: TextStyle(
                                      fontSize: 36,
                                      color: Colors.green,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    //Now let's set the article section
                    SizedBox(
                      height: 30.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            Text(
                              "Sales Data",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 28.0,
                              ),
                            ),
                            SizedBox(
                              height: 10.0,
                            ),
                            // final response = await http.get(
                            //                 'http://127.0.0.1:5000/'); //getting the response from our backend server script

                            //             final decoded = json
                            //                 .decode(
                            //                     response.body) as Map<String,
                            //                 dynamic>; //converting it from json to key value pair

                            //             setState(() {
                            //               greetings = decoded['First Name'];
                            //               str = decoded['Last Name'];
                            //               sal = decoded['Sales'];
                            //               target = decoded['Sales Target'];
                            //               month = decoded['Month'];
                            //               year = decoded['Year'];

                            //               //   //greetings=decoded['Last Name']; //changing the state of our widget on data update
                            //             });
                            Center(
                              child: Container(
                                width: 130,
                                height: 50,
                                child: ElevatedButton(
                                  onPressed: () async {
                                    String str =
                                        'http://127.0.0.1:7777/totaluser';

                                    //int rn1 = 0;
                                    //str += rn1.toString();
                                    // var url = Uri.parse(str);
                                    // final response = await http.get(url);
                                    // //print(response);
                                    // final body = response.body;
                                    // //print(body);
                                    // final json = jsonDecode(body);
                                    // //print(json);
                                    // setState(() {
                                    //   users = json['name'];
                                    //   print(users);
//                                     // });
//                                     Response response;
// var dio = Dio();

// response = await dio.get('/products.php?id=12&name=shoe');
// print(response.data.toString());

                                    var url = Uri.parse(str);
                                    // if (await canLaunchUrl(url)) {
                                    //   final response = await http.get(str);
                                    //   print(response);
                                    //   final body = response.body;
                                    //   print(body);
                                    //   final json = jsonDecode(body);
                                    //   print(json);
                                    //   setState(() {
                                    //     users = json['name'];
                                    //     print('$users');
                                    //   });
                                    //await launchUrl(url);
                                    //   Text("hi");
                                    // } else {
                                    //   throw 'Could not launch $url';
                                    // }
                                  },
                                  child: Text(
                                    'Records' + " : " + '$fn1',
                                    style: TextStyle(
                                      fontSize: 15,
                                    ),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                        Container(
                          width: 300.0,
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: "Type New Feature Title",
                              prefixIcon: Icon(Icons.search),
                              border: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.black26,
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 40.0,
                    ),

                    //let's set the filter section
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // TextButton.icon(
                        //   onPressed: () {},
                        //   icon: Icon(
                        //     Icons.arrow_back,
                        //     color: Colors.deepPurple.shade400,
                        //   ),
                        //   label: Text(
                        //     "2022, July 14, July 15, July 16",
                        //     style: TextStyle(
                        //       color: Colors.deepPurple.shade400,
                        //     ),
                        //   ),
                        // ),
                        Row(
                          children: [
                            DropdownButton(
                                hint: Text("Filter by"),
                                items: [
                                  DropdownMenuItem(
                                    value: "Date",
                                    child: Text("Date"),
                                  ),
                                  DropdownMenuItem(
                                    value: "Comments",
                                    child: Text("Comments"),
                                  ),
                                  DropdownMenuItem(
                                    value: "Project Title",
                                    child: Text("Title"),
                                  ),
                                ],
                                onChanged: (value) {}),
                            SizedBox(
                              width: 20.0,
                            ),
                            DropdownButton(
                                hint: Text("Made by"),
                                items: [
                                  DropdownMenuItem(
                                    value: "Date",
                                    child: Text("Date"),
                                  ),
                                  DropdownMenuItem(
                                    value: "Comments",
                                    child: Text("Comments"),
                                  ),
                                  DropdownMenuItem(
                                    value: "Project Title",
                                    child: Text("Title"),
                                  ),
                                ],
                                onChanged: (value) {}),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 40.0,
                    ),
                    //Now let's add the Table
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        DataTable(
                            headingRowColor: MaterialStateProperty.resolveWith(
                                (states) => Colors.grey.shade200),
                            columns: [
                              // DataColumn(label: Text("Record")),
                              DataColumn(label: Text("Run Number")),
                              // DataColumn(label: Text("Time")),
                              DataColumn(label: Text("Status")),
                              //  DataColumn(label: Text("Sales Target")),
                              // DataColumn(label: Text("Month")),
                            ],
                            rows: [
                              //var idx=users['name'];
                              //itemCount :users.length,

                              for (var i = 0; i < fn1; i++)
                                DataRow(cells: [
                                  DataCell(
                                    TextButton.icon(
                                      // <-- TextButton
                                      onPressed: () {
                                        //int rn2 = 0;

                                        Navigator.push(
                                          context,
                                          new MaterialPageRoute(
                                              builder: (context) =>
                                                  new SecondScreenWithData(
                                                    rn: rn1,
                                                    rn1: i,
                                                  )),
                                        );
                                      },
                                      icon: Icon(
                                        Icons.ads_click_outlined,
                                        size: 24.0,
                                      ),
                                      label: Text('$i'),
                                    ),
                                  ),
                                  DataCell(Text("Completed")),
                                ]),
                            ]),

                        //Now let's set the pagination
                        SizedBox(
                          height: 40.0,
                        ),
                        Row(
                          children: [
                            TextButton(
                              onPressed: () {},
                              child: Text(
                                "1",
                                style: TextStyle(color: Colors.deepPurple),
                              ),
                            ),
                            TextButton(
                              onPressed: () {},
                              child: Text(
                                "2",
                                style: TextStyle(color: Colors.deepPurple),
                              ),
                            ),
                            TextButton(
                              onPressed: () {},
                              child: Text(
                                "3",
                                style: TextStyle(color: Colors.deepPurple),
                              ),
                            ),
                            TextButton(
                              onPressed: () {},
                              child: Text(
                                "See All",
                                style: TextStyle(color: Colors.deepPurple),
                              ),
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                // Text(
                                //     greetings, //Text that will be displayed on the screen
                                //     style: TextStyle(
                                //         fontSize: 24,
                                //         fontWeight: FontWeight.bold)),
                                // Text(
                                //     str, //Text that will be displayed on the screen
                                //     style: TextStyle(
                                //         fontSize: 24,
                                //         fontWeight: FontWeight.bold)),
                                // Text(
                                //     sal, //Text that will be displayed on the screen
                                //     style: TextStyle(
                                //         fontSize: 24,
                                //         fontWeight: FontWeight.bold)),
                                // Text(
                                //     target, //Text that will be displayed on the screen
                                //     style: TextStyle(
                                //         fontSize: 24,
                                //         fontWeight: FontWeight.bold)),
                                // Text(
                                //     month, //Text that will be displayed on the screen
                                //     style: TextStyle(
                                //         fontSize: 24,
                                //         fontWeight: FontWeight.bold)),
                                // Text(
                                //     year, //Text that will be displayed on the screen
                                //     style: TextStyle(
                                //         fontSize: 24,
                                //         fontWeight: FontWeight.bold)),
                                Center(
                                  child: Container(
                                    //container that contains the button
                                    width: 80,
                                    height: 50,
                                    child: ElevatedButton(
                                      //color: Colors.blue,
                                      onPressed: () async {
                                        //async function to perform http get
//var response = get(Uri.parse('https://www.google.com'));
//http.get(Uri.parse('https://swapi.co/api/people'));
                                        final response = await http.get(
                                            'http://127.0.0.1:7777/'); //getting the response from our backend server script

                                        final decoded = json
                                            .decode(
                                                response.body) as Map<String,
                                            dynamic>; //converting it from json to key value pair
                                        // print(decoded);
                                        setState(() {
                                          greetings = "hello";
                                          // str = decoded[0]['Last Name'];
                                          // sal = decoded[0]['Sales'];
                                          // target = decoded[0]['Sales Target'];
                                          // month = decoded[0]['Month'];
                                          // year = decoded[0]['Year'];

                                          //   //greetings=decoded['Last Name']; //changing the state of our widget on data update
                                        });
                                      },
                                      child: Text(
                                        ' ',
                                        style: TextStyle(
                                          fontSize: 24,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      //let's add the floating action button
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.link),
        backgroundColor: Colors.deepPurple.shade400,
      ),
    );
  }

  void myfunction() async {
    const url = 'http://127.0.0.1:7777/totaluser';
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    // print("hi");
    final body = response.body;
    final json = jsonDecode(body);
    // print("bye");
    setState(() {
      //print(json);
      //print(
      //"----------------------------------------------------------------------------------------------------------------");
      fn1 = json['name'];
      //print(users);
      // fn1 = users.length;
      //int user = users.length;
    });
  }
}
