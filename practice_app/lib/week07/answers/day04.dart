// 7주차 4일 해설 — Row로 가로 배치
// 실행: flutter run -d chrome -t lib/week07/answers/day04.dart
// 예상 결과:
// 한 줄에 거리 3km와 시간 20분, 사이 간격 24
// 확인 질문: Column과 Row의 주된 배치 방향은 어떻게 다른가요?

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
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Text('거리 3km'), SizedBox(width: 24), Text('시간 20분')],
        ),
      ),
    );
  }
}
