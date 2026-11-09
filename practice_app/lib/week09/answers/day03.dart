// 9주차 3일 해설 — 목록에서 선택한 값 전달
// 실행: flutter run -d chrome -t lib/week09/answers/day03.dart
// 예상 결과:
// 목록 3km, 5km, 7km / 두 번째 클릭 → 5km
// 확인 질문: onTap 안의 km는 목록 전체인가요, 선택한 항목 하나인가요?

import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(home: PracticePage()));
}

class PracticePage extends StatelessWidget {
  const PracticePage({super.key});
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
