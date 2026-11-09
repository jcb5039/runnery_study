// 7주차 7일 — 복습: 정적인 기록 카드
// 실행 위치: ~/src/runnery-study/practice_app
// 실행: flutter run -d chrome -t lib/week07/day07.dart
// 처음에는 showPractice = false로 예제를 실행하세요.
// 직접 푼 뒤 true로 바꾸고 저장하세요. 터미널에서 R(대문자)로 다시 시작하세요.
// 다른 날짜를 열 때는 q로 종료하고 그 날짜의 -t 경로로 실행하세요.
// 예제와 문제 작성 공간을 구분했어요. 해설은 answers/day07.dart에 있어요.
//
// [예제 화면 / 관찰할 결과]
// 아래 ExamplePage의 입력값과 버튼 동작을 먼저 확인하세요.
//
// [한 줄씩 읽기]
// 1. 이번에는 필요한 위젯을 먼저 종이에 세로·가로로 배치해 보세요.
//
// [직접 풀 문제]
// PracticePage의 final 필드 name = '민수', km = 5, minutes = 30을 선언하세요.
// Card 안에 Padding(16), Column을 두세요. 위에는 이름, 아래 Row에는 거리와 시간을 표시하세요.
// Row는 mainAxisSize.min, 두 값 사이 간격은 16으로 하세요.
//
// [작성 위치와 호출 위치]
// 입력값은 아래 PracticePage 또는 _PracticePageState의 필드에 선언하세요.
// 새 메서드는 같은 클래스의 build 바깥에 정의하고, build 안 버튼의 onPressed에서 호출하거나 전달하세요.
// build는 화면을 만드는 메서드예요. 직접 반복 호출하지 않고 Flutter가 호출하게 둡니다.
// 화면 구조를 바꾸는 문제는 PracticePage의 build 안 TODO를 작성하세요.
// showPractice가 true이면 main의 MaterialApp이 PracticePage를 화면에 연결해요.
//
// [문제의 예상 결과]
// 카드 위에 민수, 아래 한 줄에 5km와 30분
//
// [입력 / 조작을 바꿔 다시 확인]
// 거리만 0으로 바꾸고 어떤 Text가 바뀔지 먼저 예측하세요.
//
// [내 말로 설명]
// main부터 이 Text까지 이어지는 위젯 트리를 자기 말로 설명하세요.

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
      body: Center(child: const Text('이름·거리·시간 카드를 직접 구성하세요.')),
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
