import 'package:flutter/material.dart';
import 'package:smart_farm_monitoring_admin/farm.dart';
import 'package:smart_farm_monitoring_admin/UserRegistration.dart';
import 'package:smart_farm_monitoring_admin/plot.dart';
import 'package:smart_farm_monitoring_admin/voucher.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';

class NavigateBar extends StatefulWidget {
  static String id="navigateBar";
  @override
  _NavigateBarState createState() => _NavigateBarState();
}

class _NavigateBarState extends State<NavigateBar> {
  int _selectedIndex = 0;
  List<Widget> _option = <Widget>[
    Text('User',
        style: TextStyle(
          fontSize: 18,
        )),
    Text('Farm',
        style: TextStyle(
          fontSize: 18,
        )),
    // Text('Crop',
    //     style: TextStyle(
    //       fontSize: 18,
    //     )),
    // Text('Voucher',
    //     style: TextStyle(
    //       fontSize: 18,
    //     )),
  ];

  List<Widget> _options = <Widget>[
    UserRegistration(),
    Farm(),
    // Plot(),
    // Voucher(),
  ];
  void _onItemTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _options.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavyBar(
          // type: BottomNavigationBarType.shifting,
          selectedIndex: _selectedIndex,
          onItemSelected: (index){
            setState(() {
              _selectedIndex = index;
            });
          },
          // selectedItemColor: Colors.cyan,
          // unselectedItemColor: Colors.grey,
          // iconSize: 25,
          // onTap: _onItemTap,
          // elevation: 5),
        mainAxisAlignment: MainAxisAlignment.center,
          items: <BottomNavyBarItem>[
            BottomNavyBarItem(
              icon: Icon(
                Icons.person,
                color: _selectedIndex==0?Colors.cyan:Colors.blueGrey,
              ),
              title: Text('User'),
            ),
            BottomNavyBarItem(
              icon: Icon(
                Icons.dashboard,
                color: _selectedIndex==1?Colors.cyan:Colors.blueGrey,
              ),
              title: Text('Farm'),

            ),
            // BottomNavigationBarItem(
            //   icon: Icon(
            //     Icons.crop_square,
            //     color: Colors.blueGrey,
            //   ),
            //   label: 'Plot',
            // ),
            // BottomNavigationBarItem(
            //   icon: Icon(
            //     Icons.shopping_cart,
            //     color: Colors.blueGrey,
            //   ),
            //   label: 'Voucher',
            // ),
          ],

    ));
  }
}
