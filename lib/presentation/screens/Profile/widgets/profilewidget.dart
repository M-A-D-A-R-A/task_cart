import 'package:flutter/material.dart';
class Profile_Widget{
Widget profile(IconData? icon, String name) {
    return Container(
      margin: EdgeInsets.fromLTRB(25, 25, 12, 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Icon(
            icon,
            size: 25,
            color: Colors.grey[700],
          ),
          SizedBox(
            width: 30,
          ),
          Text(
            name,
            style: TextStyle(
                fontWeight: FontWeight.w500, fontSize: 20, letterSpacing: 1.2),
          )
        ],
      ),
    );
  }

}


  