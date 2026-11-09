// 9주차 4일 해설 — pop으로 결과 돌려받기
// 실행: flutter run -d chrome -t lib/week09/answers/day04.dart
// 아래 stage 숫자(1·2·3)로 볼 단계를 골라요. 먼저 직접 시도한 뒤 읽고, 닫은 다음 다시 풀어 보세요.
// 1단계 예상 화면: 날씨 고르기 → 맑음 누르면 원래 화면에 오늘 날씨: 맑음
// 2단계 예상 결과:
// 거리 선택 → 5km 선택 클릭 → 원래 화면에 5km 선택 / 뒤로 가기로 닫으면 선택 취소
// 확인 질문: 함수의 return과 화면의 pop(result)은 어떤 점이 비슷한가요?
// 3단계 예상 화면: 처음: 메모: 없음 → 메모 수정 → 저장 → 메모: 비 옴 / 뒤로 가기로 닫으면 그대로

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
  String weather = '모름';

  Future<void> pick() async {
    final result = await Navigator.of(context).push<String>(
      MaterialPageRoute(builder: (context) => const WeatherPicker()),
    );
    if (!mounted) return;
    setState(() {
      weather = result ?? '모름';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('1단계')),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('오늘 날씨: $weather'),
            ElevatedButton(onPressed: pick, child: const Text('날씨 고르기')),
          ],
        ),
      ),
    );
  }
}

class WeatherPicker extends StatelessWidget {
  const WeatherPicker({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('날씨')),
      body: Center(
        child: ElevatedButton(
          onPressed: () => Navigator.pop(context, '맑음'),
          child: const Text('맑음'),
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
  String message = '선택 전';

  Future<void> choose() async {
    final result = await Navigator.of(context).push<int>(
      MaterialPageRoute<int>(builder: (context) => const DistancePicker()),
    );
    if (!mounted) return;
    setState(() {
      message = result == null ? '선택 취소' : '${result}km 선택';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('달리기 연습')),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(message),
            ElevatedButton(onPressed: choose, child: const Text('거리 선택')),
          ],
        ),
      ),
    );
  }
}

class DistancePicker extends StatelessWidget {
  const DistancePicker({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('달리기 연습')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.of(context).pop(5);
          },
          child: const Text('5km 선택'),
        ),
      ),
    );
  }
}

// ━━━━━━━━━━ 3단계 ━━━━━━━━━━
class RecordMemoLite extends StatefulWidget {
  const RecordMemoLite({super.key});

  @override
  State<RecordMemoLite> createState() => _RecordMemoLiteState();
}

class _RecordMemoLiteState extends State<RecordMemoLite> {
  String memo = '없음';

  Future<void> edit() async {
    final result = await Navigator.of(context).push<String>(
      MaterialPageRoute(builder: (_) => const MemoEditLite()),
    );
    if (result == null || !mounted) return;
    setState(() {
      memo = result;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('3단계')),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('메모: $memo'),
            ElevatedButton(onPressed: edit, child: const Text('메모 수정')),
          ],
        ),
      ),
    );
  }
}

class MemoEditLite extends StatelessWidget {
  const MemoEditLite({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('메모 수정')),
      body: Center(
        child: ElevatedButton(
          onPressed: () => Navigator.pop(context, '비 옴'),
          child: const Text('저장'),
        ),
      ),
    );
  }
}

class Step3Page extends StatelessWidget {
  const Step3Page({super.key});

  @override
  Widget build(BuildContext context) {
    return const RecordMemoLite();
  }
}
