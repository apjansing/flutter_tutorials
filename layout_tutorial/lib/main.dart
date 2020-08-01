// Copyright 2018 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'titleSection.dart';
import 'buttonSection.dart';
import 'textSection.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Color color = Theme.of(context).primaryColor;

    Widget titleSection =
        TitleSection('Selkirk Shores State Park', 'Pulaski, NY');
    Widget buttonSection = ButtonSection(color);
    Widget textSection = TextSection(
        'Selkirk Shores State Park features a swimming beach on Lake Ontario, hiking trails, campsites and cabins. The park is associated with the nearby Pine Grove Boat Launch, which provides access for small boats to the lower Salmon River.'
        ' A "Bird Conservation Area" at the park protects breeding habitat for several regionally threatened bird species, including pied-billed grebes, American bitterns, least bitterns, and black terns.');
    return MaterialApp(
      title: 'Flutter layout demo',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Flutter layout demo'),
        ),
        body: ListView(children: [
          Image.asset(
            'images/selkirk.jpg',
            width: 600,
            height: 240,
            fit: BoxFit.cover,
          ),
          titleSection,
          buttonSection,
          textSection
        ]),
      ),
    );
  }
}
