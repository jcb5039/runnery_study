// 7주차 6일 해설 — 작은 위젯으로 분리하고 값 전달하기
// 실행: flutter run -d chrome -t lib/week07/answers/day06.dart
// 예상 결과:
// 민수: 3km / 지우: 5km 카드 두 개
// 확인 질문: 카드의 입력값을 선언한 곳과 실제 값을 전달한 곳을 각각 가리켜 보세요.

import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(home: PracticePage()));
}

class PracticePage extends StatelessWidget {
  const PracticePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('달리기 연습')),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const RunCard(name: '민수', km: 3),
            const RunCard(name: '지우', km: 5),
          ],
        ),
      ),
    );
  }
}

class RunCard extends StatelessWidget {
  final String name;
  final int km;
  const RunCard({super.key, required this.name, required this.km});
  @override
  Widget build(BuildContext context) => Card(
    child: Padding(
      padding: const EdgeInsets.all(16),
      child: Text('$name: ${km}km'),
    ),
  );
}
