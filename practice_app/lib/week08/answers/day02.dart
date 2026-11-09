// 8주차 2일 해설 — StatefulWidget과 setState
// 실행: flutter run -d chrome -t lib/week08/answers/day02.dart
// 예상 결과:
// 처음 0km → 한 번 누르면 1km → 두 번 누르면 2km
// 확인 질문: 버튼 클릭 → 값 변경 → build → Text의 순서를 설명하세요.

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('달리기 연습')),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('${km}km'),
            ElevatedButton(onPressed: increase, child: const Text('1km 추가')),
          ],
        ),
      ),
    );
  }
}
