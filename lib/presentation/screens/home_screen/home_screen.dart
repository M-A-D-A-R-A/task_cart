import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:task_cart/presentation/screens/Cart/cartpage.dart';
import 'package:task_cart/presentation/screens/Favroties/favroties.dart';
import 'package:task_cart/presentation/screens/Profile/Profiles.dart';
import 'package:task_cart/presentation/screens/home_screen/home.dart';

import '../../../core/constants/strings.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  void _onTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
      
  List<BottomNavigationBarItem> _item = [
    BottomNavigationBarItem(
        icon: Icon(Icons.home_outlined),
        label: "Home",
        backgroundColor: Colors.black),
    BottomNavigationBarItem(
        icon: Icon(Icons.shopping_bag_outlined),
        label: "Cart",
        backgroundColor: Colors.black),
    BottomNavigationBarItem(
        icon: Icon(CupertinoIcons.heart),
        label: "list",
        backgroundColor: Colors.black),
    BottomNavigationBarItem(
        icon: Icon(CupertinoIcons.profile_circled),
        label: "Profile",
        backgroundColor: Colors.black)
  ];

  static const List<Widget> _tabs = <Widget>[
    Text(
      'DashBoard',
      style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
    ),
    Cart(),
    Text(
      'List',
      style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
    ),
    Profile(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _tabs.elementAt(_currentIndex),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
           borderRadius: BorderRadius.only(
            topRight: Radius.circular(30), topLeft: Radius.circular(30)),
        boxShadow: [
          BoxShadow(color: Colors.black38, spreadRadius: 0, blurRadius: 10),
        ],
        ),
      
        child: ClipRRect(
           borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30.0),
          topRight: Radius.circular(30.0),),
          child: BottomNavigationBar(
            items: _item,
            type: BottomNavigationBarType.shifting,
            currentIndex: _currentIndex,
            selectedItemColor: Colors.white38,
            onTap: _onTapped,
            backgroundColor: Colors.white38,
          ),
            
        ),
      ),
    );
  }
}
