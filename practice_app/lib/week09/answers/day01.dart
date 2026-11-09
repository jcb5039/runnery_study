// 9주차 1일 해설 — push로 새 화면 열기
// 실행: flutter run -d chrome -t lib/week09/answers/day01.dart
// 아래 stage 숫자(1·2·3)로 볼 단계를 골라요. 먼저 직접 시도한 뒤 읽고, 닫은 다음 다시 풀어 보세요.
// 1단계 예상 화면: 설정 열기 → 설정 화면 / 뒤로 가기 → 원래 버튼 화면
// 2단계 예상 결과:
// 기록 보기 클릭 → 오늘 기록 화면 / 뒤로 가기 → 원래 버튼 화면
// 확인 질문: builder 안의 생성자는 어느 시점에 화면을 만들기 위해 호출되나요?
// 3단계 예상 화면: 기록·프로필 버튼 / 프로필 누르면 프로필 화면

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
            MaterialPageRoute<void>(builder: (context) => const SettingsOne()),
          ),
          child: const Text('설정 열기'),
        ),
      ),
    );
  }
}

class SettingsOne extends StatelessWidget {
  const SettingsOne({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('설정')),
      body: Center(child: Text('설정 화면')),
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
              MaterialPageRoute<void>(builder: (context) => const RunDetail()),
            );
          },
          child: const Text('기록 보기'),
        ),
      ),
    );
  }
}

class RunDetail extends StatelessWidget {
  const RunDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('달리기 연습')),
      body: Center(child: const Text('오늘 기록')),
    );
  }
}

// ━━━━━━━━━━ 3단계 ━━━━━━━━━━
void openPage(BuildContext context, String title) {
  Navigator.of(context).push(
    MaterialPageRoute<void>(builder: (_) => TitlePage(title: title)),
  );
}

class TitlePage extends StatelessWidget {
  const TitlePage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Center(child: Text('$title 화면')),
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
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ElevatedButton(
              onPressed: () => openPage(context, '기록'),
              child: const Text('기록'),
            ),
            ElevatedButton(
              onPressed: () => openPage(context, '프로필'),
              child: const Text('프로필'),
            ),
          ],
        ),
      ),
    );
  }
}
