// 8주차 1일 — 콜백은 버튼을 누를 때 실행
// 실행 위치: ~/src/runnery-study/practice_app
// 실행: flutter run -d chrome -t lib/week08/day01.dart
// 처음에는 showPractice = false로 예제를 실행하세요.
// 직접 푼 뒤 true로 바꾸고 저장하세요. 터미널에서 R(대문자)로 다시 시작하세요.
// 다른 날짜를 열 때는 q로 종료하고 그 날짜의 -t 경로로 실행하세요.
// 예제와 문제 작성 공간을 구분했어요. 해설은 answers/day01.dart에 있어요.
//
// [예제 화면 / 관찰할 결과]
// 예제 인사를 누르면 터미널에 안녕하세요
//
// [한 줄씩 읽기]
// 1. sayHello 메서드를 build 바깥에 정의해요.
// 2. onPressed: sayHello는 함수를 전달해요.
// 3. 버튼을 누를 때 Flutter가 호출해요. sayHello()는 그 자리에서 즉시 호출하는 표현이에요.
// 4. debugPrint 결과는 실행한 터미널에서 확인해요.
//
// [직접 풀 문제]
// PracticePage 안 build 바깥에 void startRun()을 정의하고 '달리기 시작'을 debugPrint하세요.
// 버튼 이름은 '시작', onPressed에는 startRun을 전달하세요.
//
// [작성 위치와 호출 위치]
// 입력값은 아래 PracticePage 또는 _PracticePageState의 필드에 선언하세요.
// 새 메서드는 같은 클래스의 build 바깥에 정의하고, build 안 버튼의 onPressed에서 호출하거나 전달하세요.
// build는 화면을 만드는 메서드예요. 직접 반복 호출하지 않고 Flutter가 호출하게 둡니다.
// 화면 구조를 바꾸는 문제는 PracticePage의 build 안 TODO를 작성하세요.
// showPractice가 true이면 main의 MaterialApp이 PracticePage를 화면에 연결해요.
//
// [문제의 예상 결과]
// 처음에는 로그 없음. 시작을 누를 때마다 터미널에 달리기 시작 한 줄.
//
// [입력 / 조작을 바꿔 다시 확인]
// 두 번 누르면 로그도 두 번이에요.
//
// [내 말로 설명]
// onPressed에 함수 이름만 전달하는 이유는 무엇인가요?

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
  void sayHello() {
    debugPrint('안녕하세요');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('달리기 연습')),
      body: Center(
        child: ElevatedButton(onPressed: sayHello, child: const Text('예제 인사')),
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
