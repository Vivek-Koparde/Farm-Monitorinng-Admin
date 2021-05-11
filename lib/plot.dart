import 'package:flutter/material.dart';

class Plot extends StatefulWidget {
  static String id="plot";
  @override
  _PlotState createState() => _PlotState();
}

class _PlotState extends State<Plot> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 40),
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Column(
                children: <Widget>[
                  Text(
                    "Create Plot",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "User Id",
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
                    "Plot Name",
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
                    "Plot Id",
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
                    "Area",
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
                    "Soil Moisture 1 Depth (In inches)",
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
                    "Soil Moisture 2 Depth (In inches)",
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
                      child: new Text("Create Plot"),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
