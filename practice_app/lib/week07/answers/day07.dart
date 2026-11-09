// 7주차 7일 해설 — 복습: 정적인 기록 카드
// 실행: flutter run -d chrome -t lib/week07/answers/day07.dart
// 아래 stage 숫자(1·2·3)로 볼 단계를 골라요. 먼저 직접 시도한 뒤 읽고, 닫은 다음 다시 풀어 보세요.
// 1단계 예상 화면: 한 줄에 5km와 30분
// 2단계 예상 결과:
// 카드 위에 민수, 아래 한 줄에 5km와 30분
// 확인 질문: main부터 이 Text까지 이어지는 위젯 트리를 자기 말로 설명하세요.
// 3단계 예상 화면: 카드 두 장: 한강공원 / 5km 30분, 올림픽공원 / 3km 20분

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
          children: [Text('5km'), SizedBox(width: 16), Text('30분')],
        ),
      ),
    );
  }
}

// ━━━━━━━━━━ 2단계 ━━━━━━━━━━
class Step2Page extends StatelessWidget {
  const Step2Page({super.key});
  final String name = '민수';
  final int km = 5;
  final int minutes = 30;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('달리기 연습')),
      body: Center(
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(name),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text('${km}km'),
                    const SizedBox(width: 16),
                    Text('$minutes분'),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// ━━━━━━━━━━ 3단계 ━━━━━━━━━━
class RunRecordCard extends StatelessWidget {
  const RunRecordCard({
    super.key,
    required this.place,
    required this.km,
    required this.minutes,
  });

  final String place;
  final int km;
  final int minutes;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(place),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [Text('${km}km'), const SizedBox(width: 16), Text('$minutes분')],
            ),
          ],
        ),
      ),
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
            RunRecordCard(place: '한강공원', km: 5, minutes: 30),
            RunRecordCard(place: '올림픽공원', km: 3, minutes: 20),
          ],
        ),
      ),
    );
  }
}
