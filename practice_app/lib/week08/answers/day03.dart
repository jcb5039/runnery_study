// 8주차 3일 해설 — 초기화 버튼과 상태의 위치
// 실행: flutter run -d chrome -t lib/week08/answers/day03.dart
// 예상 결과:
// 추가 두 번: 2km / 초기화 한 번: 0km
// 확인 질문: 상태 변수를 build 바깥에 선언하는 이유는 무엇인가요?

import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(home: PracticePage()));
}

class PracticePage extends StatefulWidget {
  const PracticePage({super.key});
  @override
  State<PracticePage> createState() => _PracticePageState();
}

class _PracticePageState extends State<PracticePage> {
  int km = 0;

  void increase() {
    setState(() {
      km++;
    });
  }

  void reset() {
    setState(() {
      km = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('달리기 연습')),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('${km}km'),
            ElevatedButton(onPressed: increase, child: const Text('추가')),
            TextButton(onPressed: reset, child: const Text('초기화')),
          ],
        ),
      ),
    );
  }
}
