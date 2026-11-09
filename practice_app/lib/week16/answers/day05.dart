// 16주차 5일 해설 — 정상·빈 값·실패를 같은 화면에서 확인
// 실행: flutter run -d chrome -t lib/week16/answers/day05.dart
// 아래 stage 숫자(1·2·3)로 볼 단계를 골라요. 먼저 직접 시도한 뒤 읽고, 닫은 다음 다시 풀어 보세요.
// 1단계 예상 화면: 꺼짐 → 알림 줄을 누르면 켜짐
// 2단계 예상 결과:
// 성공 켬 + 새 메모 → 저장 완료 / 공백만 입력 → 메모를 입력하세요 / 성공 끔 → 저장 실패, 직전 저장값 유지
// 확인 질문: 검증 사례가 정상값만 있으면 무엇을 놓칠 수 있나요?
// 3단계 예상 화면: 처음 켜짐: 멈추면 시간도 멈춰요 → 누르면: 계속 시간을 재요

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
  bool on = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('1단계')),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SwitchListTile(
              title: const Text('알림'),
              value: on,
              onChanged: (v) => setState(() => on = v),
            ),
            Text(on ? '켜짐' : '꺼짐'),
          ],
        ),
      ),
    );
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

// ━━━━━━━━━━ 3단계 ━━━━━━━━━━
class AutoPauseLite extends StatefulWidget {
  const AutoPauseLite({super.key});

  @override
  State<AutoPauseLite> createState() => _AutoPauseLiteState();
}

class _AutoPauseLiteState extends State<AutoPauseLite> {
  bool autoPause = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('3단계')),
      body: Center(
        child: SwitchListTile(
          title: const Text('자동 일시정지'),
          subtitle: Text(autoPause ? '멈추면 시간도 멈춰요' : '계속 시간을 재요'),
          value: autoPause,
          onChanged: (v) => setState(() => autoPause = v),
        ),
      ),
    );
  }
}

class Step3Page extends StatelessWidget {
  const Step3Page({super.key});

  @override
  Widget build(BuildContext context) {
    return const AutoPauseLite();
  }
}
