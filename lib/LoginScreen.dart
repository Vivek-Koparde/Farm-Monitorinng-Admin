import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'navigate_bar.dart';

class Login extends StatefulWidget {
  static String id = "login";
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool flag = false;
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
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.0),
                        borderSide: BorderSide(color: Color(0xff0195FF))),
                    prefixIcon: Icon(
                      Icons.phone_android,
                      color: Colors.cyan,
                    ),
                    labelText: "Phone Number",
                    hintText: "Enter Phone Number",
                  ),
                  keyboardType: TextInputType.phone,
                ),
                SizedBox(
                  height: 30.0,
                ),
                Visibility(
                  child: TextField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30.0),
                            borderSide: BorderSide(color: Color(0xff0195FF))),
                        prefixIcon: Icon(
                          Icons.message,
                          color: Colors.cyan,
                        ),
                        labelText: "OTP",
                        hintText: "Enter OTP"),
                    keyboardType: TextInputType.phone,
                  ),
                  visible: flag,
                ),
                SizedBox(
                  height: 20.0,
                ),
                !flag
                    ? RaisedButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0)),
                        child: Text(
                          'Generate OTP',
                          style: TextStyle(color: Colors.white),
                        ),
                        onPressed: () {
                          setState(() {
                            flag = true;
                          });
                        },
                        color: Color(0xff52B7FF),
                      )
                    : RaisedButton(

                        child: Text(
                          'Log in',
                          style: TextStyle(color: Colors.white),
                        ),
                        onPressed: () {
                          Navigator.pushNamed(context, NavigateBar.id);
                          setState(() {});
                        },
                        color: Color(0xff52B7FF),
                      ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
