// 9주차 2일 해설 — 생성자로 상세 화면에 값 전달
// 실행: flutter run -d chrome -t lib/week09/answers/day02.dart
// 아래 stage 숫자(1·2·3)로 볼 단계를 골라요. 먼저 직접 시도한 뒤 읽고, 닫은 다음 다시 풀어 보세요.
// 1단계 예상 화면: 인사하기 → 안녕, 지우
// 2단계 예상 결과:
// 상세 보기 → 5km
// 확인 질문: 상세 화면에 보이는 숫자가 어디에서 선언되고 전달되는지 짚어보세요.
// 3단계 예상 화면: 결과 보기 → 5.0km / 30분

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
      body: Center(
        child: ElevatedButton(
          onPressed: () => Navigator.of(context).push(
            MaterialPageRoute<void>(
              builder: (context) => const GreetingPage(name: '지우'),
            ),
          ),
          child: const Text('인사하기'),
        ),
      ),
    );
  }
}

class GreetingPage extends StatelessWidget {
  const GreetingPage({super.key, required this.name});

  final String name;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('인사')),
      body: Center(child: Text('안녕, $name')),
    );
  }
}

// ━━━━━━━━━━ 2단계 ━━━━━━━━━━
class Step2Page extends StatelessWidget {
  const Step2Page({super.key});
  final int km = 5;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('달리기 연습')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute<void>(builder: (context) => RunDetail(km: km)),
            );
          },
          child: const Text('상세 보기'),
        ),
      ),
    );
  }
}

class RunDetail extends StatelessWidget {
  final int km;
  const RunDetail({super.key, required this.km});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('기록 상세')),
      body: Center(child: Text('${km}km')),
    );
  }
}

// ━━━━━━━━━━ 3단계 ━━━━━━━━━━
class ResultPageLite extends StatelessWidget {
  const ResultPageLite({super.key, required this.km, required this.seconds});

  final double km;
  final int seconds;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('결과')),
      body: Center(child: Text('${km}km / ${seconds ~/ 60}분')),
    );
  }
}

class Step3Page extends StatelessWidget {
  const Step3Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('3단계')),
      body: Center(
        child: ElevatedButton(
          onPressed: () => Navigator.of(context).push(
            MaterialPageRoute<void>(
              builder: (context) => const ResultPageLite(km: 5.0, seconds: 1800),
            ),
          ),
          child: const Text('결과 보기'),
        ),
      ),
    );
  }
}
