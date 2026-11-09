// 8주차 4일 — initState → build → dispose 로그
// 실행 위치: ~/src/runnery-study/practice_app
// 실행: flutter run -d chrome -t lib/week08/day04.dart
// 처음에는 showPractice = false로 예제를 실행하세요.
// 직접 푼 뒤 true로 바꾸고 저장하세요. 터미널에서 R(대문자)로 다시 시작하세요.
// 다른 날짜를 열 때는 q로 종료하고 그 날짜의 -t 경로로 실행하세요.
// 예제와 문제 작성 공간을 구분했어요. 해설은 answers/day04.dart에 있어요.
//
// [예제 화면 / 관찰할 결과]
// 생명주기 보기 → 다시 그리기 → 뒤로 가기를 누르며 터미널 로그를 비교해요.
//
// [한 줄씩 읽기]
// 1. 예제의 버튼은 새 화면을 열어요. 이동 문법은 9주에 자세히 배워요.
// 2. State가 만들어지면 initState가 그 State에서 한 번 실행돼요. super.initState()를 먼저 호출해요.
// 3. build는 처음과 갱신 시 여러 번 호출될 수 있어요. 정확한 호출 횟수에 의존하지 마세요.
// 4. 뒤로 가기로 화면의 State가 제거되면 dispose가 실행돼요. 마지막에 super.dispose()를 호출해요.
// 5. 새 화면을 다시 열면 새 State의 initState가 다시 실행돼요.
//
// [직접 풀 문제]
// PracticePage는 '기록 화면 열기' 버튼을 만들고 새 PracticeCounter 화면을 여세요. 예제의 이동 부분을 참고해도 돼요.
// PracticeCounter와 그 State를 아래에 정의하고 count = 0, 증가 버튼을 만드세요.
// initState, build, dispose에 각각 '기록 initState', '기록 build', '기록 dispose' 로그를 넣으세요.
// initState는 super 호출 뒤, dispose는 super 호출 전에 로그를 넣으세요.
//
// [작성 위치와 호출 위치]
// 입력값은 아래 PracticePage 또는 _PracticePageState의 필드에 선언하세요.
// 새 메서드는 같은 클래스의 build 바깥에 정의하고, build 안 버튼의 onPressed에서 호출하거나 전달하세요.
// build는 화면을 만드는 메서드예요. 직접 반복 호출하지 않고 Flutter가 호출하게 둡니다.
// 화면 구조를 바꾸는 문제는 PracticePage의 build 안 TODO를 작성하세요.
// showPractice가 true이면 main의 MaterialApp이 PracticePage를 화면에 연결해요.
//
// [문제의 예상 결과]
// 열기: initState 다음 build / 증가: build가 다시 실행 / 뒤로 가기: dispose / 재열기: 새 initState와 0
//
// [입력 / 조작을 바꿔 다시 확인]
// build 로그가 여러 번 나와도 initState는 같은 State에서 한 번인지 확인하세요. dispose는 앱 종료 때 항상 보장되는 알림이 아니에요.
//
// [내 말로 설명]
// 화면을 가리는 것과 위젯을 트리에서 제거하는 것은 왜 다른가요?

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
class ExamplePage extends StatelessWidget {
  const ExamplePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('달리기 연습')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute<void>(
                builder: (context) => const ExampleCounter(),
              ),
            );
          },
          child: const Text('생명주기 보기'),
        ),
      ),
    );
  }
}

class ExampleCounter extends StatefulWidget {
  const ExampleCounter({super.key});
  @override
  State<ExampleCounter> createState() => _ExampleCounterState();
}

class _ExampleCounterState extends State<ExampleCounter> {
  int count = 0;
  @override
  void initState() {
    super.initState();
    debugPrint('예제 initState');
  }

  @override
  void dispose() {
    debugPrint('예제 dispose');
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    debugPrint('예제 build');
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

// [직접 풀 문제 — 작성 공간]
class PracticePage extends StatelessWidget {
  const PracticePage({super.key});
  // TODO: 문제의 입력 필드나 메서드 정의 위치
  @override
  Widget build(BuildContext context) {
    // TODO: 아래 예제용 안내 화면을 문제에서 요구한 위젯으로 바꾸세요.
    return Scaffold(
      appBar: AppBar(title: const Text('달리기 연습')),
      body: Center(child: const Text('TODO: 여기에 문제 화면을 만드세요.')),
    );
  }
}
