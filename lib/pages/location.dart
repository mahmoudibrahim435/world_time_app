// ignore_for_file: prefer_const_constructors, unnecessary_string_interpolations, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:world_time_app/classes/getdata_class.dart';

class Location extends StatefulWidget {
  const Location({super.key});

  @override
  State<Location> createState() => _LocationState();
}

class _LocationState extends State<Location> {
  List<Info> allcont = [
      Info(link:'Africa/Cairo', contname: 'Egypt - Cairo', flag: 'egypt.png'),
    Info(link:'Africa/Tunis', contname: 'Tunisia - Tunis', flag: 'tunisia.png'),
    Info(link:'Africa/Algiers',contname: 'Algeria - Algiers', flag: 'algeria.png'),
    Info(link:'Australia/Sydney', contname: 'Australia - Sydney', flag: 'australia.png'),
    Info(link:'America/Toronto', contname: 'Canada - Toronto',flag: 'canada.png'),
    Info(link:'Asia/Riyadh', contname: '	Saudi Arabia - Riyadh', flag: 'sa.png'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 191, 191, 199),
        appBar: AppBar(
          // automaticallyImplyLeading: false,
          backgroundColor: Color.fromARGB(146, 12, 16, 49),
          title: Text(
            "Choose Location",
            style: TextStyle(fontSize: 22),
          ),
        ),
        body: ListView.builder(
            itemCount: allcont.length,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  child: ListTile(
                    title: Text("${allcont[index].contname}"),
                    onTap: ()async {
           Info infoo = allcont[index];
                       await  infoo.getdata();


                      Navigator.pop(context, {
                        "time":infoo.timenow ,
                        "zone": infoo.timezone,
                        "isdaytime":infoo.isdaytime
                      });
                    },
                    leading: CircleAvatar(
                      backgroundImage: AssetImage("assets/${allcont[index].flag}"),
                    ),
                  ),
                ),
              );
            }));
  }
}
