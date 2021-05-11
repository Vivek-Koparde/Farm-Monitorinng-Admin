import 'package:flutter/material.dart';

class Farm extends StatefulWidget {
  static String id="farm";
  @override
  _FarmState createState() => _FarmState();
}
class _FarmState extends State<Farm> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 40),
            height: MediaQuery.of(context).size.height - 80,
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Text(
                  "Assign Farm To User",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.0),
                          borderSide: BorderSide(color: Colors.grey[500])),
                    labelText: "User Id",
                    hintText: "Enter User Id",

                  ),
                ),
                Text(
                  "Farm Id",
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w300,
                      color: Colors.black87),
                ),
                TextFormField(
                  initialValue: "",
                  obscureText: false,
                  decoration: InputDecoration(
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey[400]),
                      ),
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey[500]))),
                ),
                Text(
                  "Farm Name",
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w300,
                      color: Colors.black87),
                ),
                TextFormField(
                  initialValue: "",
                  obscureText: false,
                  decoration: InputDecoration(
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey[400]),
                      ),
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey[500]))),
                ),
                Text(
                  "Place",
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w300,
                      color: Colors.black87),
                ),
                TextFormField(
                  initialValue: "",
                  obscureText: false,
                  decoration: InputDecoration(
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey[400]),
                      ),
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey[500]))),
                ),
                Text(
                  "Latitude",
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w300,
                      color: Colors.black87),
                ),
                TextFormField(
                  initialValue: "",
                  obscureText: false,
                  decoration: InputDecoration(
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey[400]),
                      ),
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey[500]))),
                ),
                Text(
                  "Longitude",
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w300,
                      color: Colors.black87),
                ),
                TextFormField(
                  initialValue: "",
                  obscureText: false,
                  decoration: InputDecoration(
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey[400]),
                      ),
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey[500]))),
                ),
                Text(
                  "Altitude",
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w300,
                      color: Colors.black87),
                ),
                TextFormField(
                  initialValue: "",
                  obscureText: false,
                  decoration: InputDecoration(
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey[400]),
                      ),
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey[500]))),
                ),
                Text(
                  "Area (In Acres)",
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w300,
                      color: Colors.black87),
                ),
                TextFormField(
                  initialValue: "",
                  obscureText: false,
                  decoration: InputDecoration(
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey[400]),
                      ),
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey[500]))),
                ),
                SizedBox(
                  width: double.infinity,
                  child: new RaisedButton(
                    padding: const EdgeInsets.all(8.0),
                    textColor: Colors.blue,
                    color: Colors.grey[500],
                    child: new Text("Create Farm"),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
