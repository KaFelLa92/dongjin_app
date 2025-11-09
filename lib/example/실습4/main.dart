// lib/example/실습4/main.dart

import 'package:dongjin_app/example/%EC%8B%A4%EC%8A%B54/CreatePage.dart';
import 'package:dongjin_app/example/%EC%8B%A4%EC%8A%B54/ListPage.dart';
import 'package:flutter/material.dart';

/*
    [조건4] 하단 바텀 탭 구성
    - 홈 페이지 탭 화면(선택)
    - 등록 페이지 탭 화면
    - 전체 조회 페이지 탭 화면
 */

void main() { // 프로그램 실행 시작점
  runApp(MyApp());
}

// 최상위 위젯 (StatelessWidget)
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Todo App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // 앱 시작 시 바로 MainScreen 보여주기
      home: MainScreen(),
    );
  }
}

// 메인 화면 (바텀 내비게이션을 포함한 화면)
class MainScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  // 현재 선택된 탭의 인덱스를 지정 (0 : 홈 , 1 : 등록 , 2 : 목록)
   int _selectedIndex = 0;

   final

}

// 홈페이지 화면
class Homepage extends StatelessWidget {
  
}