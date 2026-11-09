// 13주차 6일 해설 — 앱 생명주기와 백그라운드
// 실행: flutter run -d chrome -t lib/week13/answers/day06.dart
// 아래 stage 숫자(1·2·3)로 볼 단계를 골라요. 먼저 직접 시도한 뒤 읽고, 닫은 다음 다시 풀어 보세요.
// 1단계 예상 화면: 처음 변화 0번 → 다른 탭에 갔다 오면 숫자가 늘어요
// 2단계 예상 결과:
// 처음: 상태 변화 대기 / 탭 전환·복귀 뒤: 플랫폼이 전달한 상태 이름. 모든 상태나 고정 순서를 보장하지 않아요.
// 확인 질문: 앱이 inactive가 되었다고 현재 화면 State가 반드시 dispose되나요?
// 3단계 예상 화면: 처음 새로고침 0번 → 다른 탭에 갔다 돌아오면 새로고침 1번 (나갈 때는 그대로)

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

class _Step1PageState extends State<Step1Page> with WidgetsBindingObserver {
  int changes = 0;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    setState(() {
      changes++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('1단계')),
      body: Center(child: Text('변화 $changes번')),
    );
  }
}

// ━━━━━━━━━━ 2단계 ━━━━━━━━━━
class Step2Page extends StatefulWidget {
  const Step2Page({super.key});
  @override
  State<Step2Page> createState() => _Step2PageState();
}

class _Step2PageState extends State<Step2Page>
    with WidgetsBindingObserver {
  String status = '상태 변화 대기';
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    debugPrint('앱 상태: ${state.name}');
    if (!mounted) return;
    setState(() {
      status = state.name;
    });
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('달리기 연습')),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [const Text('앱 상태 관찰'), Text(status)],
        ),
      ),
    );
  }
}

// ━━━━━━━━━━ 3단계 ━━━━━━━━━━
class TodayLite extends StatefulWidget {
  const TodayLite({super.key});

  @override
  State<TodayLite> createState() => _TodayLiteState();
}

class _TodayLiteState extends State<TodayLite> with WidgetsBindingObserver {
  int reloads = 0;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) _reload();
  }

  void _reload() {
    setState(() {
      reloads++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('3단계')),
      body: Center(child: Text('새로고침 $reloads번')),
    );
  }
}

class Step3Page extends StatelessWidget {
  const Step3Page({super.key});

  @override
  Widget build(BuildContext context) {
    return const TodayLite();
  }
}
