// lib/example/실습4/ListPage.dart


import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

final dio = Dio();
final baseUrl = "http://localhost:8080/todo";

// [2] 컴포넌트 위젯
class ListPage extends StatefulWidget {
@override
  State<StatefulWidget> createState() => TodoWidgetState();
}

// [3] 컴포넌트 하위 위젯
class TodoWidgetState extends State<ListPage> {
  dynamic todoList = [];

  // [1] GET 요청 함수
  void getTodoList() async {
    try {
      final response = await dio.get(baseUrl);
      final data = await response.data;
      print(data);
      // 통신 결과를 렌더링
      setState(() {
        todoList = data;
      });
    } catch (e) {
      print(e);
    }
  }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("할 일 목록"),),
      body: Padding(
          padding: EdgeInsets.all(20)
          child: ListView.builder(
            itemBuilder: itemBuilder
        ),
      ),
    )
  }
}