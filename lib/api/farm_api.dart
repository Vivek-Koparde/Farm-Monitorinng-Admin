import 'dart:convert';
import 'package:http/http.dart';

Future<bool> addFarm(String uid,String farmName,double longitude, double latitude,double area, DateTime date) async {

  String url = 'https://infinite-fjord-59639.herokuapp.com/farm/'+uid;
  Map<String, String> headers = {"Content-type": "application/json"};

  Response response = await post(url,
      headers: headers,
      body: jsonEncode(<String, String>{

        'farmName': farmName,
        'longitude':longitude.toString(),
        'latitude':latitude.toString(),
        'area':area.toString(),
        'date': date.toString()
      }));
  int statusCode = response.statusCode;

  if (statusCode == 200) {
    print("***************DATA INSERTED SUCCESSFULLY");
    return true;
  } else {
    print(response.body);
    print("EROR");
    return false;
  }
}