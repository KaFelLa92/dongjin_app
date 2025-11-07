// lib/example/실습4/main.dart

import 'package:dongjin_app/example/%EC%8B%A4%EC%8A%B54/CreatePage.dart';
import 'package:dongjin_app/example/%EC%8B%A4%EC%8A%B54/ListPage.dart';
import 'package:flutter/material.dart';

void main() { // 프로그램 실행 시작점
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: "/",  // 앱 시작하는 최초 경로 지정
      routes: { // 경로와 해당 위젯 연결하는 map
        "/create" : (context) => CreatePage() ,
        "/list" : (context) => ListPage() ,
      },
    );
  }
}