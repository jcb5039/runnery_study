// 7주차 5일 해설 — Padding과 Card
// 실행: flutter run -d chrome -t lib/week07/answers/day05.dart
// 아래 stage 숫자(1·2·3)로 볼 단계를 골라요. 먼저 직접 시도한 뒤 읽고, 닫은 다음 다시 풀어 보세요.
// 1단계 예상 화면: 여백이 있는 카드 안에 카드 안
// 2단계 예상 결과:
// 여백이 있는 카드 안에 민수와 3km가 세로로 보여요.
// 확인 질문: Padding의 child와 Column의 children은 왜 형태가 다른가요?
// 3단계 예상 화면: 카드 안에 위: 한강공원 / 아래: 5.24km

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
        child: Card(
          child: Padding(padding: EdgeInsets.all(12), child: Text('카드 안')),
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
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text('민수'),
                const SizedBox(height: 8),
                const Text('3km'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// ━━━━━━━━━━ 3단계 ━━━━━━━━━━
class RecordCardLite extends StatelessWidget {
  const RecordCardLite({super.key});

  @override
  Widget build(BuildContext context) {
    return const Card(
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [Text('한강공원'), SizedBox(height: 8), Text('5.24km')],
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
      body: const Center(child: RecordCardLite()),
    );
  }
}
