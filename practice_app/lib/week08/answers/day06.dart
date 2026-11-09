// 8주차 6일 해설 — dispose에서 사용한 도구 정리
// 실행: flutter run -d chrome -t lib/week08/answers/day06.dart
// 아래 stage 숫자(1·2·3)로 볼 단계를 골라요. 먼저 직접 시도한 뒤 읽고, 닫은 다음 다시 풀어 보세요.
// 1단계 예상 화면: 입력 칸에 안녕이 들어 있어요. 화면을 닫으면 controller가 정리돼요.
// 2단계 예상 결과:
// 초기 입력: 천천히 달림 / 메모 확인: 아래에도 같은 문구 / 뒤로 가기: 입력 도구 정리 로그
// 확인 질문: initState에서 만든 도구를 dispose에서 정리하는 이유를 말해보세요.
// 3단계 예상 화면: 처음 칸: 29 / 나이 확인 누르면: 나이: 29 / 숫자가 아니면: 숫자를 입력하세요

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
  late final TextEditingController controller;

  @override
  void initState() {
    super.initState();
    controller = TextEditingController(text: '안녕');
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('1단계')),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: TextField(controller: controller),
      ),
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

// ━━━━━━━━━━ 3단계 ━━━━━━━━━━
class AgeFieldLite extends StatefulWidget {
  const AgeFieldLite({super.key});

  @override
  State<AgeFieldLite> createState() => _AgeFieldLiteState();
}

class _AgeFieldLiteState extends State<AgeFieldLite> {
  late final TextEditingController _age;
  String message = '';

  @override
  void initState() {
    super.initState();
    _age = TextEditingController(text: '29 ');
  }

  @override
  void dispose() {
    _age.dispose();
    super.dispose();
  }

  int? get _ageValue => int.tryParse(_age.text.trim());

  void check() {
    setState(() {
      final age = _ageValue;
      message = age == null ? '숫자를 입력하세요' : '나이: $age';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('3단계')),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            TextField(controller: _age),
            ElevatedButton(onPressed: check, child: const Text('나이 확인')),
            Text(message),
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
    return const AgeFieldLite();
  }
}
