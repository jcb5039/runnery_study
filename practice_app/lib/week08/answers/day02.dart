// 8주차 2일 해설 — StatefulWidget과 setState
// 실행: flutter run -d chrome -t lib/week08/answers/day02.dart
// 아래 stage 숫자(1·2·3)로 볼 단계를 골라요. 먼저 직접 시도한 뒤 읽고, 닫은 다음 다시 풀어 보세요.
// 1단계 예상 화면: 처음 0잔 → 한 잔 누를 때마다 1잔, 2잔
// 2단계 예상 결과:
// 처음 0km → 한 번 누르면 1km → 두 번 누르면 2km
// 확인 질문: 버튼 클릭 → 값 변경 → build → Text의 순서를 설명하세요.
// 3단계 예상 화면: 처음 현재 탭: 0 → 기록 누르면 현재 탭: 1 → 한 번 더 눌러도 그대로 / build 로그는 모두 2번

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
  int cups = 0;

  void drink() {
    setState(() {
      cups++;
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
            Text('$cups잔'),
            ElevatedButton(onPressed: drink, child: const Text('한 잔')),
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('달리기 연습')),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('${km}km'),
            ElevatedButton(onPressed: increase, child: const Text('1km 추가')),
          ],
        ),
      ),
    );
  }
}

// ━━━━━━━━━━ 3단계 ━━━━━━━━━━
class TabsLite extends StatefulWidget {
  const TabsLite({super.key});

  @override
  State<TabsLite> createState() => _TabsLiteState();
}

class _TabsLiteState extends State<TabsLite> {
  int _index = 0;

  void _go(int index) {
    if (index == _index) return;
    setState(() {
      _index = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    debugPrint('탭 화면 build');
    return Scaffold(
      appBar: AppBar(title: const Text('3단계')),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('현재 탭: $_index'),
            ElevatedButton(onPressed: () => _go(0), child: const Text('홈')),
            ElevatedButton(onPressed: () => _go(1), child: const Text('기록')),
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
    return const TabsLite();
  }
}
