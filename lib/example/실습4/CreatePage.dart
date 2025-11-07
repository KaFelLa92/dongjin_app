// lib/example/실습4/CreatePage.dart


import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

final dio = Dio();
final baseUrl = "http://localhost:8080/todo";

// [*] 인풋 박스 컨트롤러
TextEditingController titleCont = TextEditingController();
TextEditingController contentCont = TextEditingController();

// [1] POST 요청 함수
void createTodo() async {
  try {
    final obj = {
      'title' : titleCont.text ,
      'content' : contentCont.text
    };
    final response = await dio.post(baseUrl , data : obj);
    print("[POST] 성공 : ${response.data}");
  } catch (e) {
    print("[POST] 실패 ${e}");
  }

}

// [2] 컴포넌트 위젯
class CreatePage extends StatefulWidget { // 상태 있는 위젯
  @override
  State<StatefulWidget> createState() => TodoWidgetState();
}

// [3] 컴포넌트 하위 위젯
class TodoWidgetState extends State<CreatePage> {
@override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("할 일 등록"),),
      body: Padding(
          padding: EdgeInsets.all(20) ,
          child: Column(
          children: [
            TextField(
              decoration: InputDecoration(labelText: "할 일 제목"),
              controller: titleCont,
            ),
            SizedBox( height: 20 ),
            TextField(
              decoration: InputDecoration(labelText: "할 일 내용"),
              controller: contentCont,
            ),
              SizedBox( height: 50,) ,
            ElevatedButton(onPressed: createTodo, child: Text("할 일 등록"))
        ],
      ),
      ),
    );
  }


}