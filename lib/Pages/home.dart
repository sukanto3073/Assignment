// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_expanded_tile/flutter_expanded_tile.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List Data = [
    ["Sukanto", "Mobile Application Developter"],
    ["Sukanto", "Mobile Application Developter"],
    ["Sukanto", "Mobile Application Developter"],
    ["Sukanto", "Mobile Application Developter"],
  ];
//List for Deopdown list
  List name = ['Sukanto', 'Rabbi', 'Shawon', 'Joy'];
  late var selected = name.first;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: const <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'Sukanto Mukherjee',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.message),
              title: Text('Messages'),
            ),
            ListTile(
              leading: Icon(Icons.account_circle),
              title: Text('Profile'),
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Settings'),
            ),
            ExpansionTile(
              title: Text("Click for more"),
              children: [
                Text(
                    "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy"),
              ],
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            GridView.builder(
              padding: EdgeInsets.only(top: 10),
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 6.0,
                mainAxisSpacing: 6.0,
              ),
              itemCount: Data.length,
              itemBuilder: (context, index) {
                return Container(
                  padding: EdgeInsets.only(top: 10),
                  height: 100,
                  width: 200,
                  color: Color.fromARGB(255, 241, 102, 59),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ClipOval(
                        child: SizedBox.fromSize(
                          size: Size.fromRadius(48), // Image radius
                          child: Image.network(
                              'https://cdn3.vectorstock.com/i/1000x1000/48/37/web-developer-design-vector-5884837.jpg',
                              fit: BoxFit.cover),
                        ),
                      ),
                      Text(
                        Data[index][0],
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        Data[index][1],
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                );
              },
            ),
            SizedBox(
              height: 20,
            ),
            DropdownButton(
              value: selected,
              hint: Text("Select Your Name"),
              elevation: 10,
              borderRadius: BorderRadius.circular(20),
              items: name.map((e) {
                return DropdownMenuItem(
                  value: e,
                  child: Text("$e"),
                );
              }).toList(),
              onChanged: ((value) {
                setState(() {
                  selected = value;
                });
              }),
            ),
            SizedBox(
              height: 20,
            ),
            CircularProgressIndicator(),
            SizedBox(
              height: 20,
            ),
            LinearProgressIndicator(),
          ],
        ),
      ),
    );
  }
}
