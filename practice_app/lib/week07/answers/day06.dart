// 7주차 6일 해설 — 작은 위젯으로 분리하고 값 전달하기
// 실행: flutter run -d chrome -t lib/week07/answers/day06.dart
// 아래 stage 숫자(1·2·3)로 볼 단계를 골라요. 먼저 직접 시도한 뒤 읽고, 닫은 다음 다시 풀어 보세요.
// 1단계 예상 화면: 화면 가운데: 나의 기록
// 2단계 예상 결과:
// 민수: 3km / 지우: 5km 카드 두 개
// 확인 질문: 카드의 입력값을 선언한 곳과 실제 값을 전달한 곳을 각각 가리켜 보세요.
// 3단계 예상 화면: 위에서부터 5.24 / 거리 / 32:15 / 시간

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
      body: const Center(child: HelloLabel()),
    );
  }
}

class HelloLabel extends StatelessWidget {
  const HelloLabel({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text('나의 기록');
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
          children: [
            const RunCard(name: '민수', km: 3),
            const RunCard(name: '지우', km: 5),
          ],
        ),
      ),
    );
  }
}

class RunCard extends StatelessWidget {
  final String name;
  final int km;
  const RunCard({super.key, required this.name, required this.km});
  @override
  Widget build(BuildContext context) => Card(
    child: Padding(
      padding: const EdgeInsets.all(16),
      child: Text('$name: ${km}km'),
    ),
  );
}

// ━━━━━━━━━━ 3단계 ━━━━━━━━━━
class StatTile extends StatelessWidget {
  const StatTile({super.key, required this.value, required this.label});

  final String value;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [Text(value, style: const TextStyle(fontSize: 28)), Text(label)],
    );
  }
}

class Step3Page extends StatelessWidget {
  const Step3Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('3단계')),
      body: const Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            StatTile(value: '5.24', label: '거리'),
            StatTile(value: '32:15', label: '시간'),
          ],
        ),
      ),
    );
  }
}
