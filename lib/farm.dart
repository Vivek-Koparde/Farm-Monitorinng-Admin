import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:smart_farm_monitoring_admin/api/farm_api.dart';
import 'package:smart_farm_monitoring_admin/api/user_api.dart';
import 'package:smart_farm_monitoring_admin/model/User.dart';

class Farm extends StatefulWidget {
  static String id="farm";
  @override
  _FarmState createState() => _FarmState();
}
class _FarmState extends State<Farm> {
  String dropdownValue='No user selected';
  String uid;
  String farmName;
  double longitude;
  double latitude;
  double area;
  FarmUser farmUser;
  List<FarmUser> arr = [];
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.white,
      body: SafeArea(
        child: ModalProgressHUD(
          inAsyncCall: isLoading,
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
                  FutureBuilder(
                      future: getUsers(),
                      builder: (BuildContext context,AsyncSnapshot snapshot){
                        print("SNAPSHOT DATA");
                        print(snapshot.data);
                        if (snapshot.data == null){
                          return Text('Useres Loading...');
                        }else{
                          arr = snapshot.data;
                          return
                              DropdownButton<String>(

                                icon: Icon(Icons.arrow_drop_down),

                                iconSize: 24,
                                elevation: 16,
                                style: TextStyle(color: Colors.red, fontSize: 18),
                                underline: Container(
                                  height: 2,

                                  color: Colors.deepPurpleAccent,
                                ),
                                onChanged: (String data) {
                                  setState(() {
                                    dropdownValue = data;
                                    for (FarmUser x in arr){
                                      if (data == x.email){
                                        farmUser = x;
                                      }
                                    }
                                  });
                                },
                                items: snapshot.data.map<DropdownMenuItem<String>>((FarmUser value) {
                                  farmUser=value;
                                  return DropdownMenuItem<String>(
                                    value: value.email,
                                    child: Text(value.email),

                                  );
                                }).toList(),
                              );



                        }
                  }),
                  Text(dropdownValue),

                  Text(
                    "Farm Name",
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w300,
                        color: Colors.black87),
                  ),
                  TextFormField(
                    initialValue: "",
                    onChanged: (newValue){
                      farmName=newValue;
                    },

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
                    keyboardType: TextInputType.number,
                    onChanged: (newValue){
                      latitude=double.parse(newValue);
                    },
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
                    keyboardType: TextInputType.number,
                    onChanged: (newValue){
                      longitude=double.parse(newValue);
                    },
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
                    keyboardType: TextInputType.number,
                    onChanged: (newValue){
                      area=double.parse(newValue);
                    },
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
                      onPressed: () async{
                        setState(() {
                          isLoading=true;
                        });
                        try{
                          print('UID ');
                          print(farmUser.uid);
                          bool isAdded = await addFarm(farmUser.uid, farmName, longitude, latitude, area, DateTime.now());
                          if (isAdded == true){
                            CoolAlert.show(
                              context: context,
                              type: CoolAlertType.success,
                              text: "Farm Created!",
                            );
                            setState(() {
                              isLoading=false;
                            });
                          }else{
                            setState(() {
                              isLoading=false;
                            });
                          }
                        }
                        catch(err){
                          print(err);
                        }

                      },
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
      ),
    );
  }
}
