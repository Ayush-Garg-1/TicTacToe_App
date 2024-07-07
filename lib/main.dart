import 'package:flutter/material.dart';
import 'package:tic_tac_toe/pages/home_page.dart';
import 'package:tic_tac_toe/pages/result_page.dart';
import 'package:tic_tac_toe/pages/tic_tac_toe_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        "tic-tac-toe-page":(context)=>TicTacToePage(),
        "result-page":(context)=>ResultPage(),
      },
home: HomePage(),
    debugShowCheckedModeBanner: false,
  );
  }
}
