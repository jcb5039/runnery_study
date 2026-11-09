// 8주차 7일 — 복습: 상태와 생명주기 설명하기
// 실행 위치: ~/src/runnery-study/practice_app
// 실행: flutter run -d chrome -t lib/week08/day07.dart
// 처음에는 showPractice = false로 예제를 실행하세요.
// 직접 푼 뒤 true로 바꾸고 저장하세요. 터미널에서 R(대문자)로 다시 시작하세요.
// 다른 날짜를 열 때는 q로 종료하고 그 날짜의 -t 경로로 실행하세요.
// 예제와 문제 작성 공간을 구분했어요. 해설은 answers/day07.dart에 있어요.
//
// [예제 화면 / 관찰할 결과]
// 아래 ExamplePage의 입력값과 버튼 동작을 먼저 확인하세요.
//
// [한 줄씩 읽기]
// 1. 오늘은 상태 변수, 버튼 콜백, 생명주기 로그를 함께 작성해요.
//
// [직접 풀 문제]
// _PracticePageState에 km = 0을 두고 '추가'와 '초기화' 버튼을 만드세요.
// 각 버튼은 setState로 1 증가와 0 대입을 하세요.
// initState에는 '준비', build에는 '그리기', dispose에는 '정리' 로그를 넣으세요.
// 기본 Scaffold와 거리 Text도 직접 구성하세요. 앱을 강제 종료하면 정리 로그가 항상 보장되지는 않아요.
//
// [작성 위치와 호출 위치]
// 입력값은 아래 PracticePage 또는 _PracticePageState의 필드에 선언하세요.
// 새 메서드는 같은 클래스의 build 바깥에 정의하고, build 안 버튼의 onPressed에서 호출하거나 전달하세요.
// build는 화면을 만드는 메서드예요. 직접 반복 호출하지 않고 Flutter가 호출하게 둡니다.
// 화면 구조를 바꾸는 문제는 PracticePage의 build 안 TODO를 작성하세요.
// showPractice가 true이면 main의 MaterialApp이 PracticePage를 화면에 연결해요.
//
// [문제의 예상 결과]
// 시작 0km, 추가 두 번 2km, 초기화 0km. 같은 State에서 준비는 한 번, 그리기는 여러 번 가능.
//
// [입력 / 조작을 바꿔 다시 확인]
// 8주 4일처럼 별도 화면으로 열고 뒤로 가면 정리 로그를 확인할 수 있어요.
//
// [내 말로 설명]
// build에서 파일 저장이나 Timer 생성을 매번 하면 왜 문제가 되나요?

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
      body: Center(child: const Text('0km에서 시작하는 기록 화면을 만드세요.')),
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
