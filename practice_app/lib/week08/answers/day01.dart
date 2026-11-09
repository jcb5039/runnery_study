// 8주차 1일 해설 — 콜백은 버튼을 누를 때 실행
// 실행: flutter run -d chrome -t lib/week08/answers/day01.dart
// 예상 결과:
// 처음에는 로그 없음. 시작을 누를 때마다 터미널에 달리기 시작 한 줄.
// 확인 질문: onPressed에 함수 이름만 전달하는 이유는 무엇인가요?

import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(home: PracticePage()));
}

class PracticePage extends StatelessWidget {
  const PracticePage({super.key});
  void startRun() {
    debugPrint('달리기 시작');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('달리기 연습')),
      body: Center(
        child: ElevatedButton(onPressed: startRun, child: const Text('시작')),
      ),
    );
  }
}
