// 8주차 6일 해설 — dispose에서 사용한 도구 정리
// 실행: flutter run -d chrome -t lib/week08/answers/day06.dart
// 예상 결과:
// 초기 입력: 천천히 달림 / 메모 확인: 아래에도 같은 문구 / 뒤로 가기: 입력 도구 정리 로그
// 확인 질문: initState에서 만든 도구를 dispose에서 정리하는 이유를 말해보세요.

import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(home: PracticePage()));
}

class PracticePage extends StatelessWidget {
  const PracticePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('달리기 연습')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute<void>(
                builder: (context) => const PracticeEditor(),
              ),
            );
          },
          child: const Text('메모 입력 화면'),
        ),
      ),
    );
  }
}

class PracticeEditor extends StatefulWidget {
  const PracticeEditor({super.key});
  @override
  State<PracticeEditor> createState() => _PracticeEditorState();
}

class _PracticeEditorState extends State<PracticeEditor> {
  late final TextEditingController controller;
  String saved = '';
  @override
  void initState() {
    super.initState();
    controller = TextEditingController(text: '천천히 달림');
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
