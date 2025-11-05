// lib/example/day03/example1.dart

/*
  -- 주요 통신 기술
  JS : Fetch    , JQUERY : ajax
  REACT : Axios
  -- Flutter 라이브러리 공유 페이지 : https://pub.dev/
  SPRING : build.gradle
  JS : CDN , <link href="외부코드링크">
  REACT : package.json, npm , node 기반의 패키지 매니저
  Flutter : pubspec.yaml , pub
 */

import 'dart:math';

import 'package:dio/dio.dart';
final dio = Dio();

// [1] GET 방식의 요청 함수
void getEvent() async {  // dart 람다식/익명함수는 ()=>{}, (){} 두 형식을 지원
  try {
    // final response = await dio.get("URL");
    final response = await dio.get("https://jsonplaceholder.typicode.com/posts/1");
    print("[GET] 성공 : ${ response.data }");
  } catch (e) {
    print("[GET] 실패 ${e}"); // dart의 문자열 템플릿
  }
}

// [2] POST 방식의 요청 함수
void postEvent() async {
  try {
    final obj = { 'title' : 'foo' , 'body' : 'bar' , 'userId' : 1 }; // 보낼 데이터
    // dio.post("https://jsonplaceholder.typicode.com/posts" , data : 전송할데이터(객체));
    final response = await dio.post("https://jsonplaceholder.typicode.com/posts" , data : obj);
    print("[POST] 성공 : ${response.data}");
  } catch (e) {
    print("[POST] 실패 ${e}");
  }
}

void main() {
  print("*dart 프로그램 시작점*");
  getEvent();  // [1] 호출
  postEvent(); // [2] 호출
  // 1. DIO 설치 : pubspec.yaml 파일 30번 줄에 'dependencies : '
  // 2. "dio: ^5.9.0" 추가한다. 탭[tab] 주의
  // 3. 빨간줄 노란줄 안 뜨면 pub get 클릭하여 빌드
  // 4. dart 파일 상단에

  /*
  dependencies:
    flutter:
      sdk: flutter
    dio: ^5.9.0

   */

} // main end


