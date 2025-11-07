// lib/example/day04/HomePage.dart

import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar( title: Text("더조은:앱"),),
      body: Center(
        child: ElevatedButton(
            onPressed: (){
              Navigator.pushNamed(context, "/detail");
            },
            child: Text("특정페이지 이동")),
      ),
    );
  }
}