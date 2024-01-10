import 'package:flutter/material.dart';
import 'package:flutter_project2/colors.dart';
import 'package:flutter_project2/home_screen.dart';


void main(){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'FILMY',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Colours.scaffoldBgcolor,

      ),
      home: const HomeScreen(),

    );
  }
}
