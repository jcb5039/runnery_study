// 7주차 2일 — StatelessWidget과 build
// 실행 위치: ~/src/runnery-study/practice_app
// 실행: flutter run -d chrome -t lib/week07/day02.dart
// 처음에는 showPractice = false로 예제를 실행하세요.
// 직접 푼 뒤 true로 바꾸고 저장하세요. 터미널에서 R(대문자)로 다시 시작하세요.
// 다른 날짜를 열 때는 q로 종료하고 그 날짜의 -t 경로로 실행하세요.
// 예제와 문제 작성 공간을 구분했어요. 해설은 answers/day02.dart에 있어요.
//
// [예제 화면 / 관찰할 결과]
// 수진: 2km
//
// [한 줄씩 읽기]
// 1. extends StatelessWidget은 화면을 만드는 기본 동작을 이어받아요.
// 2. @override는 부모가 정한 build를 여기서 구현한다는 표시예요.
// 3. build는 Widget을 반환해요. BuildContext는 위젯 트리에서 이 위치의 정보를 제공해요.
// 4. final 필드를 읽어서 Text에 넣어요. const는 가능한 경우 같은 상수 구성을 재사용하게 해요.
//
// [직접 풀 문제]
// PracticePage에 final String name = '민수', final int km = 3을 선언하세요.
// build에서 두 필드를 읽어 '민수: 3km'를 표시하세요. 필드를 다시 대입하는 코드는 쓰지 않아요.
//
// [작성 위치와 호출 위치]
// 입력값은 아래 PracticePage 또는 _PracticePageState의 필드에 선언하세요.
// 새 메서드는 같은 클래스의 build 바깥에 정의하고, build 안 버튼의 onPressed에서 호출하거나 전달하세요.
// build는 화면을 만드는 메서드예요. 직접 반복 호출하지 않고 Flutter가 호출하게 둡니다.
// 화면 구조를 바꾸는 문제는 PracticePage의 build 안 TODO를 작성하세요.
// showPractice가 true이면 main의 MaterialApp이 PracticePage를 화면에 연결해요.
//
// [문제의 예상 결과]
// 민수: 3km
//
// [입력 / 조작을 바꿔 다시 확인]
// name을 지우, km를 5로 바꾸고 R로 다시 시작하면 지우: 5km예요.
//
// [내 말로 설명]
// build의 반환값은 숫자인가요, 화면을 구성하는 Widget인가요?

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
  final String name = '수진';
  final int km = 2;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('달리기 연습')),
      body: Center(child: Text('$name: ${km}km')),
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
