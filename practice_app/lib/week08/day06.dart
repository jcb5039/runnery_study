// 8주차 6일 — dispose에서 사용한 도구 정리
// 실행 위치: ~/src/runnery-study/practice_app
// 실행: flutter run -d chrome -t lib/week08/day06.dart
// 처음에는 showPractice = false로 예제를 실행하세요.
// 직접 푼 뒤 true로 바꾸고 저장하세요. 터미널에서 R(대문자)로 다시 시작하세요.
// 다른 날짜를 열 때는 q로 종료하고 그 날짜의 -t 경로로 실행하세요.
// 예제와 문제 작성 공간을 구분했어요. 해설은 answers/day06.dart에 있어요.
//
// [예제 화면 / 관찰할 결과]
// 초기 입력 아침, 확인 버튼으로 아래에 표시
//
// [한 줄씩 읽기]
// 1. TextEditingController는 입력창 내용을 관리하는 도구예요.
// 2. initState에서 한 번 만들고 TextField에 전달해요.
// 3. controller.text로 지금 입력한 글자를 읽어요.
// 4. 이 State가 소유한 controller를 dispose에서 정리해요.
// 5. 입력 도구를 build 안에서 매번 새로 만들지 않아요.
//
// [직접 풀 문제]
// PracticePage의 버튼에서 PracticeEditor를 여세요.
// PracticeEditor의 State는 initState에서 초기 글자 '천천히 달림'인 controller를 만드세요.
// TextField와 '메모 확인' 버튼, 확인한 메모를 표시할 Text를 넣으세요.
// dispose에서 controller.dispose()를 호출한 뒤 super.dispose()를 호출하세요.
//
// [작성 위치와 호출 위치]
// 입력값은 아래 PracticePage 또는 _PracticePageState의 필드에 선언하세요.
// 새 메서드는 같은 클래스의 build 바깥에 정의하고, build 안 버튼의 onPressed에서 호출하거나 전달하세요.
// build는 화면을 만드는 메서드예요. 직접 반복 호출하지 않고 Flutter가 호출하게 둡니다.
// 화면 구조를 바꾸는 문제는 PracticePage의 build 안 TODO를 작성하세요.
// showPractice가 true이면 main의 MaterialApp이 PracticePage를 화면에 연결해요.
//
// [문제의 예상 결과]
// 초기 입력: 천천히 달림 / 메모 확인: 아래에도 같은 문구 / 뒤로 가기: 입력 도구 정리 로그
//
// [입력 / 조작을 바꿔 다시 확인]
// 입력창을 비우고 확인하면 아래 표시도 빈 문자열이에요.
//
// [내 말로 설명]
// initState에서 만든 도구를 dispose에서 정리하는 이유를 말해보세요.

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
                builder: (context) => const ExampleEditor(),
              ),
            );
          },
          child: const Text('입력 화면'),
        ),
      ),
    );
  }
}

class ExampleEditor extends StatefulWidget {
  const ExampleEditor({super.key});
  @override
  State<ExampleEditor> createState() => _ExampleEditorState();
}

class _ExampleEditorState extends State<ExampleEditor> {
  late final TextEditingController controller;
  String saved = '';
  @override
  void initState() {
    super.initState();
    controller = TextEditingController(text: '아침');
  }

  @override
  void dispose() {
    controller.dispose();
    debugPrint('입력 도구 정리');
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
            ElevatedButton(
              onPressed: () => setState(() {
                saved = controller.text;
              }),
              child: const Text('메모 확인'),
            ),
            Text(saved),
          ],
        ),
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
