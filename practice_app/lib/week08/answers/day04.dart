// 8주차 4일 해설 — initState → build → dispose 로그
// 실행: flutter run -d chrome -t lib/week08/answers/day04.dart
// 예상 결과:
// 열기: initState 다음 build / 증가: build가 다시 실행 / 뒤로 가기: dispose / 재열기: 새 initState와 0
// 확인 질문: 화면을 가리는 것과 위젯을 트리에서 제거하는 것은 왜 다른가요?

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
              MaterialPageRoute<void>(
                builder: (context) => const PracticeCounter(),
              ),
            );
          },
          child: const Text('기록 화면 열기'),
        ),
      ),
    );
  }
}

class PracticeCounter extends StatefulWidget {
  const PracticeCounter({super.key});
  @override
  State<PracticeCounter> createState() => _PracticeCounterState();
}

class _PracticeCounterState extends State<PracticeCounter> {
  int count = 0;
  @override
  void initState() {
    super.initState();
    debugPrint('기록 initState');
  }

  @override
  void dispose() {
    debugPrint('기록 dispose');
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    debugPrint('기록 build');
    return Scaffold(
      appBar: AppBar(title: const Text('달리기 연습')),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('$count'),
            ElevatedButton(
              onPressed: () => setState(() {
                count++;
              }),
              child: const Text('다시 그리기'),
            ),
          ],
        ),
      ),
    );
  }
}
