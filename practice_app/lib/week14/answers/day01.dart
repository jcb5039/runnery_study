// 14주차 1일 해설 — 사용자 ID와 로그인 상태
// 실행: flutter run -d chrome -t lib/week14/answers/day01.dart
// 예상 결과:
// 처음 로그아웃 → 로그인 클릭 user-1 → 로그아웃 클릭 로그아웃
// 확인 질문: 화면에 ID를 넣는 것과 서버가 인증하는 것은 왜 다른가요?

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
  String? userId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('달리기 연습')),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(userId ?? '로그아웃'),
            ElevatedButton(
              onPressed: () => setState(() {
                userId = 'user-1';
              }),
              child: const Text('로그인'),
            ),
            TextButton(
              onPressed: () => setState(() {
                userId = null;
              }),
              child: const Text('로그아웃'),
            ),
          ],
        ),
      ),
    );
  }
}
