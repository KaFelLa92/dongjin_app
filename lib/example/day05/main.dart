// lib/example/day05/main.dart

import 'package:dongjin_app/example/day05/pages/Detail.dart';
import 'package:dongjin_app/example/day05/pages/Home.dart';
import 'package:dongjin_app/example/day05/pages/Update.dart';
import 'package:flutter/material.dart';

void main() {
  runApp( MyApp() );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: "/",
      // routes: { "경로정의" : (context) => 위젯명() }
        routes: {
        "/" : (context) => Home() ,
        "/detail" : (context) => Detail() ,
        "/update" : (context) => Update() ,
      }
    );
  }
}

