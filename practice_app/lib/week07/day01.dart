// 7주차 1일 — main → runApp → MaterialApp → Scaffold
// 실행 위치: ~/src/runnery-study/practice_app
// 실행: flutter run -d chrome -t lib/week07/day01.dart
// 처음에는 showPractice = false로 예제를 실행하세요.
// 직접 푼 뒤 true로 바꾸고 저장하세요. 터미널에서 R(대문자)로 다시 시작하세요.
// 다른 날짜를 열 때는 q로 종료하고 그 날짜의 -t 경로로 실행하세요.
// 예제와 문제 작성 공간을 구분했어요. 해설은 answers/day01.dart에 있어요.
//
// [예제 화면 / 관찰할 결과]
// 제목: 달리기 연습 / 가운데: 첫 Flutter 화면
//
// [한 줄씩 읽기]
// 1. main에서 프로그램이 시작돼요.
// 2. runApp에 루트 위젯을 전달해요.
// 3. MaterialApp은 화면 이동과 테마 등 앱의 틀을 제공해요.
// 4. home에 넣은 ExamplePage의 build가 Scaffold를 반환해요.
// 5. Scaffold는 화면 뼈대, AppBar는 제목 영역, Text는 글자예요.
//
// [직접 풀 문제]
// PracticePage의 build에서 Scaffold를 반환하세요. AppBar 제목은 '나의 달리기'로 하세요.
// body에는 Center로 감싼 Text('오늘 3km')를 넣으세요. 새 함수나 상태 변수는 필요 없어요.
//
// [작성 위치와 호출 위치]
// 입력값은 아래 PracticePage 또는 _PracticePageState의 필드에 선언하세요.
// 새 메서드는 같은 클래스의 build 바깥에 정의하고, build 안 버튼의 onPressed에서 호출하거나 전달하세요.
// build는 화면을 만드는 메서드예요. 직접 반복 호출하지 않고 Flutter가 호출하게 둡니다.
// 화면 구조를 바꾸는 문제는 PracticePage의 build 안 TODO를 작성하세요.
// showPractice가 true이면 main의 MaterialApp이 PracticePage를 화면에 연결해요.
//
// [문제의 예상 결과]
// 위쪽 제목: 나의 달리기 / 화면 가운데: 오늘 3km
//
// [입력 / 조작을 바꿔 다시 확인]
// 3km를 5km로 바꾸어 저장한 뒤 r로 갱신해 보세요.
//
// [내 말로 설명]
// main, runApp, MaterialApp, Scaffold, Text를 순서대로 가리켜 보세요.

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
      body: Center(child: const Text('첫 Flutter 화면')),
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
