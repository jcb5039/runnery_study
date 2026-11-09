// 8주차 1일 해설 — 콜백은 버튼을 누를 때 실행
// 실행: flutter run -d chrome -t lib/week08/answers/day01.dart
// 아래 stage 숫자(1·2·3)로 볼 단계를 골라요. 먼저 직접 시도한 뒤 읽고, 닫은 다음 다시 풀어 보세요.
// 1단계 예상 화면: 인사 버튼 / 누를 때마다 터미널에 안녕 한 줄
// 2단계 예상 결과:
// 처음에는 로그 없음. 시작을 누를 때마다 터미널에 달리기 시작 한 줄.
// 확인 질문: onPressed에 함수 이름만 전달하는 이유는 무엇인가요?
// 3단계 예상 화면: 기록·프로필 버튼 / 기록 누르면 탭 1, 프로필 누르면 탭 3 로그

import 'package:flutter/material.dart';

int stage = 1; // 1·2·3 중 보고 싶은 단계

void main() {
  const pages = <Widget>[Step1Page(), Step2Page(), Step3Page()];
  runApp(MaterialApp(home: pages[stage - 1]));
}

// ━━━━━━━━━━ 1단계 ━━━━━━━━━━
class Step1Page extends StatelessWidget {
  const Step1Page({super.key});

  void sayHi() {
    debugPrint('안녕');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('1단계')),
      body: Center(
        child: ElevatedButton(onPressed: sayHi, child: const Text('인사')),
      ),
    );
  }
}

// ━━━━━━━━━━ 2단계 ━━━━━━━━━━
class Step2Page extends StatelessWidget {
  const Step2Page({super.key});
  void startRun() {
    debugPrint('달리기 시작');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('달리기 연습')),
      body: Center(
        child: ElevatedButton(onPressed: startRun, child: const Text('시작')),
      ),
    );
  }
}

// ━━━━━━━━━━ 3단계 ━━━━━━━━━━
class TabButtons extends StatelessWidget {
  const TabButtons({super.key, required this.onTap});

  final void Function(int) onTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        ElevatedButton(onPressed: () => onTap(1), child: const Text('기록')),
        const SizedBox(width: 16),
        ElevatedButton(onPressed: () => onTap(3), child: const Text('프로필')),
      ],
    );
  }
}

class Step3Page extends StatelessWidget {
  const Step3Page({super.key});

  void go(int index) {
    debugPrint('탭 $index');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('3단계')),
      body: Center(child: TabButtons(onTap: go)),
    );
  }
}
