// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_print, use_build_context_synchronously, non_constant_identifier_names
// import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';


import 'package:world_time_app/classes/getdata_class.dart';

class Loding extends StatefulWidget {
  const Loding({super.key});

  @override
  State<Loding> createState() => _LodingState();
}

class _LodingState extends State<Loding> {
  getdataloding() async {
  
    try {
      Info Infoall = Info(contname:"Egypt", flag: "egypt", link: "Africa/Cairo");
    await  Infoall.getdata();

      Navigator.pushReplacementNamed(context, '/Home', arguments: {
        "time": Infoall.timenow,
        "zone": Infoall.timezone,
        "isdaytime": Infoall.isdaytime
      });
    } catch (e) {
      print("ERROE IS : $e");
    }
  }

  @override
  void initState() {
    super.initState();
    getdataloding();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SpinKitWaveSpinner(
              color: Color.fromARGB(255, 64, 71, 188),
              size: 150,
            ),
          ],
        ),
      ),
    );
  }
}
