// 16주차 7일 해설 — 최종 복습: 기록 목록 새로고침
// 실행: flutter run -d chrome -t lib/week16/answers/day07.dart
// 예상 결과:
// 새로고침 → 불러오는 중 → 2개 기록, [3.0, 5.0]
// 확인 질문: Runnery의 같은 기능에서 사용자 행동 → 함수 → 데이터 → 화면을 5분 안에 설명할 수 있나요?

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
  List<double> records = [];
  bool loading = false;
  String message = '기록 없음';
  final bool succeed = true;

  Future<void> reload() async {
    setState(() {
      loading = true;
      message = '불러오는 중';
    });
    try {
      final loaded = await loadRecords(succeed: succeed);
      if (!mounted) return;
      setState(() {
        records = loaded;
        message = records.isEmpty ? '기록 없음' : '${records.length}개 기록';
      });
    } catch (error) {
      if (!mounted) return;
      setState(() {
        message = '읽기 실패';
      });
    } finally {
      if (mounted) {
        setState(() {
          loading = false;
        });
      }
    }
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
            Text(records.toString()),
            ElevatedButton(
              onPressed: loading ? null : reload,
              child: const Text('새로고침'),
            ),
          ],
        ),
      ),
    );
  }
}

Future<List<double>> loadRecords({required bool succeed}) async {
  await Future<void>.delayed(const Duration(milliseconds: 300));
  if (!succeed) throw StateError('읽기 실패');
  return [3.0, 5.0];
}
