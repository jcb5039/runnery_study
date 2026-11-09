// 16주차 4일 해설 — 실패하면 기존 값 유지하기
// 실행: flutter run -d chrome -t lib/week16/answers/day04.dart
// 예상 결과:
// 저장 실패 / 보관된 메모: 기존 메모 / 입력창: 새 메모
// 확인 질문: 입력값, 저장값, 화면 문구 세 가지를 각각 가리켜 보세요.

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
  final store = MemoStore();
  late final TextEditingController controller;
  bool saving = false;
  final bool succeed = false;
  String message = '저장 전';
  @override
  void initState() {
    super.initState();
    controller = TextEditingController(text: '새 메모');
  }

  Future<void> save() async {
    final value = controller.text.trim();
    if (value.isEmpty) {
      setState(() {
        message = '메모를 입력하세요';
      });
      return;
    }
    setState(() {
      saving = true;
      message = '저장 중';
    });
    try {
      await store.save(value, succeed: succeed);
      if (!mounted) return;
      setState(() {
        message = '저장 완료';
      });
    } catch (error) {
      if (!mounted) return;
      setState(() {
        message = '저장 실패';
      });
    } finally {
      if (mounted) {
        setState(() {
          saving = false;
        });
      }
    }
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
            ElevatedButton(
              onPressed: saving ? null : save,
              child: const Text('저장'),
            ),
            Text(message),
            Text('보관된 메모: ${store.memo}'),
          ],
        ),
      ),
    );
  }
}

class MemoStore {
  String memo = '기존 메모';
  Future<void> save(String value, {required bool succeed}) async {
    await Future<void>.delayed(const Duration(milliseconds: 300));
    if (!succeed) throw StateError('저장 실패');
    memo = value;
  }
}
