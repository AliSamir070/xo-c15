import 'package:flutter/material.dart';
import 'package:xo_c15/board_screen.dart';
import 'package:xo_c15/home_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        HomeScreen.routeName:(context)=>HomeScreen(),
        BoardScreen.routeName:(context)=>BoardScreen(),
      },
      initialRoute: HomeScreen.routeName,
    );
  }
}
