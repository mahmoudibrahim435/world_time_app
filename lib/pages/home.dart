// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map receivedData = {};
  @override
  Widget build(BuildContext context) {
    receivedData = receivedData.isEmpty
        ? receivedData = ModalRoute.of(context)!.settings.arguments as Map
        : receivedData;
    String bgimg = receivedData["isdaytime"] ?"night.jpg" :  "day.avif";
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/$bgimg"), fit: BoxFit.cover),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton.icon(
                onPressed: () async {
                  dynamic result =
                      await Navigator.pushNamed(context, '/Location');
                  setState(() {
                    receivedData = {
                      "time": result["time"],
                      "zone": result["zone"],
                      "isdaytime": result["isdaytime"]
                    };
                  });
                },
                icon: Icon(
                  Icons.edit_location,
                  color: Color.fromARGB(255, 255, 129, 129),
                  size: 24.0,
                ),
                label: Text(
                  "Edit location",
                  style: TextStyle(fontSize: 19, color: Colors.white),
                ),
                style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.all(
                      Color.fromARGB(146, 90, 104, 223)),
                  padding: WidgetStateProperty.all(EdgeInsets.all(22)),
                  shape: WidgetStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12))),
                ),
              ),
              SizedBox(
                height: 300,
              ),
              Container(
                  height: 200,
                  width: double.infinity,
                  color: Color.fromARGB(171, 0, 0, 0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        receivedData["time"],
                        style: TextStyle(fontSize: 50, color: Colors.white),
                      ),
                      Text(
                        receivedData["zone"],
                        style: TextStyle(fontSize: 30, color: Colors.white),
                      ),
                    ],
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
