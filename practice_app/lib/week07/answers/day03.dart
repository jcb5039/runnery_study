// 7주차 3일 해설 — Column으로 세로 배치
// 실행: flutter run -d chrome -t lib/week07/answers/day03.dart
// 예상 결과:
// 위에서부터 민수 → 3km → 20분
// 확인 질문: 글자를 그리는 위젯과 세로 배치를 하는 위젯은 각각 무엇인가요?

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
          children: [const Text('민수'), const Text('3km'), const Text('20분')],
        ),
      ),
    );
  }
}
