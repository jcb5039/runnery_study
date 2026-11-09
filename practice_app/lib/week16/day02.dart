// 16주차 2일 — 기능 선택: 메모 변경 흐름
// 실행 위치: ~/src/runnery-study/practice_app
// 실행: flutter run -d chrome -t lib/week16/day02.dart
// 처음에는 showPractice = false로 예제를 실행하세요.
// 직접 푼 뒤 true로 바꾸고 저장하세요. 터미널에서 R(대문자)로 다시 시작하세요.
// 다른 날짜를 열 때는 q로 종료하고 그 날짜의 -t 경로로 실행하세요.
// 예제와 문제 작성 공간을 구분했어요. 해설은 answers/day02.dart에 있어요.
//
// [예제 화면 / 관찰할 결과]
// 아침 입력을 저장하면 저장: 아침
//
// [한 줄씩 읽기]
// 1. TextField가 입력을 받지만 저장 버튼을 누르기 전에는 저장 문구가 바뀌지 않아요.
// 2. save가 controller.text를 읽어요.
// 3. trim이 양끝 공백을 제거해요.
// 4. setState가 검사 결과를 화면에 표시해요. 지금은 메모리 안에서만 바뀌어요.
//
// [직접 풀 문제]
// PracticePage에 메모 입력창과 저장 버튼을 만드세요. 초기 입력은 '저녁 달리기'예요.
// save()는 trim한 입력이 비면 '메모를 입력하세요', 아니면 '저장: 입력값'을 표시하세요.
// controller는 initState에서 만들고 dispose에서 정리하세요.
// notes.md에 사용자 입력 → save → 상태 변경 → Text 순서를 적으세요.
//
// [작성 위치와 호출 위치]
// 입력값은 아래 PracticePage 또는 _PracticePageState의 필드에 선언하세요.
// 새 메서드는 같은 클래스의 build 바깥에 정의하고, build 안 버튼의 onPressed에서 호출하거나 전달하세요.
// build는 화면을 만드는 메서드예요. 직접 반복 호출하지 않고 Flutter가 호출하게 둡니다.
// 화면 구조를 바꾸는 문제는 PracticePage의 build 안 TODO를 작성하세요.
// showPractice가 true이면 main의 MaterialApp이 PracticePage를 화면에 연결해요.
//
// [문제의 예상 결과]
// 저장 전 → 저장 클릭 → 저장: 저녁 달리기
//
// [입력 / 조작을 바꿔 다시 확인]
// 공백만 입력하면 메모를 입력하세요예요.
//
// [내 말로 설명]
// 화면 입력과 저장된 상태를 구분해서 설명하세요.

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
  late final TextEditingController controller;
  String message = '저장 전';
  @override
  void initState() {
    super.initState();
    controller = TextEditingController(text: '아침');
  }

  void save() {
    final memo = controller.text.trim();
    setState(() {
      message = memo.isEmpty ? '메모를 입력하세요' : '저장: $memo';
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('달리기 연습')),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: TextField(controller: controller),
            ),
            ElevatedButton(onPressed: save, child: const Text('저장')),
            Text(message),
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
