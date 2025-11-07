// lib/example/day04/main.dart

import 'package:dongjin_app/example/day04/DetailPage.dart';
import 'package:dongjin_app/example/day04/HomePage.dart';
import 'package:dongjin_app/example/day04/InfoPage.dart';
import 'package:dongjin_app/example/day04/MainPage.dart';
import 'package:dongjin_app/example/day04/SettingPage.dart';
import 'package:flutter/material.dart';

void main(){ // 프로그램 실행 시작점
  runApp(MyApp());  // runApp() 플러터 앱을 시작하는 함수
  // new MyApp() 내가 만든 루트(최초) 위젯, new 생략 가능
}


class MyApp extends StatelessWidget {
@override
  Widget build(BuildContext context) {
    // return MaterialApp( routes: { "경로명" : (context) => 위젯명() }, );
    return MaterialApp(
      initialRoute: "/" , // 앱 시작하는 최초의 경로 지정
      routes: { // 경로와 해당 위젯을 연결하는 map
        "/" : (context) => MainPage() ,
        "/home" : (context) => HomePage() ,
        "/info" : (context) => InfoPage() ,
        "setting" : (context) => SettingPage(),
        "/detail" : (context) => DetailPage(),
      },
    );
  }
}