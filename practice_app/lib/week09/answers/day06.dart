// 9주차 6일 해설 — 같은 기록 객체를 상세 화면에 전달
// 실행: flutter run -d chrome -t lib/week09/answers/day06.dart
// 예상 결과:
// 상세 보기 → 저녁: 5km
// 확인 질문: 이름과 거리를 따로 전달하는 것과 객체로 전달하는 것을 비교해 보세요.

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
            const record = PracticeRun('저녁', 5);
            Navigator.of(context).push(
              MaterialPageRoute<void>(
                builder: (context) => const RunDetail(record: record),
              ),
            );
          },
          child: const Text('상세 보기'),
        ),
      ),
    );
  }
}

class PracticeRun {
  final String name;
  final int km;
  const PracticeRun(this.name, this.km);
}

class RunDetail extends StatelessWidget {
  final PracticeRun record;
  const RunDetail({super.key, required this.record});
  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: const Text('상세')),
    body: Center(child: Text('${record.name}: ${record.km}km')),
  );
}
