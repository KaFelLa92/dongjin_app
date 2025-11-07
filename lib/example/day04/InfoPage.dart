// lib/example/day04/InfoPage.dart

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class InfoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar( title: Text("정보"),),
      body: Text("정보 페이지"),
    );
  }
}