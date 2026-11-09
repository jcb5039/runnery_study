// 7주차 5일 해설 — Padding과 Card
// 실행: flutter run -d chrome -t lib/week07/answers/day05.dart
// 예상 결과:
// 여백이 있는 카드 안에 민수와 3km가 세로로 보여요.
// 확인 질문: Padding의 child와 Column의 children은 왜 형태가 다른가요?

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
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text('민수'),
                const SizedBox(height: 8),
                const Text('3km'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
