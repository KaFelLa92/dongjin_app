// lib/example/day05/pages/Detail.dart

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
final dio = Dio();

class Detail extends StatefulWidget {
  DetailState createState() => DetailState();
}

class DetailState extends State<Detail> {
  // 1. 해당 위젯이 최초로 열렸을 때 함수 < 렌더링 >
  @override
  void initState() { }
  // 2. 이전(부모) 위젯이 변경되었을 때 실행 함수. < 렌더링 >
  @override
  void didChangeDependencies() {
    // ModalRoute.of(context)!.settings.arguments as 타입;
    int id = ModalRoute.of( context )!.settings.arguments as int;
    findById(id);
  }

  // 3. Spring 서버로부터 개별 조회한다.
  dynamic todo = {};
  void findById(int id) async {
    try{
      final response = await dio.get("http://192.168.40.184:8080/api/todo/detail?id=${id}");
      final data = await response.data;
      setState(() {
        todo = data;
      });
      print(data);
    } catch(e){
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar( title: Text("TODO 상세"),),
      body: Padding( padding: EdgeInsets.fromLTRB(50 , 30 , 10 , 10), child: Column(  // fromLTRB는 좌상우하 순서대로 패딩잡기
        crossAxisAlignment : CrossAxisAlignment.start , // 세로 배치 방법에서 왼쪽 정렬 , start,end,center
        children: [
          Text("제목 : ${todo['title'] }" , style: TextStyle(fontSize: 20) ) ,
          SizedBox( height: 10 ),

          Text("내용 : ${todo['content'] }" , style: TextStyle(fontSize: 18 , color: Colors.pink) ) ,
          SizedBox( height: 20,),

          Text( "완료 여부 : ${todo['done'] == true ? '완료' : '미완료'}" , style: TextStyle(fontSize: 18),),
          SizedBox( height: 20,),

          Text( "등록일 : ${todo['create_date']}" , style: TextStyle(fontSize: 18),) ,

        ],
       )
      )
    );
  }
}