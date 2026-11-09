// 9주차 6일 — 같은 기록 객체를 상세 화면에 전달
// 실행 위치: ~/src/runnery-study/practice_app
// 실행: flutter run -d chrome -t lib/week09/day06.dart
// 처음에는 showPractice = false로 예제를 실행하세요.
// 직접 푼 뒤 true로 바꾸고 저장하세요. 터미널에서 R(대문자)로 다시 시작하세요.
// 다른 날짜를 열 때는 q로 종료하고 그 날짜의 -t 경로로 실행하세요.
// 예제와 문제 작성 공간을 구분했어요. 해설은 answers/day06.dart에 있어요.
//
// [예제 화면 / 관찰할 결과]
// 기록 보기 → 아침: 2km
//
// [한 줄씩 읽기]
// 1. 클래스 객체로 이름과 거리를 묶어요.
// 2. 상세 화면 생성자에 객체를 전달해요.
// 3. record.name과 record.km은 같은 기록의 값이에요.
//
// [직접 풀 문제]
// PracticeRun(String name, int km) 클래스를 final 필드와 const 생성자로 정의하세요.
// PracticePage에서 PracticeRun('저녁', 5)를 만들어 RunDetail(record: record)에 전달하세요.
// RunDetail은 PracticeRun record를 필수 입력으로 받고 이름과 거리를 표시하세요.
//
// [작성 위치와 호출 위치]
// 입력값은 아래 PracticePage 또는 _PracticePageState의 필드에 선언하세요.
// 새 메서드는 같은 클래스의 build 바깥에 정의하고, build 안 버튼의 onPressed에서 호출하거나 전달하세요.
// build는 화면을 만드는 메서드예요. 직접 반복 호출하지 않고 Flutter가 호출하게 둡니다.
// 화면 구조를 바꾸는 문제는 PracticePage의 build 안 TODO를 작성하세요.
// showPractice가 true이면 main의 MaterialApp이 PracticePage를 화면에 연결해요.
//
// [문제의 예상 결과]
// 상세 보기 → 저녁: 5km
//
// [입력 / 조작을 바꿔 다시 확인]
// 기록 이름만 아침으로 바꾸면 상세에도 아침: 5km예요.
//
// [내 말로 설명]
// 이름과 거리를 따로 전달하는 것과 객체로 전달하는 것을 비교해 보세요.

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
                builder: (context) =>
                    ExampleDetail(record: const ExampleRun('아침', 2)),
              ),
            );
          },
          child: const Text('기록 보기'),
        ),
      ),
    );
  }
}

class ExampleRun {
  final String name;
  final int km;
  const ExampleRun(this.name, this.km);
}

class ExampleDetail extends StatelessWidget {
  final ExampleRun record;
  const ExampleDetail({super.key, required this.record});
  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: const Text('상세')),
    body: Center(child: Text('${record.name}: ${record.km}km')),
  );
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
