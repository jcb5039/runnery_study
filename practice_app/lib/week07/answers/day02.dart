// 7주차 2일 해설 — StatelessWidget과 build
// 실행: flutter run -d chrome -t lib/week07/answers/day02.dart
// 예상 결과:
// 민수: 3km
// 확인 질문: build의 반환값은 숫자인가요, 화면을 구성하는 Widget인가요?

import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(home: PracticePage()));
}

class PracticePage extends StatelessWidget {
  const PracticePage({super.key});
  final String name = '민수';
  final int km = 3;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('달리기 연습')),
      body: Center(child: Text('$name: ${km}km')),
    );
  }
}
