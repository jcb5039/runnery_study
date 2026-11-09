// 8주차 2일 — StatefulWidget과 setState
// 실행 위치: ~/src/runnery-study/practice_app
// 실행: flutter run -d chrome -t lib/week08/day02.dart
// 처음에는 showPractice = false로 예제를 실행하세요.
// 직접 푼 뒤 true로 바꾸고 저장하세요. 터미널에서 R(대문자)로 다시 시작하세요.
// 다른 날짜를 열 때는 q로 종료하고 그 날짜의 -t 경로로 실행하세요.
// 예제와 문제 작성 공간을 구분했어요. 해설은 answers/day02.dart에 있어요.
//
// [예제 화면 / 관찰할 결과]
// 0 → +1 버튼을 누르면 1
//
// [한 줄씩 읽기]
// 1. StatefulWidget은 State를 만들어요. 변하는 값은 State에 둬요.
// 2. 버튼이 increase를 호출해요.
// 3. setState 안에서 count가 바뀌어요.
// 4. Flutter가 다시 build할 때 새 count를 Text에 넣어요.
//
// [직접 풀 문제]
// _PracticePageState에 int km = 0을 선언하세요.
// void increase()에서 setState로 km를 1 늘리세요.
// build에는 '${km}km' 형태의 Text와 '1km 추가' 버튼을 놓으세요.
//
// [작성 위치와 호출 위치]
// 입력값은 아래 PracticePage 또는 _PracticePageState의 필드에 선언하세요.
// 새 메서드는 같은 클래스의 build 바깥에 정의하고, build 안 버튼의 onPressed에서 호출하거나 전달하세요.
// build는 화면을 만드는 메서드예요. 직접 반복 호출하지 않고 Flutter가 호출하게 둡니다.
// 화면 구조를 바꾸는 문제는 PracticePage의 build 안 TODO를 작성하세요.
// showPractice가 true이면 main의 MaterialApp이 PracticePage를 화면에 연결해요.
//
// [문제의 예상 결과]
// 처음 0km → 한 번 누르면 1km → 두 번 누르면 2km
//
// [입력 / 조작을 바꿔 다시 확인]
// setState를 빼고 값만 바꾸면 화면 갱신이 예약되지 않는다는 점을 비교한 뒤 되돌리세요.
//
// [내 말로 설명]
// 버튼 클릭 → 값 변경 → build → Text의 순서를 설명하세요.

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
  int count = 0;

  void increase() {
    setState(() {
      count++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('달리기 연습')),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('$count'),
            ElevatedButton(onPressed: increase, child: const Text('+1')),
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
