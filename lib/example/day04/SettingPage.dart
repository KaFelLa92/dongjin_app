// lib/example/day04/SettingPage.dart

import 'package:flutter/material.dart';

class SettingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar( title: Text("설정"),),
      body: Text("설정 페이지"),
    );
  }
}