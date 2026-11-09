// 14주차 1일 — 사용자 ID와 로그인 상태
// 실행 위치: ~/src/runnery-study/practice_app
// 실행: flutter run -d chrome -t lib/week14/day01.dart
// 처음에는 showPractice = false로 예제를 실행하세요.
// 직접 푼 뒤 true로 바꾸고 저장하세요. 터미널에서 R(대문자)로 다시 시작하세요.
// 다른 날짜를 열 때는 q로 종료하고 그 날짜의 -t 경로로 실행하세요.
// 예제와 문제 작성 공간을 구분했어요. 해설은 answers/day01.dart에 있어요.
//
// [예제 화면 / 관찰할 결과]
// 가짜 로그인 클릭 → example-user
//
// [한 줄씩 읽기]
// 1. userId가 null이면 로그인한 사용자가 없는 상태로 표현해요.
// 2. 버튼은 연습용 ID를 상태에 넣어요.
// 3. 실제 서비스의 인증 검증과는 별개의 화면 연습이에요.
//
// [직접 풀 문제]
// PracticePage의 State에 String? userId를 선언하세요.
// 로그인 버튼은 setState로 'user-1'을 넣고, 로그아웃 버튼은 null을 넣으세요.
// Text는 userId ?? '로그아웃'을 표시하세요.
//
// [작성 위치와 호출 위치]
// 입력값은 아래 PracticePage 또는 _PracticePageState의 필드에 선언하세요.
// 새 메서드는 같은 클래스의 build 바깥에 정의하고, build 안 버튼의 onPressed에서 호출하거나 전달하세요.
// build는 화면을 만드는 메서드예요. 직접 반복 호출하지 않고 Flutter가 호출하게 둡니다.
// 화면 구조를 바꾸는 문제는 PracticePage의 build 안 TODO를 작성하세요.
// showPractice가 true이면 main의 MaterialApp이 PracticePage를 화면에 연결해요.
//
// [문제의 예상 결과]
// 처음 로그아웃 → 로그인 클릭 user-1 → 로그아웃 클릭 로그아웃
//
// [입력 / 조작을 바꿔 다시 확인]
// ID를 user-2로 바꾸면 표시도 바뀌어요.
//
// [내 말로 설명]
// 화면에 ID를 넣는 것과 서버가 인증하는 것은 왜 다른가요?

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

class _ExamplePageState extends State<ExamplePage> {
  String? userId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('달리기 연습')),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(userId ?? '로그아웃'),
            ElevatedButton(
              onPressed: () => setState(() {
                userId = 'example-user';
              }),
              child: const Text('가짜 로그인'),
            ),
          ],
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
