// 7주차 3일 — Column으로 세로 배치
// 실행 위치: ~/src/runnery-study/practice_app
// 실행: flutter run -d chrome -t lib/week07/day03.dart
// 처음에는 showPractice = false로 예제를 실행하세요.
// 직접 푼 뒤 true로 바꾸고 저장하세요. 터미널에서 R(대문자)로 다시 시작하세요.
// 다른 날짜를 열 때는 q로 종료하고 그 날짜의 -t 경로로 실행하세요.
// 예제와 문제 작성 공간을 구분했어요. 해설은 answers/day03.dart에 있어요.
//
// [예제 화면 / 관찰할 결과]
// 위에서부터 수진 → 2km
//
// [한 줄씩 읽기]
// 1. Column은 children 목록을 위에서 아래로 배치해요.
// 2. 각 Text가 목록의 한 항목이에요.
// 3. mainAxisSize.min은 필요한 높이만 사용하게 해요.
//
// [직접 풀 문제]
// PracticePage의 body에 Column을 놓고 '민수', '3km', '20분'을 위에서 아래로 표시하세요.
// Column은 Center 안에 두고 mainAxisSize를 min으로 지정하세요.
//
// [작성 위치와 호출 위치]
// 입력값은 아래 PracticePage 또는 _PracticePageState의 필드에 선언하세요.
// 새 메서드는 같은 클래스의 build 바깥에 정의하고, build 안 버튼의 onPressed에서 호출하거나 전달하세요.
// build는 화면을 만드는 메서드예요. 직접 반복 호출하지 않고 Flutter가 호출하게 둡니다.
// 화면 구조를 바꾸는 문제는 PracticePage의 build 안 TODO를 작성하세요.
// showPractice가 true이면 main의 MaterialApp이 PracticePage를 화면에 연결해요.
//
// [문제의 예상 결과]
// 위에서부터 민수 → 3km → 20분
//
// [입력 / 조작을 바꿔 다시 확인]
// children에서 거리와 시간의 위치를 바꾸면 표시 순서도 바뀌어요.
//
// [내 말로 설명]
// 글자를 그리는 위젯과 세로 배치를 하는 위젯은 각각 무엇인가요?

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
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [const Text('수진'), const Text('2km')],
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
