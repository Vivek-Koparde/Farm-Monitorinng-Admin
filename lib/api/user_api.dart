import 'dart:convert';
import 'package:http/http.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:smart_farm_monitoring_admin/model/User.dart';

Future<bool> addUser(String uid,String name,String mobile, String email, DateTime date) async {

  String url = 'https://infinite-fjord-59639.herokuapp.com/users/';
  Map<String, String> headers = {"Content-type": "application/json"};

  Response response = await post(url,
      headers: headers,
      body: jsonEncode(<String, String>{
        'uid': uid,
        'name': name,
        'mobile':mobile,
        'email':email,
        'dob': date.toString()
      }));
  int statusCode = response.statusCode;

  if (statusCode == 200) {
    print("***************DATA INSERTED SUCCESSFULLY");
    return true;
  } else {
    print(statusCode);
    print("EROR");
    return false;
  }
}

Future<List<FarmUser>> getUsers() async{
  List<FarmUser> arr = [];
  String baseURL = 'https://infinite-fjord-59639.herokuapp.com/users/';
  Response response = await get(baseURL);
  if (response.statusCode == 200){
    var data = jsonDecode(response.body);
    //print(data);
    for (var x in data){
      String uid = x['uid'].toString();
      String name = x['name'].toString();
      String email = x['email'].toString();
      String mobile = x['mobile'].toString();
      DateTime dob = DateTime.parse(x['dob'].toString());
      arr.add(FarmUser(uid:uid,name:name,email:email,mobile:mobile,dob:dob));
    }
  }
  return arr;
}
