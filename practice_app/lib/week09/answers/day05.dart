// 9주차 5일 해설 — pushReplacement로 현재 화면 교체
// 실행: flutter run -d chrome -t lib/week09/answers/day05.dart
// 예상 결과:
// 안내 완료 → 러닝 홈. 이 예제에서는 AppBar에 이전 안내로 가는 뒤로 가기 버튼이 없어요.
// 확인 질문: 로그인 완료 뒤 이전 로그인 화면을 다시 보여줄 필요가 있는지 생각해 보세요.

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
            Navigator.of(context).pushReplacement(
              MaterialPageRoute<void>(builder: (context) => const HomePage()),
            );
          },
          child: const Text('안내 완료'),
        ),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('달리기 연습')),
      body: Center(child: const Text('러닝 홈')),
    );
  }
}
