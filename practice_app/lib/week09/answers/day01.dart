// 9주차 1일 해설 — push로 새 화면 열기
// 실행: flutter run -d chrome -t lib/week09/answers/day01.dart
// 예상 결과:
// 기록 보기 클릭 → 오늘 기록 화면 / 뒤로 가기 → 원래 버튼 화면
// 확인 질문: builder 안의 생성자는 어느 시점에 화면을 만들기 위해 호출되나요?

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
        child: ElevatedButton(
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute<void>(builder: (context) => const RunDetail()),
            );
          },
          child: const Text('기록 보기'),
        ),
      ),
    );
  }
}

class RunDetail extends StatelessWidget {
  const RunDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('달리기 연습')),
      body: Center(child: const Text('오늘 기록')),
    );
  }
}
