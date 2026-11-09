// 16주차 3일 해설 — 화면과 저장 함수 나누기
// 실행: flutter run -d chrome -t lib/week16/answers/day03.dart
// 아래 stage 숫자(1·2·3)로 볼 단계를 골라요. 먼저 직접 시도한 뒤 읽고, 닫은 다음 다시 풀어 보세요.
// 1단계 예상 화면: 저장 전 → 저장 → 0.2초 뒤 저장됨: 민수
// 2단계 예상 결과:
// 저장 중 → 저장 완료 / 보관된 메모: 저녁 달리기
// 확인 질문: 파일 저장으로 확장할 때 어느 함수 안에 11주차 코드를 넣을 수 있나요?
// 3단계 예상 화면: 짧은 메모 저장 → 저장 완료 / 보관: 비 옴 → 긴 메모 저장 → 메모가 너무 길어요 / 보관: 비 옴 그대로

import 'package:flutter/material.dart';

int stage = 1; // 1·2·3 중 보고 싶은 단계

void main() {
  const pages = <Widget>[Step1Page(), Step2Page(), Step3Page()];
  runApp(MaterialApp(home: pages[stage - 1]));
}

// ━━━━━━━━━━ 1단계 ━━━━━━━━━━
class Step1Page extends StatefulWidget {
  const Step1Page({super.key});

  @override
  State<Step1Page> createState() => _Step1PageState();
}

class _Step1PageState extends State<Step1Page> {
  final store = NameStore16();
  String message = '저장 전';

  Future<void> save() async {
    await store.save('민수');
    if (!mounted) return;
    setState(() => message = '저장됨: ${store.name}');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('1단계')),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(message),
            ElevatedButton(onPressed: save, child: const Text('저장')),
          ],
        ),
      ),
    );
  }
}

class NameStore16 {
  String name = '';

  Future<void> save(String value) async {
    await Future<void>.delayed(const Duration(milliseconds: 200));
    name = value;
  }
}

// ━━━━━━━━━━ 2단계 ━━━━━━━━━━
class Step2Page extends StatefulWidget {
  const Step2Page({super.key});
  @override
  State<Step2Page> createState() => _Step2PageState();
}

class _Step2PageState extends State<Step2Page> {
  final store = MemoStore();
  late final TextEditingController controller;
  bool saving = false;
  final bool succeed = true;
  String message = '저장 전';
  @override
  void initState() {
    super.initState();
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

// ━━━━━━━━━━ 3단계 ━━━━━━━━━━
class MemoServiceLite {
  String memo = '';

  Future<void> save(String value) async {
    await Future<void>.delayed(const Duration(milliseconds: 100));
    if (value.length > 20) throw StateError('메모가 너무 길어요');
    memo = value;
  }
}

class MemoSaveLite extends StatefulWidget {
  const MemoSaveLite({super.key});

  @override
  State<MemoSaveLite> createState() => _MemoSaveLiteState();
}

class _MemoSaveLiteState extends State<MemoSaveLite> {
  final service = MemoServiceLite();
  String message = '';

  Future<void> save(String value) async {
    try {
      await service.save(value);
      if (!mounted) return;
      setState(() => message = '저장 완료');
    } catch (error) {
      if (!mounted) return;
      setState(() => message = '메모가 너무 길어요');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('3단계')),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(message),
            Text('보관: ${service.memo}'),
            ElevatedButton(onPressed: () => save('비 옴'), child: const Text('짧은 메모 저장')),
            ElevatedButton(
              onPressed: () => save('오늘은 비가 와서 실내 트랙을 열 바퀴 돌았다'),
              child: const Text('긴 메모 저장'),
            ),
          ],
        ),
      ),
    );
  }
}

class Step3Page extends StatelessWidget {
  const Step3Page({super.key});

  @override
  Widget build(BuildContext context) {
    return const MemoSaveLite();
  }
}
