// 9주차 6일 해설 — 같은 기록 객체를 상세 화면에 전달
// 실행: flutter run -d chrome -t lib/week09/answers/day06.dart
// 아래 stage 숫자(1·2·3)로 볼 단계를 골라요. 먼저 직접 시도한 뒤 읽고, 닫은 다음 다시 풀어 보세요.
// 1단계 예상 화면: 신발 보기 → 신발: 빠른신발
// 2단계 예상 결과:
// 상세 보기 → 저녁: 5km
// 확인 질문: 이름과 거리를 따로 전달하는 것과 객체로 전달하는 것을 비교해 보세요.
// 3단계 예상 화면: 상세 → 5.0km / 6'00"

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
      body: Center(
        child: ElevatedButton(
          onPressed: () => Navigator.of(context).push(
            MaterialPageRoute<void>(
              builder: (context) => const ShoeDetail(shoe: Shoe('빠른신발')),
            ),
          ),
          child: const Text('신발 보기'),
        ),
      ),
    );
  }
}

class Shoe {
  const Shoe(this.brand);

  final String brand;
}

class ShoeDetail extends StatelessWidget {
  const ShoeDetail({super.key, required this.shoe});

  final Shoe shoe;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('신발')),
      body: Center(child: Text('신발: ${shoe.brand}')),
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
            const record = PracticeRun('저녁', 5);
            Navigator.of(context).push(
              MaterialPageRoute<void>(
                builder: (context) => const RunDetail(record: record),
              ),
            );
          },
          child: const Text('상세 보기'),
        ),
      ),
    );
  }
}

class PracticeRun {
  final String name;
  final int km;
  const PracticeRun(this.name, this.km);
}

class RunDetail extends StatelessWidget {
  final PracticeRun record;
  const RunDetail({super.key, required this.record});
  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: const Text('상세')),
    body: Center(child: Text('${record.name}: ${record.km}km')),
  );
}

// ━━━━━━━━━━ 3단계 ━━━━━━━━━━
class RecordLite {
  const RecordLite(this.distanceKm, this.movingSeconds);

  final double distanceKm;
  final int movingSeconds;

  String get paceLabel {
    final pace = (movingSeconds / distanceKm).round();
    return "${pace ~/ 60}'${(pace % 60).toString().padLeft(2, '0')}\"";
  }
}

class RecordDetailLite extends StatelessWidget {
  const RecordDetailLite({super.key, required this.record});

  final RecordLite record;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('기록 상세')),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [Text('${record.distanceKm}km'), Text(record.paceLabel)],
        ),
      ),
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
            MaterialPageRoute<void>(
              builder: (context) => const RecordDetailLite(record: RecordLite(5.0, 1800)),
            ),
          ),
          child: const Text('상세'),
        ),
      ),
    );
  }
}
