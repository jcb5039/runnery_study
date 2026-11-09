// 7주차 5일 — Padding과 Card
// 실행 위치: ~/src/runnery-study/practice_app
// 실행: flutter run -d chrome -t lib/week07/day05.dart
// 처음에는 showPractice = false로 예제를 실행하세요.
// 직접 푼 뒤 true로 바꾸고 저장하세요. 터미널에서 R(대문자)로 다시 시작하세요.
// 다른 날짜를 열 때는 q로 종료하고 그 날짜의 -t 경로로 실행하세요.
// 예제와 문제 작성 공간을 구분했어요. 해설은 answers/day05.dart에 있어요.
//
// [예제 화면 / 관찰할 결과]
// 카드 안에 2km 기록이 표시돼요.
//
// [한 줄씩 읽기]
// 1. Card가 기록 영역의 모양을 만들어요.
// 2. Padding이 자식 주변에 여백을 넣어요.
// 3. EdgeInsets.all(12)는 네 방향 모두 12만큼 띄워요.
//
// [직접 풀 문제]
// PracticePage에서 Card → Padding(20) → Column 순서로 감싸세요.
// Column에는 '민수'와 '3km'를 두고 사이에 높이 8의 SizedBox를 넣으세요.
//
// [작성 위치와 호출 위치]
// 입력값은 아래 PracticePage 또는 _PracticePageState의 필드에 선언하세요.
// 새 메서드는 같은 클래스의 build 바깥에 정의하고, build 안 버튼의 onPressed에서 호출하거나 전달하세요.
// build는 화면을 만드는 메서드예요. 직접 반복 호출하지 않고 Flutter가 호출하게 둡니다.
// 화면 구조를 바꾸는 문제는 PracticePage의 build 안 TODO를 작성하세요.
// showPractice가 true이면 main의 MaterialApp이 PracticePage를 화면에 연결해요.
//
// [문제의 예상 결과]
// 여백이 있는 카드 안에 민수와 3km가 세로로 보여요.
//
// [입력 / 조작을 바꿔 다시 확인]
// Padding을 4로 바꾸어 카드 안쪽 공간 변화를 보세요.
//
// [내 말로 설명]
// Padding의 child와 Column의 children은 왜 형태가 다른가요?

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
        child: const Card(
          child: Padding(padding: EdgeInsets.all(12), child: Text('2km 기록')),
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
