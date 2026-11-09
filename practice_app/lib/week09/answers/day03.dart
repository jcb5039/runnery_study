// 9주차 3일 해설 — 목록에서 선택한 값 전달
// 실행: flutter run -d chrome -t lib/week09/answers/day03.dart
// 아래 stage 숫자(1·2·3)로 볼 단계를 골라요. 먼저 직접 시도한 뒤 읽고, 닫은 다음 다시 풀어 보세요.
// 1단계 예상 화면: 메뉴 1, 메뉴 2 목록 / 메뉴 2를 누르면 터미널에 메뉴 2 선택
// 2단계 예상 결과:
// 목록 3km, 5km, 7km / 두 번째 클릭 → 5km
// 확인 질문: onTap 안의 km는 목록 전체인가요, 선택한 항목 하나인가요?
// 3단계 예상 화면: 목록: 5.0km, 3.2km / 3.2km 누르면: 기록 r2: 3.2km

import 'package:flutter/material.dart';

int stage = 1; // 1·2·3 중 보고 싶은 단계

void main() {
  const pages = <Widget>[Step1Page(), Step2Page(), Step3Page()];
  runApp(MaterialApp(home: pages[stage - 1]));
}

// ━━━━━━━━━━ 1단계 ━━━━━━━━━━
class Step1Page extends StatelessWidget {
  const Step1Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('1단계')),
      body: ListView(
        children: [
          ListTile(
            title: const Text('메뉴 1'),
            onTap: () => debugPrint('메뉴 1 선택'),
          ),
          ListTile(
            title: const Text('메뉴 2'),
            onTap: () => debugPrint('메뉴 2 선택'),
          ),
        ],
      ),
    );
  }
}

// ━━━━━━━━━━ 2단계 ━━━━━━━━━━
class Step2Page extends StatelessWidget {
  const Step2Page({super.key});
  final List<int> distances = const [3, 5, 7];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('달리기 연습')),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: distances
              .map(
                (km) => ListTile(
                  title: Text('${km}km'),
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute<void>(
                        builder: (context) => RunDetail(km: km),
                      ),
                    );
                  },
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}

class RunDetail extends StatelessWidget {
  final int km;
  const RunDetail({super.key, required this.km});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('기록 상세')),
      body: Center(child: Text('${km}km')),
    );
  }
}

// ━━━━━━━━━━ 3단계 ━━━━━━━━━━
class RecordItem {
  const RecordItem(this.id, this.km);

  final String id;
  final double km;
}

class RecordListLite extends StatelessWidget {
  const RecordListLite({super.key, required this.records});

  final List<RecordItem> records;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('3단계')),
      body: ListView(
        children: [
          for (final r in records)
            ListTile(
              title: Text('${r.km}km'),
              onTap: () => Navigator.of(context).push(
                MaterialPageRoute<void>(builder: (_) => RecordDetailLite(record: r)),
              ),
            ),
        ],
      ),
    );
  }
}

class RecordDetailLite extends StatelessWidget {
  const RecordDetailLite({super.key, required this.record});

  final RecordItem record;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('상세')),
      body: Center(child: Text('기록 ${record.id}: ${record.km}km')),
    );
  }
}

class Step3Page extends StatelessWidget {
  const Step3Page({super.key});

  @override
  Widget build(BuildContext context) {
    return const RecordListLite(
      records: [RecordItem('r1', 5.0), RecordItem('r2', 3.2)],
    );
  }
}
