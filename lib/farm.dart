import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:smart_farm_monitoring_admin/api/farm_api.dart';
import 'package:smart_farm_monitoring_admin/api/user_api.dart';
import 'package:smart_farm_monitoring_admin/model/User.dart';
import 'package:flutter/cupertino.dart';

class Farm extends StatefulWidget {
  static String id="farm";
  @override
  _FarmState createState() => _FarmState();
}
class _FarmState extends State<Farm> {
  String dropdownValue='Select user';
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
                  FutureBuilder(
                      future: getUsers(),
                      builder: (BuildContext context,AsyncSnapshot snapshot){
                        print("SNAPSHOT DATA");
                        print(snapshot.data);
                        if (snapshot.data == null){
                          return Text('Users Loading...');
                        }else{
                          arr = snapshot.data;
                          return
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.0),
                                  border: Border.all(color: Colors.cyan),
                                ),
                                child: DropdownButtonHideUnderline(
                                  child: DropdownButton<String>(
                                    hint: Padding(
                                      padding: const EdgeInsets.only(left: 20.0),
                                      child: Text(dropdownValue,style: TextStyle(fontWeight: FontWeight.bold),textAlign: TextAlign.center),
                                    ),
                                    icon: Padding(
                                      padding: const EdgeInsets.only(right:15.0),
                                      child: Icon(Icons.arrow_drop_down,color: Colors.cyan,),
                                    ),
                                    iconSize: 24,
                                    elevation: 16,
                                    style: TextStyle(color: Colors.black, fontSize: 18),
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
                                  ),
                                ),
                              );
                        }
                  }),
                  TextFormField(
                    onChanged: (newValue){
                      farmName=newValue;
                    },
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.cyan),
                          borderRadius: BorderRadius.circular(30.0)
                        ),
                      labelText: "Farm Name",
                      hintText: "Enter Farm Name",
                      prefixIcon: Icon(CupertinoIcons.square_stack_3d_up_fill,)
                    ),
                  ),
                  TextFormField(
                    keyboardType: TextInputType.number,
                    onChanged: (newValue){
                      latitude=double.parse(newValue);
                    },
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.cyan),
                          borderRadius: BorderRadius.circular(30.0)
                        ),
                      labelText: "Latitude",
                      hintText: "Enter Latitude",
                      prefixIcon: Icon(CupertinoIcons.line_horizontal_3_decrease_circle_fill)
                    ),
                  ),
                  TextFormField(
                    keyboardType: TextInputType.number,
                    onChanged: (newValue){
                      longitude=double.parse(newValue);
                    },
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.cyan),
                          borderRadius: BorderRadius.circular(30.0)
                        ),
                      labelText: "Longitude",
                      hintText: "Enter Longitude",
                      prefixIcon: Icon(CupertinoIcons.chart_bar_circle_fill)
                    ),
                  ),
                  TextFormField(
                    keyboardType: TextInputType.number,
                    onChanged: (newValue){
                      area=double.parse(newValue);
                    },
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.cyan),
                          borderRadius: BorderRadius.circular(30.0)
                        ),
                      labelText: "Area (In Acres)",
                      hintText: "Enter Area (In Acres)",
                      prefixIcon: Icon(CupertinoIcons.rectangle_split_3x3)
                    ),
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
                      textColor: Colors.white,
                      color: Color(0xff52B7FF),
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
