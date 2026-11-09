// 8주차 4일 해설 — initState → build → dispose 로그
// 실행: flutter run -d chrome -t lib/week08/answers/day04.dart
// 아래 stage 숫자(1·2·3)로 볼 단계를 골라요. 먼저 직접 시도한 뒤 읽고, 닫은 다음 다시 풀어 보세요.
// 1단계 예상 화면: 화면 가운데: 로그를 보세요 / 터미널: 1단계 initState → 1단계 build
// 2단계 예상 결과:
// 열기: initState 다음 build / 증가: build가 다시 실행 / 뒤로 가기: dispose / 재열기: 새 initState와 0
// 확인 질문: 화면을 가리는 것과 위젯을 트리에서 제거하는 것은 왜 다른가요?
// 3단계 예상 화면: 설정 화면 버튼 → 열면 로그 설정 듣기 시작 → 뒤로 가면 로그 설정 듣기 끝

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
  @override
  void initState() {
    super.initState();
    debugPrint('1단계 initState');
  }

  @override
  Widget build(BuildContext context) {
    debugPrint('1단계 build');
    return Scaffold(
      appBar: AppBar(title: const Text('1단계')),
      body: const Center(child: Text('로그를 보세요')),
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
        child: ElevatedButton(
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute<void>(
                builder: (context) => const PracticeCounter(),
              ),
            );
          },
          child: const Text('기록 화면 열기'),
        ),
      ),
    );
  }
}

class PracticeCounter extends StatefulWidget {
  const PracticeCounter({super.key});
  @override
  State<PracticeCounter> createState() => _PracticeCounterState();
}

class _PracticeCounterState extends State<PracticeCounter> {
  int count = 0;
  @override
  void initState() {
    super.initState();
    debugPrint('기록 initState');
  }

  @override
  void dispose() {
    debugPrint('기록 dispose');
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    debugPrint('기록 build');
    return Scaffold(
      appBar: AppBar(title: const Text('달리기 연습')),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('$count'),
            ElevatedButton(
              onPressed: () => setState(() {
                count++;
              }),
              child: const Text('다시 그리기'),
            ),
          ],
        ),
      ),
    );
  }
}

// ━━━━━━━━━━ 3단계 ━━━━━━━━━━
class SettingsLite extends StatefulWidget {
  const SettingsLite({super.key});

  @override
  State<SettingsLite> createState() => _SettingsLiteState();
}

class _SettingsLiteState extends State<SettingsLite> {
  @override
  void initState() {
    super.initState();
    debugPrint('설정 듣기 시작');
  }

  @override
  void dispose() {
    debugPrint('설정 듣기 끝');
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('설정')),
      body: const Center(child: Text('설정 내용')),
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
            MaterialPageRoute<void>(builder: (context) => const SettingsLite()),
          ),
          child: const Text('설정 화면'),
        ),
      ),
    );
  }
}
