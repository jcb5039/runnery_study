// 9주차 4일 해설 — pop으로 결과 돌려받기
// 실행: flutter run -d chrome -t lib/week09/answers/day04.dart
// 예상 결과:
// 거리 선택 → 5km 선택 클릭 → 원래 화면에 5km 선택 / 뒤로 가기로 닫으면 선택 취소
// 확인 질문: 함수의 return과 화면의 pop(result)은 어떤 점이 비슷한가요?

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
