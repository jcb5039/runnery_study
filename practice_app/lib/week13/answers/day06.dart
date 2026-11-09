// 13주차 6일 해설 — 앱 생명주기와 백그라운드
// 실행: flutter run -d chrome -t lib/week13/answers/day06.dart
// 예상 결과:
// 처음: 상태 변화 대기 / 탭 전환·복귀 뒤: 플랫폼이 전달한 상태 이름. 모든 상태나 고정 순서를 보장하지 않아요.
// 확인 질문: 앱이 inactive가 되었다고 현재 화면 State가 반드시 dispose되나요?

import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(home: PracticePage()));
}

class PracticePage extends StatefulWidget {
  const PracticePage({super.key});
  @override
  State<PracticePage> createState() => _PracticePageState();
}

class _PracticePageState extends State<PracticePage>
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
