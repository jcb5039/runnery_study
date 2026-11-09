// 7주차 6일 — 작은 위젯으로 분리하고 값 전달하기
// 실행 위치: ~/src/runnery-study/practice_app
// 실행: flutter run -d chrome -t lib/week07/day06.dart
// 처음에는 showPractice = false로 예제를 실행하세요.
// 직접 푼 뒤 true로 바꾸고 저장하세요. 터미널에서 R(대문자)로 다시 시작하세요.
// 다른 날짜를 열 때는 q로 종료하고 그 날짜의 -t 경로로 실행하세요.
// 예제와 문제 작성 공간을 구분했어요. 해설은 answers/day06.dart에 있어요.
//
// [예제 화면 / 관찰할 결과]
// 수진: 2km 카드 한 개
//
// [한 줄씩 읽기]
// 1. ExamplePage가 ExampleCard의 생성자를 호출해요.
// 2. 이름 있는 입력이 카드의 final 필드에 들어가요.
// 3. 카드의 build가 자기 필드를 읽어요. 같은 클래스로 다른 값을 보여줄 수 있어요.
//
// [직접 풀 문제]
// 파일 아래에 RunCard extends StatelessWidget을 정의하세요. name(String), km(int)를 required 생성자로 받으세요.
// RunCard의 build는 Card 안에 '이름: 거리km'를 표시하세요.
// PracticePage의 Column에서 RunCard(name: '민수', km: 3), RunCard(name: '지우', km: 5)를 호출하세요.
//
// [작성 위치와 호출 위치]
// 입력값은 아래 PracticePage 또는 _PracticePageState의 필드에 선언하세요.
// 새 메서드는 같은 클래스의 build 바깥에 정의하고, build 안 버튼의 onPressed에서 호출하거나 전달하세요.
// build는 화면을 만드는 메서드예요. 직접 반복 호출하지 않고 Flutter가 호출하게 둡니다.
// 화면 구조를 바꾸는 문제는 PracticePage의 build 안 TODO를 작성하세요.
// showPractice가 true이면 main의 MaterialApp이 PracticePage를 화면에 연결해요.
//
// [문제의 예상 결과]
// 민수: 3km / 지우: 5km 카드 두 개
//
// [입력 / 조작을 바꿔 다시 확인]
// 두 번째 카드만 7km로 바꾸면 첫 번째는 그대로예요.
//
// [내 말로 설명]
// 카드의 입력값을 선언한 곳과 실제 값을 전달한 곳을 각각 가리켜 보세요.

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
      body: Center(child: const ExampleCard(name: '수진', km: 2)),
    );
  }
}

class ExampleCard extends StatelessWidget {
  final String name;
  final int km;
  const ExampleCard({super.key, required this.name, required this.km});
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Text('$name: ${km}km'),
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
