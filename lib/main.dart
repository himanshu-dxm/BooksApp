import 'package:books_app_zypher/DataMethods.dart';
import 'package:flutter/material.dart';

import 'home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Books App Zypher',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
