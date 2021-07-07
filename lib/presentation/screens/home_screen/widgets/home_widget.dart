// Dummy Widget

import 'package:flutter/material.dart';

Widget card(String locationOfImage, String header, String desc,
      Color? backgroundColor) {
    return Padding(
      padding: EdgeInsets.only(left: 15),
      child: InkWell(
        onTap: () {},
        child: Container(
          width: 230.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.0),
            color: backgroundColor,
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(12, 12, 0, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Hero(
                  tag: header,
                  child: Container(
                    height: 45,
                    width: 45,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                        child: Image.asset(
                      locationOfImage,
                      height: 20,
                      width: 20,
                    )),
                  ),
                ),
                SizedBox(height: 20),
                Text(header,
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.w500)),
                SizedBox(height: 8),
                Text(desc,
                    style: TextStyle(fontSize: 14, color: Colors.grey[700])),
              ],
            ),
          ),
        ),
      ),
    );
  }