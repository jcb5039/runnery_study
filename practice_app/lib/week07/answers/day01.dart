// 7주차 1일 해설 — main → runApp → MaterialApp → Scaffold
// 실행: flutter run -d chrome -t lib/week07/answers/day01.dart
// 예상 결과:
// 위쪽 제목: 나의 달리기 / 화면 가운데: 오늘 3km
// 확인 질문: main, runApp, MaterialApp, Scaffold, Text를 순서대로 가리켜 보세요.

import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(home: PracticePage()));
}

class PracticePage extends StatelessWidget {
  const PracticePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('나의 달리기')),
      body: const Center(child: Text('오늘 3km')),
    );
  }
}
