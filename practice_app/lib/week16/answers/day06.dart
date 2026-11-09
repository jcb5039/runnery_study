// 16주차 6일 해설 — 화면 진입부터 종료까지 추적
// 실행: flutter run -d chrome -t lib/week16/answers/day06.dart
// 예상 결과:
// 열면 편집 시작 / 저장 중 뒤로 가면 편집 종료 / 다시 열면 새 상태와 초기 입력
// 확인 질문: 입력 → 버튼 → 서비스 → 값 변화 → 화면 → 정리까지 함수 이름으로 설명하세요.

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
              MaterialPageRoute<void>(builder: (context) => const MemoEditor()),
            );
          },
          child: const Text('메모 화면'),
        ),
      ),
    );
  }
}

class MemoEditor extends StatefulWidget {
  const MemoEditor({super.key});
  @override
  State<MemoEditor> createState() => _MemoEditorState();
}

class _MemoEditorState extends State<MemoEditor> {
  final store = MemoStore();
  late final TextEditingController controller;
  bool saving = false;
  final bool succeed = true;
  String message = '저장 전';
  @override
  void initState() {
    super.initState();
    debugPrint('편집 시작');
    controller = TextEditingController(text: '저녁 달리기');
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
    debugPrint('편집 종료');
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
  String memo = '';
  Future<void> save(String value, {required bool succeed}) async {
    await Future<void>.delayed(const Duration(milliseconds: 300));
    if (!succeed) throw StateError('저장 실패');
    memo = value;
  }
}
