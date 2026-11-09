// 16주차 5일 해설 — 정상·빈 값·실패를 같은 화면에서 확인
// 실행: flutter run -d chrome -t lib/week16/answers/day05.dart
// 예상 결과:
// 성공 켬 + 새 메모 → 저장 완료 / 공백만 입력 → 메모를 입력하세요 / 성공 끔 → 저장 실패, 직전 저장값 유지
// 확인 질문: 검증 사례가 정상값만 있으면 무엇을 놓칠 수 있나요?

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
  bool succeed = true;
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
            SwitchListTile(
              title: const Text('저장 성공'),
              value: succeed,
              onChanged: saving
                  ? null
                  : (value) => setState(() {
                      succeed = value;
                    }),
            ),
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
