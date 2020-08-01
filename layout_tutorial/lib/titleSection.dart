import 'dart:math';
import 'package:flutter/material.dart';

class TitleSection extends StatelessWidget {
  String title;
  String location;
  TitleSection(String title, String location) {
    this.title = title;
    this.location = location;
  }

  int getRandomNumber(int seed) {
    return Random(seed).nextInt(1000);
  }

  createRowTitle(String title) {
    return Container(
      padding: const EdgeInsets.only(bottom: 8),
      child: Text(
        title,
        style: TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  createRowLocationData(String location) {
    return Text(
      location,
      style: TextStyle(
        color: Colors.grey[500],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(32),
      child: Row(
        children: [
          Expanded(
            /*1*/
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /*2*/
                createRowTitle(title),
                createRowLocationData(location),
              ],
            ),
          ),
          /*3*/
          Icon(
            Icons.star,
            color: Colors.red[500],
          ),
          Text(getRandomNumber(DateTime.now().microsecondsSinceEpoch)
              .toString()),
        ],
      ),
    );
  }
}
