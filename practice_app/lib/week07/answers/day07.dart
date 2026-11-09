// 7주차 7일 해설 — 복습: 정적인 기록 카드
// 실행: flutter run -d chrome -t lib/week07/answers/day07.dart
// 예상 결과:
// 카드 위에 민수, 아래 한 줄에 5km와 30분
// 확인 질문: main부터 이 Text까지 이어지는 위젯 트리를 자기 말로 설명하세요.

import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(home: PracticePage()));
}

class PracticePage extends StatelessWidget {
  const PracticePage({super.key});
  final String name = '민수';
  final int km = 5;
  final int minutes = 30;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('달리기 연습')),
      body: Center(
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(name),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text('${km}km'),
                    const SizedBox(width: 16),
                    Text('$minutes분'),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
