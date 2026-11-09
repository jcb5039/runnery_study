// 9주차 1일 — push로 새 화면 열기
// 실행 위치: ~/src/runnery-study/practice_app
// 실행: flutter run -d chrome -t lib/week09/day01.dart
// 처음에는 showPractice = false로 예제를 실행하세요.
// 직접 푼 뒤 true로 바꾸고 저장하세요. 터미널에서 R(대문자)로 다시 시작하세요.
// 다른 날짜를 열 때는 q로 종료하고 그 날짜의 -t 경로로 실행하세요.
// 예제와 문제 작성 공간을 구분했어요. 해설은 answers/day01.dart에 있어요.
//
// [예제 화면 / 관찰할 결과]
// 화면 열기 클릭 → 두 번째 화면
//
// [한 줄씩 읽기]
// 1. Navigator는 화면 이동 기록을 관리해요.
// 2. push는 새 경로를 위에 올려요.
// 3. MaterialPageRoute의 builder가 새 화면 위젯을 만들어요.
// 4. AppBar의 뒤로 가기로 이전 화면에 돌아올 수 있어요.
//
// [직접 풀 문제]
// PracticePage에 '기록 보기' 버튼을 만드세요. 버튼에서 MaterialPageRoute<void>로 RunDetail을 push하세요.
// 파일 아래 RunDetail extends StatelessWidget을 정의하고 Scaffold 안에 '오늘 기록'을 표시하세요.
//
// [작성 위치와 호출 위치]
// 입력값은 아래 PracticePage 또는 _PracticePageState의 필드에 선언하세요.
// 새 메서드는 같은 클래스의 build 바깥에 정의하고, build 안 버튼의 onPressed에서 호출하거나 전달하세요.
// build는 화면을 만드는 메서드예요. 직접 반복 호출하지 않고 Flutter가 호출하게 둡니다.
// 화면 구조를 바꾸는 문제는 PracticePage의 build 안 TODO를 작성하세요.
// showPractice가 true이면 main의 MaterialApp이 PracticePage를 화면에 연결해요.
//
// [문제의 예상 결과]
// 기록 보기 클릭 → 오늘 기록 화면 / 뒤로 가기 → 원래 버튼 화면
//
// [입력 / 조작을 바꿔 다시 확인]
// 새 화면을 두 번 열고 돌아오며 이전 화면이 남아 있는지 확인하세요.
//
// [내 말로 설명]
// builder 안의 생성자는 어느 시점에 화면을 만들기 위해 호출되나요?

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
                builder: (context) => const ExampleDetail(),
              ),
            );
          },
          child: const Text('화면 열기'),
        ),
      ),
    );
  }
}

class ExampleDetail extends StatelessWidget {
  const ExampleDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('달리기 연습')),
      body: Center(child: const Text('두 번째 화면')),
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
