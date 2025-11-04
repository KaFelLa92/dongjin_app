// lib/example/day02/example1.dart

// Dart 언어 기본 문법
import 'dart:ffi';

void main() { // main 스레드 갖는 함수

  // [1] 기본타입
  int age = 25;               // 정수 int
  print( "나이 : ${ age }" );  // "문자열 ${ 변수명 }"
  double height = 175.5;      // 실수 double
  bool isStudent = false;     // 논리 bool
  String name = "유재석";      // 문자열 String
  print( "이름 : ${ name } , 키 : ${ height } , 학생여부 : ${ isStudent }" );

  // [2] 주요 변수/상수 키워드
  var city = "서울";           // JS처럼 자동 타입 추론 - 타입변경불가능
  dynamic count = 123;        // *자동 타입 + 타입변경가능* (java의 Object 느낌?)
  count = "123명";
  const PI = 3.14159;         // JS처럼 const 상수    (런타임 시점)
  final country  = "대한민국";  // JAVA처럼 final 상수  (컴파일 시점)

  // [3] List , Map , Set (컬렉션 프레임워크)
  List<String> fruitList = ["사과" , "바나나" , "포도"];
  dynamic fruitList2 = ["배" , "감" , "대추야자"];  // dynamic으로 전부 대체 가능
  fruitList2.add("딸기");
  print("과일목록 : ${ fruitList2 }");
  Map< String , int > scores = { "국어" : 90 , "영어" : 85 , "수학" : 100 };
  print( "점수목록 : ${ scores }" );
  Set<int> numbers = { 1 , 2 , 3 , 3 , 2 }; // set 중복 값이 없는 집합
  print("중복 없는 집합 : ${ numbers }");

  // [4] 함수
  int add( int a , int b ) { return a+b; }
  // int : 반환타입 , add : 함수명 , int a / int b : 매개변수
  int result = add( 3 , 5 ); print( result );         // 8
  // 익명함수/화살표함수 , var 함수명 = ( ){ }
  var multiply = ( int x , int y ) { return x * y; };
  int result2 = multiply( 3 , 5 ); print( result2 );  // 15

  // [5] 클래스 , 객체
  Person p1 = new Person("유재석", 50);
  Person p2 = Person("강호동", 40);
  // 위젯이란? 미리 만들어진 클래스 또는 내가 만든 클래스
  // new 위젯명( 속성값 , 속성값 ) , new 생략가능 , 위젯명( 위젯명 ( 위젯명( ) ) )

  // [6] null 갖는 타입 vs Optional , 타입명 뒤에 ?
  String? nickName; // ? : null 허용
  nickName = null;
  print( "닉네임 : ${ nickName ?? '미정' }");

  // [7] if , for 제어문들은 Java와 동일






} // main end

// 플러터(프론트엔드 , 입출력담당)

// [5-1] class 클래스명{ }
class Person{
  // 멤버변수
  String name;
  int age;
  // 생성자
  Person( this.name , this.age );
}