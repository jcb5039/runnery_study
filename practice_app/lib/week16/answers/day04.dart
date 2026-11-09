// 16주차 4일 해설 — 실패하면 기존 값 유지하기
// 실행: flutter run -d chrome -t lib/week16/answers/day04.dart
// 아래 stage 숫자(1·2·3)로 볼 단계를 골라요. 먼저 직접 시도한 뒤 읽고, 닫은 다음 다시 풀어 보세요.
// 1단계 예상 화면: 저장 → 0.1초 뒤 저장 실패 / 보관: 기존 그대로
// 2단계 예상 결과:
// 저장 실패 / 보관된 메모: 기존 메모 / 입력창: 새 메모
// 확인 질문: 입력값, 저장값, 화면 문구 세 가지를 각각 가리켜 보세요.
// 3단계 예상 화면: [3.0] / 오류 없음 → 새로고침 → [3.0] / 불러오지 못했어요

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
  String saved = '기존';
  String message = '';

  Future<void> trySave() async {
    try {
      await failSave();
      if (!mounted) return;
      setState(() => saved = '새 값');
    } catch (error) {
      if (!mounted) return;
      setState(() => message = '저장 실패');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('1단계')),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('보관: $saved'),
            Text(message),
            ElevatedButton(onPressed: trySave, child: const Text('저장')),
          ],
        ),
      ),
    );
  }
}

Future<void> failSave() async {
  await Future<void>.delayed(const Duration(milliseconds: 100));
  throw StateError('실패');
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

// ━━━━━━━━━━ 3단계 ━━━━━━━━━━
class HomeErrorLite extends StatefulWidget {
  const HomeErrorLite({super.key});

  @override
  State<HomeErrorLite> createState() => _HomeErrorLiteState();
}

class _HomeErrorLiteState extends State<HomeErrorLite> {
  List<double> _records = [3.0];
  Object? _error;

  Future<List<double>> load() async {
    await Future<void>.delayed(const Duration(milliseconds: 100));
    throw StateError('인터넷 끊김');
  }

  Future<void> _reload() async {
    try {
      final loaded = await load();
      if (mounted) {
        setState(() {
          _records = loaded;
          _error = null;
        });
      }
    } catch (error) {
      if (mounted) setState(() => _error = error);
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
            Text('$_records'),
            Text(_error == null ? '오류 없음' : '불러오지 못했어요'),
            ElevatedButton(onPressed: _reload, child: const Text('새로고침')),
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
    return const HomeErrorLite();
  }
}
