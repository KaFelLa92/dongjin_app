// lib/example/day03/example2.dart
import 'package:flutter/material.dart';

// [1]
void main(){ // main.jsx
  runApp( MyApp() );  // 최초로 실행할 위젯 , runApp 임포트 머터리얼로 할 것!
}

// [2] 위젯 만들기 < 최초 메인 위젯 , App.jsx 같은 역할 >
class MyApp extends StatelessWidget { // 상태(useState)가 없는 위젯
  @override // 위젯이란? 클래스 기반 : 위젯을 만드는 건 객체를 생성하는 것! new 위젯() , new 클래스()
  Widget build(BuildContext context) {
    return MaterialApp( home: GoodsWidget() );
  }
}

// [3] 위젯 만들기2 < 페이지 > , 컴포넌트 역할
class GoodsWidget extends StatefulWidget{ // 상태(useState)가 있는 위젯
  
}