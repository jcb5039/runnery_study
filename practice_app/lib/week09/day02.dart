// 9주차 2일 — 생성자로 상세 화면에 값 전달
// 실행 위치: ~/src/runnery-study/practice_app
// 실행: flutter run -d chrome -t lib/week09/day02.dart
// 처음에는 showPractice = false로 예제를 실행하세요.
// 직접 푼 뒤 true로 바꾸고 저장하세요. 터미널에서 R(대문자)로 다시 시작하세요.
// 다른 날짜를 열 때는 q로 종료하고 그 날짜의 -t 경로로 실행하세요.
// 예제와 문제 작성 공간을 구분했어요. 해설은 answers/day02.dart에 있어요.
//
// [예제 화면 / 관찰할 결과]
// 2km 보기 → 2km
//
// [한 줄씩 읽기]
// 1. 버튼 콜백의 ExampleDetail(km: 2)가 입력값을 전달해요.
// 2. 상세 화면의 required this.km가 필드에 저장해요.
// 3. 상세 화면 build는 자기 필드의 값을 표시해요.
//
// [직접 풀 문제]
// PracticePage에 final int km = 5를 선언하고 '상세 보기' 버튼에서 RunDetail(km: km)을 push하세요.
// RunDetail은 final int km와 required 생성자를 정의하고 거리km를 표시하세요.
//
// [작성 위치와 호출 위치]
// 입력값은 아래 PracticePage 또는 _PracticePageState의 필드에 선언하세요.
// 새 메서드는 같은 클래스의 build 바깥에 정의하고, build 안 버튼의 onPressed에서 호출하거나 전달하세요.
// build는 화면을 만드는 메서드예요. 직접 반복 호출하지 않고 Flutter가 호출하게 둡니다.
// 화면 구조를 바꾸는 문제는 PracticePage의 build 안 TODO를 작성하세요.
// showPractice가 true이면 main의 MaterialApp이 PracticePage를 화면에 연결해요.
//
// [문제의 예상 결과]
// 상세 보기 → 5km
//
// [입력 / 조작을 바꿔 다시 확인]
// PracticePage의 km만 3으로 바꾸면 상세 화면은 3km예요.
//
// [내 말로 설명]
// 상세 화면에 보이는 숫자가 어디에서 선언되고 전달되는지 짚어보세요.

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
                builder: (context) => const ExampleDetail(km: 2),
              ),
            );
          },
          child: const Text('2km 보기'),
        ),
      ),
    );
  }
}

class ExampleDetail extends StatelessWidget {
  final int km;
  const ExampleDetail({super.key, required this.km});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('기록 상세')),
      body: Center(child: Text('${km}km')),
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
