// 7주차 3일 해설 — Column으로 세로 배치
// 실행: flutter run -d chrome -t lib/week07/answers/day03.dart
// 아래 stage 숫자(1·2·3)로 볼 단계를 골라요. 먼저 직접 시도한 뒤 읽고, 닫은 다음 다시 풀어 보세요.
// 1단계 예상 화면: 위에서부터 아침 → 점심
// 2단계 예상 결과:
// 위에서부터 민수 → 3km → 20분
// 확인 질문: 글자를 그리는 위젯과 세로 배치를 하는 위젯은 각각 무엇인가요?
// 3단계 예상 화면: 위: 큰 글자 5.24 / 아래: 킬로미터

import 'package:flutter/material.dart';

int stage = 1; // 1·2·3 중 보고 싶은 단계

void main() {
  const pages = <Widget>[Step1Page(), Step2Page(), Step3Page()];
  runApp(MaterialApp(home: pages[stage - 1]));
}

// ━━━━━━━━━━ 1단계 ━━━━━━━━━━
class Step1Page extends StatelessWidget {
  const Step1Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('1단계')),
      body: const Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [Text('아침'), Text('점심')],
        ),
      ),
    );
  }
}

// ━━━━━━━━━━ 2단계 ━━━━━━━━━━
class Step2Page extends StatelessWidget {
  const Step2Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('달리기 연습')),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [const Text('민수'), const Text('3km'), const Text('20분')],
        ),
      ),
    );
  }
}

// ━━━━━━━━━━ 3단계 ━━━━━━━━━━
class StatColumn extends StatelessWidget {
  const StatColumn({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text('5.24', style: TextStyle(fontSize: 32)),
        Text('킬로미터'),
      ],
    );
  }
}

class Step3Page extends StatelessWidget {
  const Step3Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('3단계')),
      body: const Center(child: StatColumn()),
    );
  }
}
