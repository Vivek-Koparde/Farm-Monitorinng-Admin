import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gender_selection/gender_selection.dart';

class UserRegistration extends StatefulWidget {
  static String id = "userRegistration";
  @override
  _UserRegistrationState createState() => _UserRegistrationState();
}

class _UserRegistrationState extends State<UserRegistration> {
  DateTime _dateTime;
  String selectedGender="";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 40),
          height: MediaQuery.of(context).size.height - 80,
          width: double.infinity,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Text(
                  "Create New User",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'RobotoMono'),
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.0),
                      borderSide: BorderSide(
                        color: Color(0xff0195FF),
                      ),
                    ),
                    prefixIcon: Icon(
                      Icons.person,
                      color: Colors.cyan,
                    ),
                    labelText: "User Name",
                    hintText: "Enter User Name",
                  ),
                  keyboardType: TextInputType.name,
                ),
                SizedBox(height: 20.0),
                TextFormField(
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30.0),
                          borderSide: BorderSide(color: Color(0xff0195FF))),
                      labelText: "User Id",
                      hintText: "Enter User ID",
                      prefixIcon: Icon(
                        Icons.account_box_rounded,
                        color: Colors.cyan,
                      )),
                ),
                SizedBox(
                  height: 20.0,
                ),
                TextFormField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30.0),
                          borderSide: BorderSide(color: Colors.grey[500])),
                      labelText: "Mobile Number",
                      hintText: "Enter Mobile Number",
                      prefixIcon: Icon(
                        Icons.phone_android,
                        color: Colors.cyan,
                      )),
                  keyboardType: TextInputType.phone,
                ),
                SizedBox(height: 20.0),
                TextFormField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30.0),
                          borderSide: BorderSide(color: Colors.grey[500])),
                      labelText: "Email",
                      hintText: "Enter Email",
                      prefixIcon: Icon(
                        Icons.email,
                        color: Colors.cyan,
                      )),
                  keyboardType: TextInputType.phone,
                ),
                SizedBox(height: 20.0),
                Text('Date Of Birth',
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w300,
                      color: Colors.black87),
                ),
                FlatButton(
                  onPressed: () {
                    showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(1900),
                            lastDate: DateTime.now())
                        .then((date) {
                      setState(() {
                        _dateTime = date;

                      });
                    });
                  },
                  child: _dateTime==null?Icon(
                    Icons.calendar_today,
                    color: Colors.white,
                  ):Text("${_dateTime.day}/${_dateTime.month}/${_dateTime.year}",style: TextStyle(color: Colors.white),),
                  color: Color(0xff52B7FF),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0)),
                ),
                SizedBox(height: 20.0,),
                Text(
                  "Select Gender",
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w300,
                      color: Colors.black87),
                ),
                GenderSelection(
                  selectedGenderIconBackgroundColor:
                      Colors.greenAccent, // default red
                  checkIconAlignment:
                      Alignment.centerRight, // default bottomRight
                  selectedGenderCheckIcon: null, // default Icons.check
                  onChanged: (Gender gender) {
                    selectedGender=gender.toString();
                  },
                  equallyAligned: true,
                  animationDuration: Duration(milliseconds: 400),
                  isCircular: true, // default : true,
                  isSelectedGenderIconCircular: true,
                  opacityOfGradient: 0.6,
                  padding: const EdgeInsets.all(3),
                  size: 60, //default : 120
                ),
                SizedBox(
                  height: 15.0,
                ),
                RaisedButton(
                  child: Text(
                    'Add',
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () {
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
