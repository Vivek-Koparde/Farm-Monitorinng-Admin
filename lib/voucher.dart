import 'package:flutter/material.dart';

class Voucher extends StatefulWidget {
  static String id="voucher";
  @override
  _VoucherState createState() => _VoucherState();
}

class _VoucherState extends State<Voucher> {
  String _chosenValue;
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
              SizedBox(
                height: 20,
              ),
              Column(
                children: <Widget>[
                  Text(
                    "Select Voucher",
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
                  DropdownButton<String>(
                    focusColor: Colors.white,
                    value: _chosenValue,
                    //elevation: 5,
                    style: TextStyle(color: Colors.white),
                    iconEnabledColor: Colors.black,
                    items: <String>[
                      '1',
                      '2',
                      '3',
                      '4',
                      '5',
                      '6',
                      '7',
                    ].map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(
                          value,
                          style: TextStyle(color: Colors.black),
                        ),
                      );
                    }).toList(),
                    hint: Text(
                      "Select Vouchers (In Years)",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.w500),
                    ),
                    onChanged: (String value) {
                      setState(() {
                        _chosenValue = value;
                      });
                    },
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: new RaisedButton(
                      padding: const EdgeInsets.all(8.0),
                      textColor: Colors.blue,
                      color: Colors.grey[500],
                      child: new Text("Create Vouchers"),
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
