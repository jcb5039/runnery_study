// 7주차 1일 해설 — main → runApp → MaterialApp → Scaffold
// 실행: flutter run -d chrome -t lib/week07/answers/day01.dart
// 아래 stage 숫자(1·2·3)로 볼 단계를 골라요. 먼저 직접 시도한 뒤 읽고, 닫은 다음 다시 풀어 보세요.
// 1단계 예상 화면: 위쪽 제목: 1단계 연습 / 화면 가운데: 안녕 Flutter
// 2단계 예상 결과:
// 위쪽 제목: 나의 달리기 / 화면 가운데: 오늘 3km
// 확인 질문: main, runApp, MaterialApp, Scaffold, Text를 순서대로 가리켜 보세요.
// 3단계 예상 화면: 화면 가운데: 러너리 시작 화면
// 3단계 설명: 위젯은 다른 위젯을 그대로 돌려줄 수 있어요. Runnery의 home 자리에는 AppStartPage가 들어가요.

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
      appBar: AppBar(title: const Text('1단계 연습')),
      body: const Center(child: Text('안녕 Flutter')),
    );
  }
}

// ━━━━━━━━━━ 2단계 ━━━━━━━━━━
class Step2Page extends StatelessWidget {
  const Step2Page({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('나의 달리기')),
      body: const Center(child: Text('오늘 3km')),
    );
  }
}

// ━━━━━━━━━━ 3단계 ━━━━━━━━━━
class AppStartLite extends StatelessWidget {
  const AppStartLite({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: Center(child: Text('러너리 시작 화면')));
  }
}

class Step3Page extends StatelessWidget {
  const Step3Page({super.key});

  @override
  Widget build(BuildContext context) {
    return const AppStartLite();
  }
}
