// 9주차 3일 — 목록에서 선택한 값 전달
// 실행 위치: ~/src/runnery-study/practice_app
// 실행: flutter run -d chrome -t lib/week09/day03.dart
// 처음에는 showPractice = false로 예제를 실행하세요.
// 직접 푼 뒤 true로 바꾸고 저장하세요. 터미널에서 R(대문자)로 다시 시작하세요.
// 다른 날짜를 열 때는 q로 종료하고 그 날짜의 -t 경로로 실행하세요.
// 예제와 문제 작성 공간을 구분했어요. 해설은 answers/day03.dart에 있어요.
//
// [예제 화면 / 관찰할 결과]
// 2km, 4km 중 누른 거리가 상세 화면에 표시돼요.
//
// [한 줄씩 읽기]
// 1. map이 각 거리를 ListTile로 바꿔요.
// 2. onTap 콜백이 그 항목의 km를 사용해요.
// 3. 누른 항목에 따라 상세 화면에 전달되는 값이 달라져요.
//
// [직접 풀 문제]
// PracticePage의 distances = [3, 5, 7]을 final 필드로 선언하세요.
// 각 항목을 ListTile로 표시하고 onTap에서 해당 km를 RunDetail에 전달해 push하세요.
// RunDetail은 int km를 required로 받고 거리km를 표시하세요.
//
// [작성 위치와 호출 위치]
// 입력값은 아래 PracticePage 또는 _PracticePageState의 필드에 선언하세요.
// 새 메서드는 같은 클래스의 build 바깥에 정의하고, build 안 버튼의 onPressed에서 호출하거나 전달하세요.
// build는 화면을 만드는 메서드예요. 직접 반복 호출하지 않고 Flutter가 호출하게 둡니다.
// 화면 구조를 바꾸는 문제는 PracticePage의 build 안 TODO를 작성하세요.
// showPractice가 true이면 main의 MaterialApp이 PracticePage를 화면에 연결해요.
//
// [문제의 예상 결과]
// 목록 3km, 5km, 7km / 두 번째 클릭 → 5km
//
// [입력 / 조작을 바꿔 다시 확인]
// 목록을 const <int>[]로 바꾸면 항목이 없어요. 뒤에 빈 상태 표시를 연습해요.
//
// [내 말로 설명]
// onTap 안의 km는 목록 전체인가요, 선택한 항목 하나인가요?

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
  final List<int> distances = const [2, 4];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('달리기 연습')),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: distances
              .map(
                (km) => ListTile(
                  title: Text('${km}km'),
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute<void>(
                        builder: (context) => ExampleDetail(km: km),
                      ),
                    );
                  },
                ),
              )
              .toList(),
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
