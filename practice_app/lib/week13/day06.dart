// 13주차 6일 — 앱 생명주기와 백그라운드
// 실행 위치: ~/src/runnery-study/practice_app
// 실행: flutter run -d chrome -t lib/week13/day06.dart
// 처음에는 showPractice = false로 예제를 실행하세요.
// 직접 푼 뒤 true로 바꾸고 저장하세요. 터미널에서 R(대문자)로 다시 시작하세요.
// 다른 날짜를 열 때는 q로 종료하고 그 날짜의 -t 경로로 실행하세요.
// 예제와 문제 작성 공간을 구분했어요. 해설은 answers/day06.dart에 있어요.
//
// [예제 화면 / 관찰할 결과]
// 탭 전환 시 inactive 또는 hidden, 복귀 시 resumed 등 실제 전달 상태를 관찰해요.
//
// [한 줄씩 읽기]
// 1. with WidgetsBindingObserver로 앱 상태 알림을 받는 역할을 더해요.
// 2. initState에서 observer를 등록해요.
// 3. didChangeAppLifecycleState가 상태 변화를 받아요.
// 4. resumed는 활성 상호작용, inactive는 포커스 상실 등, hidden은 보이지 않음이에요.
// 5. paused는 모바일에서 백그라운드에 있는 상태예요. 웹에서는 같은 순서로 모두 오지 않아요.
// 6. dispose에서 observer를 제거해요. 위젯의 dispose와 앱의 paused는 다른 사건이에요.
//
// [직접 풀 문제]
// PracticePage의 State에 with WidgetsBindingObserver를 붙이세요.
// status = 상태 변화 대기로 시작하고 initState에서 등록, dispose에서 제거하세요.
// didChangeAppLifecycleState에서 state.name을 로그와 화면에 표시하세요.
// 화면에는 앱 상태 관찰이라는 고정 문구도 넣으세요.
//
// [작성 위치와 호출 위치]
// 입력값은 아래 PracticePage 또는 _PracticePageState의 필드에 선언하세요.
// 새 메서드는 같은 클래스의 build 바깥에 정의하고, build 안 버튼의 onPressed에서 호출하거나 전달하세요.
// build는 화면을 만드는 메서드예요. 직접 반복 호출하지 않고 Flutter가 호출하게 둡니다.
// 화면 구조를 바꾸는 문제는 PracticePage의 build 안 TODO를 작성하세요.
// showPractice가 true이면 main의 MaterialApp이 PracticePage를 화면에 연결해요.
//
// [문제의 예상 결과]
// 처음: 상태 변화 대기 / 탭 전환·복귀 뒤: 플랫폼이 전달한 상태 이름. 모든 상태나 고정 순서를 보장하지 않아요.
//
// [입력 / 조작을 바꿔 다시 확인]
// 브라우저 다른 탭과 다른 앱으로 각각 이동해 비교하세요. 앱 강제 종료 때 마지막 알림을 반드시 받을 수는 없어요.
//
// [내 말로 설명]
// 앱이 inactive가 되었다고 현재 화면 State가 반드시 dispose되나요?

import 'package:flutter/material.dart';

bool showPractice = false; // 예제 확인 후 true로 바꾸세요.

void main() {
  runApp(
    MaterialApp(
      home: showPractice ? const PracticePage() : const ExamplePage(),
    ),
  );
}

// [짧은 실행 예제]
class ExamplePage extends StatefulWidget {
  const ExamplePage({super.key});
  @override
  State<ExamplePage> createState() => _ExamplePageState();
}

class _ExamplePageState extends State<ExamplePage> with WidgetsBindingObserver {
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
          children: [const Text('다른 브라우저 탭으로 이동했다 돌아와 보세요.'), Text(status)],
        ),
      ),
    );
  }
}

// [직접 풀 문제 — 작성 공간]
class PracticePage extends StatefulWidget {
  const PracticePage({super.key});
  @override
  State<PracticePage> createState() => _PracticePageState();
}

class _PracticePageState extends State<PracticePage> {
  // TODO: 문제의 상태 변수 선언 위치

  // TODO: 버튼 동작과 필요한 생명주기 메서드 정의 위치

  @override
  Widget build(BuildContext context) {
    // TODO: 아래 예제용 안내 화면을 문제에서 요구한 위젯으로 바꾸세요.
    return Scaffold(
      appBar: AppBar(title: const Text('달리기 연습')),
      body: Center(child: const Text('TODO: 여기에 문제 화면을 만드세요.')),
    );
  }
}
