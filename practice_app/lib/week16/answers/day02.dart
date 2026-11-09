// 16주차 2일 해설 — 기능 선택: 메모 변경 흐름
// 실행: flutter run -d chrome -t lib/week16/answers/day02.dart
// 아래 stage 숫자(1·2·3)로 볼 단계를 골라요. 먼저 직접 시도한 뒤 읽고, 닫은 다음 다시 풀어 보세요.
// 1단계 예상 화면: 보기 누르면 [안녕] (양끝 공백이 지워짐)
// 2단계 예상 결과:
// 저장 전 → 저장 클릭 → 저장: 저녁 달리기
// 확인 질문: 화면 입력과 저장된 상태를 구분해서 설명하세요.
// 3단계 예상 화면: 이전: (빈 메모) / 이후: 비 옴 / 거리: 5.0km 그대로

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
  final controller = TextEditingController(text: '  안녕  ');
  String shown = '';

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void show() {
    setState(() => shown = '[${controller.text.trim()}]');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('1단계')),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            TextField(controller: controller),
            ElevatedButton(onPressed: show, child: const Text('보기')),
            Text(shown),
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

// ━━━━━━━━━━ 3단계 ━━━━━━━━━━
class MemoRecord {
  const MemoRecord({required this.km, this.memo = ''});

  final double km;
  final String memo;

  Map<String, Object> toJson() => {'km': km, 'memo': memo};

  factory MemoRecord.fromJson(Map<String, Object> json) =>
      MemoRecord(km: json['km'] as double, memo: json['memo'] as String);

  MemoRecord withMemo(String value) => MemoRecord.fromJson({...toJson(), 'memo': value});
}

class MemoCompareLite extends StatelessWidget {
  const MemoCompareLite({super.key});

  @override
  Widget build(BuildContext context) {
    const before = MemoRecord(km: 5.0);
    final after = before.withMemo('비 옴');
    return Scaffold(
      appBar: AppBar(title: const Text('3단계')),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('이전: ${before.memo.isEmpty ? '(빈 메모)' : before.memo}'),
            Text('이후: ${after.memo}'),
            Text('거리: ${after.km}km'),
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
    return const MemoCompareLite();
  }
}
