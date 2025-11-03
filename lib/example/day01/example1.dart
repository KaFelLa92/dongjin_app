// example1.dart 파일 생성
// 1. void main(){} 이용한 최초 실행 코드 작성한다.
// 2. 위젯을 구현한다. 위젯이란? 화면을 구성하는 가장 작은 단위 ( == 컴포넌트 )

// [1] 위젯 만들기
// (1) StatelessWidget 상속받기
// (2) build 함수 재구현
// (3) build 함수의 return에 'MaterialApp' 반환한다.
// (4) main() 안에서 최초로 실행할 위젯
import 'package:flutter/material.dart'; // 임포트할 때 material.dart로 해야함

class MyApp1 extends StatelessWidget{
  // extends란? 특정 클래스로부터 물려받는 행위
  // 오버라이딩 @override , 빈 공간에 컨트롤+스페이스바 , build 함수 오버라이딩
  @override
  Widget build(BuildContext context) {
    return MaterialApp( home: Text("최초 위젯"));
  } // build end
} // class end

class MyApp2 extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // 자바 : new 클래스명( 매개변수 ) vs DART : 클래스명( 속성명 : 값 )
    // return MaterialApp( home: 출력할위젯 , );
    // return MaterialApp( home: Scaffold( 속성명 : 값 , 속성명 : 값 ) , )  // Scaffold : 발판
    return MaterialApp( 
      home: Scaffold(
        appBar: AppBar(title: Text("여기가 상단바"),),                      // 상단바
        body: Center(child: Text("여기가 본문(코드수정)"),),                         // 본문
        bottomNavigationBar: BottomAppBar(child: Text("여기가 하단바"),),   // 하단바
      ),  // Scaffold end
    );    // MaterialApp end
  } // build end
} // class end

void main(){ // public static void main() 과 유사한 main스레드 갖는다.
  print("dart 언어 실행");     // System.out.print()와 비슷한 출력함수
  // runApp(MyApp1()); // runApp(최초로실행할위젯);   // 최초로 실행되는 위젯 실행
  runApp(MyApp2());
} // main end
// 함수의 반환타입이 없다는 뜻
// main 함수명 , 자바와 비슷하게 최초 실행은 void main에서 시작