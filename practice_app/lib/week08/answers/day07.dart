// 8주차 7일 해설 — 복습: 상태와 생명주기 설명하기
// 실행: flutter run -d chrome -t lib/week08/answers/day07.dart
// 아래 stage 숫자(1·2·3)로 볼 단계를 골라요. 먼저 직접 시도한 뒤 읽고, 닫은 다음 다시 풀어 보세요.
// 1단계 예상 화면: 좋아요 0 → 버튼 세 번 누르면 좋아요 3
// 2단계 예상 결과:
// 시작 0km, 추가 두 번 2km, 초기화 0km. 같은 State에서 준비는 한 번, 그리기는 여러 번 가능.
// 확인 질문: build에서 파일 저장이나 Timer 생성을 매번 하면 왜 문제가 되나요?
// 3단계 예상 화면: 처음: 현재 탭: 2 → 홈 누르면: 현재 탭: 0

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
  int likes = 0;

  void like() {
    setState(() {
      likes++;
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
            Text('좋아요 $likes'),
            ElevatedButton(onPressed: like, child: const Text('좋아요')),
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
  @override
  void initState() {
    super.initState();
    debugPrint('준비');
  }

  @override
  void dispose() {
    debugPrint('정리');
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    debugPrint('그리기');
    return Scaffold(
      appBar: AppBar(title: const Text('달리기 연습')),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('${km}km'),
            ElevatedButton(
              onPressed: () => setState(() {
                km++;
              }),
              child: const Text('추가'),
            ),
            TextButton(
              onPressed: () => setState(() {
                km = 0;
              }),
              child: const Text('초기화'),
            ),
          ],
        ),
      ),
    );
  }
}

// ━━━━━━━━━━ 3단계 ━━━━━━━━━━
class StartTabLite extends StatefulWidget {
  const StartTabLite({super.key, required this.initialIndex});

  final int initialIndex;

  @override
  State<StartTabLite> createState() => _StartTabLiteState();
}

class _StartTabLiteState extends State<StartTabLite> {
  late int _index = widget.initialIndex;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('3단계')),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('현재 탭: $_index'),
            ElevatedButton(
              onPressed: () => setState(() => _index = 0),
              child: const Text('홈'),
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
    return const StartTabLite(initialIndex: 2);
  }
}
