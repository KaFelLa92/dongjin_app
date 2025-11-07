// lib/example/day04/MainPage.dart

import 'package:dongjin_app/example/day04/HomePage.dart';
import 'package:dongjin_app/example/day04/InfoPage.dart';
import 'package:dongjin_app/example/day04/SettingPage.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  MainPageState createState() => MainPageState();

}

class MainPageState extends State<MainPage> {
  int currentPageIndex = 0; // 현재 화면에 보이는 페이지 (인덱스) 번호
  dynamic pages = [  // vs List<Widget> pages = [];
    HomePage(), // 인덱스 0 -> 홈 페이지
    InfoPage() , // 인덱스 1 -> 정보 페이지
    SettingPage() ,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack( index: currentPageIndex, children: pages,) ,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentPageIndex,
          onTap: (index){ setState(() {  // 바텀메뉴
            currentPageIndex = index;
          }); } ,
          items: [  // 바텀메뉴에 들어갈 버튼들
            BottomNavigationBarItem(
                icon: Icon(Icons.home) ,
                label: "홈"),
            BottomNavigationBarItem(
                icon: Icon(Icons.info , size: 30,),
                label: "정보"),
            BottomNavigationBarItem(
                icon: Icon(Icons.settings , color: Colors.pink,),
                label: "설정"
            )
          ]
      ),
    );
  }
}
