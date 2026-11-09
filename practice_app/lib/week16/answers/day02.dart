// 16주차 2일 해설 — 기능 선택: 메모 변경 흐름
// 실행: flutter run -d chrome -t lib/week16/answers/day02.dart
// 예상 결과:
// 저장 전 → 저장 클릭 → 저장: 저녁 달리기
// 확인 질문: 화면 입력과 저장된 상태를 구분해서 설명하세요.

import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(home: PracticePage()));
}

class PracticePage extends StatefulWidget {
  const PracticePage({super.key});
  @override
  State<PracticePage> createState() => _PracticePageState();
}

class _PracticePageState extends State<PracticePage> {
  late final TextEditingController controller;
  String message = '저장 전';
  @override
  void initState() {
    super.initState();
    controller = TextEditingController(text: '저녁 달리기');
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
