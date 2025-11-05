// lib/example/day03/example2.dart
import 'package:dio/dio.dart';
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
  // 상태 위젯 생성/등록
  @override
  GoodsWidgetState createState() => GoodsWidgetState();
}

// [4] 상태 하위 위젯
class GoodsWidgetState extends State<GoodsWidget> {

  // [4-1] 입력 상자의 컨트롤러
  TextEditingController nameCont = TextEditingController();
  TextEditingController priceCont = TextEditingController();
  TextEditingController descCont = TextEditingController();

  // [4-2] goodsSave 함수 정의
  void goodsSave () async {
    // print( nameCont.text ); // 컨트롤러명.text 속성 이용하여 입력값 반환
    // print( priceCont.text );
    // print( descCont.text );
    final obj = { 
      'gname' : nameCont.text , 
      'gprice' : priceCont.text , 
      'gdesc' : descCont.text 
    };
    print( obj ); // 객체로 묶어서 출력함수 반환

    try {
      // [1] Dio 객체 생성 [2] 주의할점 : web[HTTP] 모바일[HTTP없음]
      final dio = Dio(); // 다른 함수에서도 쓸 거면 전역에 만드셈
      // (web) 빌드시 : localhost:8080 가능 , (mobile) : ip : 192.168.40.5 만 가능(cmd에서 ipconfig로 확인)
      // 스프링 컨트롤러 예시 : @CrossOrigin( origins = "*") 또는 corsConfig
      final response = await dio.post("http://localhost:8080/api/goods" , data : obj);
      final data = await response.data;
      print( data );
      // (1) 저장 성공된 자료를 추가하여 재렌더링
      // (2) goodsAll 재호출
      goodsAll();
      // setState(() {
      //   goodsList.add(data);
      // });
    } catch (e){
      print(e);
    }
  } // func end

  // [4-3] goodsAll 함수 정의 , useEffect( () => {} , [] ) 처럼 위젯이 최초로 열렸을 때 1번 실행
  void goodsAll() async {
    try {
      final dio = Dio();
      final response = await dio.get("http://localhost:8080/api/goods");
      final data = await response.data;
      print( data );
      // 통신 결과를 함수 밖 변수(상태) 업데이트(렌더링)
      setState(() {
        goodsList = data;
      });
    } catch(e){
      print(e);
    }
  }

  // [4-4] initState() 함수 오버라이딩 하여 위젯 초기 상태
  @override // 오버라이딩
  void initState() {
    // 최초로 실행할 함수 넣어주기
    goodsAll(); // 현재 위젯이 최초로 실행될 때 1번 goodAll 함수 실행
  }

  // [4-5] dio로 가져온 데이터를 저장하는 상태 변수
  dynamic goodsList = [];
  // dynamic 대신 List< Map <String, String>> 으로 해도 됨

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("제품 현황") ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [ // 총 7개의 객체를 배열에 저장한 것
            TextField(
              decoration: InputDecoration( labelText: "제품명") ,
              controller: nameCont,
            ) ,
              SizedBox( height: 20 ) , //
            TextField( 
              decoration: InputDecoration( labelText: "제품가격") , 
              keyboardType: TextInputType.number, // 모바일 환경에서 키보드 형식을 숫자패드로 표현
              controller: priceCont,
            ) ,
              SizedBox( height: 20 ) ,
            TextField(
              decoration: InputDecoration( labelText: "제품설명"),
              controller: descCont,
            ) ,
              SizedBox( height: 50 ) ,
            ElevatedButton(onPressed: goodsSave , child: Text("제품등록")) ,

            // return goodsList.map( ( goods , index ) => { return ( <div> </div> ) } )
            Expanded(child: ListView.builder(
                itemCount: goodsList.length, // 리스트의 총개수 정의
                itemBuilder: (context, index){
                  dynamic goods = goodsList[index]; // index번째 goods 1개 반환
                  // print(goods);
                  return Card( child: ListTile(
                    title: Text(goods['gname']),  // 객체명['속성명']
                    subtitle: Text(goods['gdesc']),
                  ) );
                }) // 반복문 
            )  
          ],  // 세로 정렬 위젯들
        ),
      ),
    );
  }
}

// padding : 안쪽 여백
// Column : 세로 정렬 ,

// 관리자 페이지 : 모바일보다는 웹(시스템)으로 운영
// 사용자 페이지 : 모바일로 운영





