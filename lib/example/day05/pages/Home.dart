// lib/example/day05/pages/Home.dart

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

final dio = Dio();
class Home extends StatefulWidget {
  HomeState createState() => HomeState();
}

class HomeState extends State<Home> {
  // 1. 위젯이 최초로 열렸을 때 실행되는 함수
  void initState() {
    findAll();
  }

  List< dynamic > todoList = [];  // 3. 가져온 todo목록

  void findAll() async { // 2. Spring 서버로부터 todo 전체 목록 가져오기
    try{
      final response = await dio.get("http://192.168.40.184:8080/api/todo");
      final data = await response.data;
      setState(() {
        todoList = data;
      });
      print(data); // 콘솔에 DB 찍힘
    }catch(e){
      print(e);
    }
  }

  void delete( int id ) async { // 4. Spring 서버로부터 todo 개별 삭제
    try {
      final response = await dio.delete("http://192.168.40.184:8080/api/todo?id=${id}");
      final data = await response.data;
      if (data == true) { findAll(); } // 5. 삭제 성공하면 할일 목록 재호출
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar( title: Text("TODO"),),
      body: Center(
        child: Column( 
          children: [
            Expanded( // 확장형 세로 스크롤 위젯
              child: ListView(
                // children: [], // 반복문을 이용하여 ListView에 여러개 Card 대입
                // todoList.map( (반복변수명){ return 반환위젯() }).toList()
                children: todoList.map( (todo) {  // map은 dynamic 지원하지 않음
                  return Card( child: ListTile(
                    title: Text( todo['title']),
                    subtitle: Text( todo['content']),
                    trailing: Row( // Row : 가로 배치 위젯
                      mainAxisSize: MainAxisSize.min, // Row 배치에서 오른쪽 버튼(위젯) 넓이를 자동(Card 기준)으로 자동 맞춤
                      children: [
                        IconButton(onPressed: (){ delete(todo['id']);} , icon: Icon(Icons.delete)),
                        IconButton(
                            onPressed: (){
                              final result = Navigator.pushNamed(context, "/update" , arguments: todo['id']);
                              // push한 위젯이 pop했을 때 반환값 받아서 특정 로직 구현
                              if ( result == true) {findAll();} // 수정 후 네비게이션.팝으로 돌아오면 화면 갱신 후 재렌더링
                              },
                            icon: Icon(Icons.edit)),
                        IconButton( // Navigator.pushNamed( context{현재위젯} , "{이동할경로}" , arguments : {매개변수} );
                            onPressed: (){ Navigator.pushNamed(context, "/detail" , arguments: todo['id'] ); },
                            icon: Icon(Icons.info , size: 30, ) ),
                      ],
                    ),
                  ), );
                }).toList(), // map end
              )),
          ],
      )
      ),
    );
  }
}





