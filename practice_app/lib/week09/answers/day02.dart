// 9주차 2일 해설 — 생성자로 상세 화면에 값 전달
// 실행: flutter run -d chrome -t lib/week09/answers/day02.dart
// 예상 결과:
// 상세 보기 → 5km
// 확인 질문: 상세 화면에 보이는 숫자가 어디에서 선언되고 전달되는지 짚어보세요.

import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(home: PracticePage()));
}

class PracticePage extends StatelessWidget {
  const PracticePage({super.key});
  final int km = 5;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('달리기 연습')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute<void>(builder: (context) => RunDetail(km: km)),
            );
          },
          child: const Text('상세 보기'),
        ),
      ),
    );
  }
}

class RunDetail extends StatelessWidget {
  final int km;
  const RunDetail({super.key, required this.km});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('기록 상세')),
      body: Center(child: Text('${km}km')),
    );
  }
}
