// 16주차 7일 해설 — 최종 복습: 기록 목록 새로고침
// 실행: flutter run -d chrome -t lib/week16/answers/day07.dart
// 아래 stage 숫자(1·2·3)로 볼 단계를 골라요. 먼저 직접 시도한 뒤 읽고, 닫은 다음 다시 풀어 보세요.
// 1단계 예상 화면: 이름 없음 → 불러오기 → 0.2초 뒤 민수, 지우
// 2단계 예상 결과:
// 새로고침 → 불러오는 중 → 2개 기록, [3.0, 5.0]
// 확인 질문: Runnery의 같은 기능에서 사용자 행동 → 함수 → 데이터 → 화면을 5분 안에 설명할 수 있나요?
// 3단계 예상 화면: 오늘 2회 · 8.2km

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
  List<String> names = [];

  Future<void> load() async {
    final loaded = await loadNames();
    if (!mounted) return;
    setState(() => names = loaded);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('1단계')),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(names.isEmpty ? '이름 없음' : names.join(', ')),
            ElevatedButton(onPressed: load, child: const Text('불러오기')),
          ],
        ),
      ),
    );
  }
}

Future<List<String>> loadNames() async {
  await Future<void>.delayed(const Duration(milliseconds: 200));
  return ['민수', '지우'];
}

// ━━━━━━━━━━ 2단계 ━━━━━━━━━━
class Step2Page extends StatefulWidget {
  const Step2Page({super.key});
  @override
  State<Step2Page> createState() => _Step2PageState();
}

class _Step2PageState extends State<Step2Page> {
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

// ━━━━━━━━━━ 3단계 ━━━━━━━━━━
class DayRun {
  const DayRun(this.startedAt, this.distanceKm);

  final DateTime startedAt;
  final double distanceKm;
}

final allRuns = [
  DayRun(DateTime(2026, 11, 9, 7), 5.0),
  DayRun(DateTime(2026, 11, 8, 19), 3.0),
  DayRun(DateTime(2026, 11, 9, 20), 3.2),
];

class TodayStatsLite extends StatelessWidget {
  const TodayStatsLite({super.key, required this.now});

  final DateTime now;

  List<DayRun> get _today => allRuns
      .where((r) =>
          r.startedAt.year == now.year &&
          r.startedAt.month == now.month &&
          r.startedAt.day == now.day)
      .toList();

  @override
  Widget build(BuildContext context) {
    final today = _today;
    final distanceKm = today.fold<double>(0, (sum, r) => sum + r.distanceKm);
    return Scaffold(
      appBar: AppBar(title: const Text('3단계')),
      body: Center(child: Text('오늘 ${today.length}회 · ${distanceKm}km')),
    );
  }
}

class Step3Page extends StatelessWidget {
  const Step3Page({super.key});

  @override
  Widget build(BuildContext context) {
    return TodayStatsLite(now: DateTime(2026, 11, 9));
  }
}
