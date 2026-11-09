// 9주차 5일 — pushReplacement로 현재 화면 교체
// 실행 위치: ~/src/runnery-study/practice_app
// 실행: flutter run -d chrome -t lib/week09/day05.dart
// 처음에는 showPractice = false로 예제를 실행하세요.
// 직접 푼 뒤 true로 바꾸고 저장하세요. 터미널에서 R(대문자)로 다시 시작하세요.
// 다른 날짜를 열 때는 q로 종료하고 그 날짜의 -t 경로로 실행하세요.
// 예제와 문제 작성 공간을 구분했어요. 해설은 answers/day05.dart에 있어요.
//
// [예제 화면 / 관찰할 결과]
// 시작 완료 → 홈으로 현재 경로 교체
//
// [한 줄씩 읽기]
// 1. push는 기존 화면 위에 새 화면을 쌓아요.
// 2. pushReplacement는 현재 경로를 새 경로로 교체해요.
// 3. 이 예제의 첫 화면을 교체하면 앱 내부 뒤로 가기로 그 화면에 돌아오지 않아요.
//
// [직접 풀 문제]
// PracticePage에 '안내 완료' 버튼을 만들고 HomePage로 pushReplacement하세요.
// HomePage는 '러닝 홈'을 표시하세요. HomePage 클래스는 파일 아래에 정의하세요.
//
// [작성 위치와 호출 위치]
// 입력값은 아래 PracticePage 또는 _PracticePageState의 필드에 선언하세요.
// 새 메서드는 같은 클래스의 build 바깥에 정의하고, build 안 버튼의 onPressed에서 호출하거나 전달하세요.
// build는 화면을 만드는 메서드예요. 직접 반복 호출하지 않고 Flutter가 호출하게 둡니다.
// 화면 구조를 바꾸는 문제는 PracticePage의 build 안 TODO를 작성하세요.
// showPractice가 true이면 main의 MaterialApp이 PracticePage를 화면에 연결해요.
//
// [문제의 예상 결과]
// 안내 완료 → 러닝 홈. 이 예제에서는 AppBar에 이전 안내로 가는 뒤로 가기 버튼이 없어요.
//
// [입력 / 조작을 바꿔 다시 확인]
// pushReplacement를 push로 바꾸어 앱 내부 뒤로 가기 차이를 확인한 뒤 되돌리세요.
//
// [내 말로 설명]
// 로그인 완료 뒤 이전 로그인 화면을 다시 보여줄 필요가 있는지 생각해 보세요.

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
            Navigator.of(context).pushReplacement(
              MaterialPageRoute<void>(
                builder: (context) => const ExampleHome(),
              ),
            );
          },
          child: const Text('시작 완료'),
        ),
      ),
    );
  }
}

class ExampleHome extends StatelessWidget {
  const ExampleHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('달리기 연습')),
      body: Center(child: const Text('홈')),
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
