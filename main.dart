
import 'package:flutter/material.dart';
import 'home_page.dart';

void main() {
  runApp(MyCarApp());
}

class MyCarApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'سيارتي',
      theme: ThemeData.dark().copyWith(
        primaryColor: Colors.teal,
        scaffoldBackgroundColor: Color(0xFF121212),
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.black,
        ),
      ),
      home: HomePage(),
    );
  }
}
