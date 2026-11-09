// 7주차 4일 — Row로 가로 배치
// 실행 위치: ~/src/runnery-study/practice_app
// 실행: flutter run -d chrome -t lib/week07/day04.dart
// 처음에는 showPractice = false로 예제를 실행하세요.
// 직접 푼 뒤 true로 바꾸고 저장하세요. 터미널에서 R(대문자)로 다시 시작하세요.
// 다른 날짜를 열 때는 q로 종료하고 그 날짜의 -t 경로로 실행하세요.
// 예제와 문제 작성 공간을 구분했어요. 해설은 answers/day04.dart에 있어요.
//
// [예제 화면 / 관찰할 결과]
// 2km와 12분이 가로로 배치돼요.
//
// [한 줄씩 읽기]
// 1. Row는 children을 가로로 배치해요.
// 2. mainAxisAlignment.center는 가로 방향 가운데로 모아요.
// 3. SizedBox(width: 16)은 두 글자 사이 간격이에요.
//
// [직접 풀 문제]
// PracticePage에서 Row로 '거리 3km'와 '시간 20분'을 가로로 놓으세요.
// 두 Text 사이에 폭 24의 SizedBox를 넣고 가운데 정렬하세요.
//
// [작성 위치와 호출 위치]
// 입력값은 아래 PracticePage 또는 _PracticePageState의 필드에 선언하세요.
// 새 메서드는 같은 클래스의 build 바깥에 정의하고, build 안 버튼의 onPressed에서 호출하거나 전달하세요.
// build는 화면을 만드는 메서드예요. 직접 반복 호출하지 않고 Flutter가 호출하게 둡니다.
// 화면 구조를 바꾸는 문제는 PracticePage의 build 안 TODO를 작성하세요.
// showPractice가 true이면 main의 MaterialApp이 PracticePage를 화면에 연결해요.
//
// [문제의 예상 결과]
// 한 줄에 거리 3km와 시간 20분, 사이 간격 24
//
// [입력 / 조작을 바꿔 다시 확인]
// 간격을 0으로 바꾸면 글자가 붙어 보여요.
//
// [내 말로 설명]
// Column과 Row의 주된 배치 방향은 어떻게 다른가요?

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
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Text('2km'), SizedBox(width: 16), Text('12분')],
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
