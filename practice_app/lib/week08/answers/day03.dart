// 8주차 3일 해설 — 초기화 버튼과 상태의 위치
// 실행: flutter run -d chrome -t lib/week08/answers/day03.dart
// 아래 stage 숫자(1·2·3)로 볼 단계를 골라요. 먼저 직접 시도한 뒤 읽고, 닫은 다음 다시 풀어 보세요.
// 1단계 예상 화면: +10 두 번: 20점 / 처음으로: 0점
// 2단계 예상 결과:
// 추가 두 번: 2km / 초기화 한 번: 0km
// 확인 질문: 상태 변수를 build 바깥에 선언하는 이유는 무엇인가요?
// 3단계 예상 화면: 처음: 불러오기 실패 + 다시 시도 버튼 → 누르면: 정상 + 기록 보기 버튼 → 누르면: 기록 화면으로 이동

import 'package:flutter/material.dart';

int stage = 1; // 1·2·3 중 보고 싶은 단계

void main() {
  const pages = <Widget>[Step1Page(), Step2Page(), Step3Page()];
  runApp(MaterialApp(home: pages[stage - 1]));
}

// ━━━━━━━━━━ 1단계 ━━━━━━━━━━
class Step1Page extends StatefulWidget {
  const Step1Page({super.key});

  @override
  State<Step1Page> createState() => _Step1PageState();
}

class _Step1PageState extends State<Step1Page> {
  int score = 0;

  void addTen() {
    setState(() {
      score += 10;
    });
  }

  void restart() {
    setState(() {
      score = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('1단계')),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('$score점'),
            ElevatedButton(onPressed: addTen, child: const Text('+10')),
            TextButton(onPressed: restart, child: const Text('처음으로')),
          ],
        ),
      ),
    );
  }
}

// ━━━━━━━━━━ 2단계 ━━━━━━━━━━
class Step2Page extends StatefulWidget {
  const Step2Page({super.key});
  @override
  State<Step2Page> createState() => _Step2PageState();
}

class _Step2PageState extends State<Step2Page> {
  int km = 0;

  void increase() {
    setState(() {
      km++;
    });
  }

  void reset() {
    setState(() {
      km = 0;
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
            Text('${km}km'),
            ElevatedButton(onPressed: increase, child: const Text('추가')),
            TextButton(onPressed: reset, child: const Text('초기화')),
          ],
        ),
      ),
    );
  }
}

// ━━━━━━━━━━ 3단계 ━━━━━━━━━━
class RetryLite extends StatefulWidget {
  const RetryLite({super.key});

  @override
  State<RetryLite> createState() => _RetryLiteState();
}

class _RetryLiteState extends State<RetryLite> {
  String? error = '불러오기 실패';
  String message = '';

  void reload() {
    setState(() {
      error = null;
    });
  }

  void open() {
    setState(() {
      message = '기록 화면으로 이동';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('3단계')),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(error ?? '정상'),
            ElevatedButton(
              onPressed: error != null ? reload : open,
              child: Text(error != null ? '다시 시도' : '기록 보기'),
            ),
            Text(message),
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
    return const RetryLite();
  }
}
