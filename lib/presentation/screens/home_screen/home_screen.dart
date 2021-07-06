import 'package:flutter/material.dart';
import 'package:task_cart/presentation/screens/Cart/cartpage.dart';
import 'package:task_cart/presentation/screens/Favroties/favroties.dart';
import 'package:task_cart/presentation/screens/Profile/Profiles.dart';
import 'package:task_cart/presentation/screens/home_screen/home.dart';

import '../../../core/constants/strings.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key ?key,  required this.title}) : super(key: key);

  

  final String title;

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

   int _pageIndex = 0;
  PageController ?_pageController;

  List<Widget> tabPages = [
    Home(),
    Cart(),
    Favroties(),
    Profile(),
  ];

  @override
  void initState(){
    super.initState();
    _pageController = PageController(initialPage: _pageIndex);
  }

  @override
  void dispose() {
    _pageController?.dispose();
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              Strings.homeScreenCenterText,
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _pageIndex,
        onTap: onTabTapped,
        backgroundColor: Colors.black,
        fixedColor: Colors.black,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem( icon: Icon(Icons.home), title: Text("Home")),
          BottomNavigationBarItem(icon: Icon(Icons.mail), title: Text("Messages")),
          BottomNavigationBarItem(icon: Icon(Icons.hearing_outlined), title: Text("Profile")),
          BottomNavigationBarItem(icon: Icon(Icons.account_circle_outlined), title: Text("Profile")),
        ],

      ),
    );
  }

  void onPageChanged(int page) {
    setState(() {
      this._pageIndex = page;
    });
  }

  void onTabTapped(int index) {
    this._pageController?.animateToPage(index,duration: const Duration(milliseconds: 500),curve: Curves.easeInOut);
  }
}
