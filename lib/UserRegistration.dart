import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:gender_selection/gender_selection.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:smart_farm_monitoring_admin/api/user_api.dart';

class UserRegistration extends StatefulWidget {
  static String id = "userRegistration";
  @override
  _UserRegistrationState createState() => _UserRegistrationState();
}

class _UserRegistrationState extends State<UserRegistration> {
  DateTime _dateTime;
  String selectedGender="";

  final _auth = FirebaseAuth.instance;
  String name;
  String email;
  String mobile;
  String password;
  bool showSpinner = false;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.white,
      body: SafeArea(
        child: ModalProgressHUD(
          inAsyncCall: showSpinner,
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
                    onChanged: (newValue){
                      name=newValue;
                    },
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
                  SizedBox(
                    height: 20.0,
                  ),
                  TextFormField(
                    onChanged: (newValue){
                      mobile=newValue;
                    },
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
                    onChanged: (newValue){
                      email=newValue;
                    },
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
                    keyboardType: TextInputType.emailAddress,
                  ),
                  SizedBox(height: 20.0),
                  TextFormField(
                    onChanged: (newValue){
                      password=newValue;
                    },
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30.0),
                            borderSide: BorderSide(color: Color(0xff0195FF))),
                        labelText: "Password",
                        hintText: "Enter Password",
                        prefixIcon: Icon(
                          Icons.lock,
                          color: Colors.cyan,
                        )),
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



                  RaisedButton(
                    child: Text(
                      'Add',
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () {
                       createNewUser();
                    },
                    color: Color(0xff52B7FF),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }


  createNewUser() async{
    setState(() {
      showSpinner = true;
    });
    try{
      final newUser = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      if (newUser!=null){
        print(newUser.user.uid);
        bool isCreated=await addUser(newUser.user.uid, name, mobile, email, _dateTime);
        //Navigator.pushNamed(context, Login.id);
        if (isCreated){
          CoolAlert.show(
            context: context,
            type: CoolAlertType.success,
            text: "User Created!",
          );
        }

      }

    }catch(e){
      print(e);
    }
    setState(() {
      showSpinner = false;
    });

  }
}
