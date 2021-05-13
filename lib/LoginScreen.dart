import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smart_farm_monitoring_admin/farm.dart';

import 'navigate_bar.dart';

class Login extends StatefulWidget {
  static String id = "login";
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String username;
  String password;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height,
            padding: EdgeInsets.symmetric(horizontal: 30, vertical: 50),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Center(
                  child: Text(
                    "Smart Farm Monitoring",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Only For Restricted Users",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.red[700],
                    fontSize: 15,
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                //Image
                Container(
                  height: MediaQuery.of(context).size.height / 4,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                    image: AssetImage("assets/images/welcome.png"),
                  )),
                ),
                SizedBox(
                  height: 40,
                ),
                TextField(
                  onChanged: (newValue){
                    username=newValue;
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.0),
                        borderSide: BorderSide(color: Color(0xff0195FF))),
                    prefixIcon: Icon(
                      Icons.person,
                      color: Colors.cyan,
                    ),
                    labelText: "Username",
                    hintText: "Enter Username",
                  ),
                  keyboardType: TextInputType.emailAddress,
                ),
                SizedBox(
                  height: 30.0,
                ),
                TextField(
                  onChanged: (newValue){
                    password=newValue;
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.0),
                        borderSide: BorderSide(color: Color(0xff0195FF))),
                    prefixIcon: Icon(
                      Icons.lock,
                      color: Colors.cyan,
                    ),
                    labelText: "Password",
                    hintText: "Enter Password",
                  ),
                  obscureText: true,
                  keyboardType: TextInputType.visiblePassword,
                ),
                SizedBox(
                  height: 20.0,
                ),
                RaisedButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0)),
                  child: Text(
                    'Login',
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () {
                    if (username=="admin@gmail.com" && password=="admin123"){
                      print("logged in");
                      Navigator.pushNamed(context, NavigateBar.id);
                    }
                  },
                  color: Color(0xff52B7FF),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
