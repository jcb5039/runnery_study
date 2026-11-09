// 16주차 6일 해설 — 화면 진입부터 종료까지 추적
// 실행: flutter run -d chrome -t lib/week16/answers/day06.dart
// 아래 stage 숫자(1·2·3)로 볼 단계를 골라요. 먼저 직접 시도한 뒤 읽고, 닫은 다음 다시 풀어 보세요.
// 1단계 예상 화면: 메모 화면 / 열리면 로그 메모 화면 시작, 사라지면 메모 화면 끝
// 2단계 예상 결과:
// 열면 편집 시작 / 저장 중 뒤로 가면 편집 종료 / 다시 열면 새 상태와 초기 입력
// 확인 질문: 입력 → 버튼 → 서비스 → 값 변화 → 화면 → 정리까지 함수 이름으로 설명하세요.
// 3단계 예상 화면: 달리기 화면 → 숫자가 0초, 1초, 2초…로 늘어요 → 뒤로 가기 → 로그 타이머 멈춤

import 'package:flutter/material.dart';
import 'dart:async';

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
  @override
  void initState() {
    super.initState();
    debugPrint('메모 화면 시작');
  }

  @override
  void dispose() {
    debugPrint('메모 화면 끝');
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('1단계')),
      body: const Center(child: Text('메모 화면')),
    );
  }
}

// ━━━━━━━━━━ 2단계 ━━━━━━━━━━
class Step2Page extends StatelessWidget {
  const Step2Page({super.key});

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

// ━━━━━━━━━━ 3단계 ━━━━━━━━━━
class RunPageLite extends StatefulWidget {
  const RunPageLite({super.key});

  @override
  State<RunPageLite> createState() => _RunPageLiteState();
}

class _RunPageLiteState extends State<RunPageLite> {
  Timer? _ticker;
  int seconds = 0;

  @override
  void initState() {
    super.initState();
    _ticker = Timer.periodic(const Duration(milliseconds: 100), (_) {
      setState(() => seconds++);
    });
  }

  @override
  void dispose() {
    _ticker?.cancel();
    debugPrint('타이머 멈춤');
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('달리는 중')),
      body: Center(child: Text('$seconds초')),
    );
  }
}

class Step3Page extends StatelessWidget {
  const Step3Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('3단계')),
      body: Center(
        child: ElevatedButton(
          onPressed: () => Navigator.of(context).push(
            MaterialPageRoute<void>(builder: (context) => const RunPageLite()),
          ),
          child: const Text('달리기 화면'),
        ),
      ),
    );
  }
}
