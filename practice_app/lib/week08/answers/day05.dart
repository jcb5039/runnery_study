// 8주차 5일 해설 — 기다린 뒤 mounted 확인
// 실행: flutter run -d chrome -t lib/week08/answers/day05.dart
// 예상 결과:
// 불러오기: 대기 → 불러오는 중 → 3km. 기다리는 동안 뒤로 가도 setState 오류 없음.
// 확인 질문: await 전에 mounted가 true였어도 기다린 뒤 다시 검사해야 하는 이유는 무엇인가요?

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
                builder: (context) => const PracticeLoader(),
              ),
            );
          },
          child: const Text('기록 불러오기 화면'),
        ),
      ),
    );
  }
}

class PracticeLoader extends StatefulWidget {
  const PracticeLoader({super.key});
  @override
  State<PracticeLoader> createState() => _PracticeLoaderState();
}

class _PracticeLoaderState extends State<PracticeLoader> {
  String message = '대기';
  bool loading = false;

  Future<void> load() async {
    setState(() {
      loading = true;
      message = '불러오는 중';
    });
    await Future<void>.delayed(const Duration(milliseconds: 1000));
    if (!mounted) return;
    setState(() {
      loading = false;
      message = '3km';
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
            Text(message),
            ElevatedButton(
              onPressed: loading ? null : load,
              child: const Text('불러오기'),
            ),
          ],
        ),
      ),
    );
  }
}
