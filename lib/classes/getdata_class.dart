// ignore_for_file: camel_case_types, avoid_print

import 'package:intl/intl.dart';
import 'package:http/http.dart';
import 'dart:convert';

class Info {
  final String contname;
  final String flag;
  final String link;
  Info({required this.contname, required this.flag, required this.link});

  late bool isdaytime;
  late String timezone;
  late String timenow;

  getdata() async {
    try {
      Response response = await get(
          Uri.parse("http://worldtimeapi.org/api/timezone/$link"));

      Map receivedData = jsonDecode(response.body);
      DateTime timedate = DateTime.parse(receivedData["utc_datetime"]);

      int offset = int.parse(receivedData["utc_offset"].substring(0, 3));

      DateTime realltime = timedate.add(Duration(hours: offset));
      if (realltime.hour < 5 && realltime.hour < 18) {
        isdaytime = true;
      } else {
        isdaytime = false;
      }

      timenow = DateFormat('h:mm a').format(realltime);
      print(timenow);

      timezone = receivedData["timezone"];
      print(timezone);
    } catch (e) {
      print("ERROE IS : $e");
    }
  }
}
