// 7주차 4일 해설 — Row로 가로 배치
// 실행: flutter run -d chrome -t lib/week07/answers/day04.dart
// 아래 stage 숫자(1·2·3)로 볼 단계를 골라요. 먼저 직접 시도한 뒤 읽고, 닫은 다음 다시 풀어 보세요.
// 1단계 예상 화면: 한 줄에 왼쪽과 오른쪽, 사이 간격 16
// 2단계 예상 결과:
// 한 줄에 거리 3km와 시간 20분, 사이 간격 24
// 확인 질문: Column과 Row의 주된 배치 방향은 어떻게 다른가요?
// 3단계 예상 화면: 한 줄에 왼쪽부터 5.24km → 32:15 → 6'09"

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
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [Text('왼쪽'), SizedBox(width: 16), Text('오른쪽')],
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
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Text('거리 3km'), SizedBox(width: 24), Text('시간 20분')],
        ),
      ),
    );
  }
}

// ━━━━━━━━━━ 3단계 ━━━━━━━━━━
class StatRow extends StatelessWidget {
  const StatRow({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text('5.24km'),
        SizedBox(width: 24),
        Text('32:15'),
        SizedBox(width: 24),
        Text("6'09\""),
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
      body: const Center(child: StatRow()),
    );
  }
}
