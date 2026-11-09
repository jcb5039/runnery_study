// 9주차 7일 해설 — 복습: 목록과 상세 이동
// 실행: flutter run -d chrome -t lib/week09/answers/day07.dart
// 예상 결과:
// 3km, 5km 목록 → 5km 선택 → 상세 5km → 목록으로 → 두 항목 유지
// 확인 질문: Runnery의 시작 화면에서 로그인 여부에 따른 분기를 찾아 간단히 그려보세요.

import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(home: PracticePage()));
}

class PracticePage extends StatelessWidget {
  const PracticePage({super.key});
  final List<int> distances = const [3, 5];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('달리기 연습')),
      body: Center(
        child: distances.isEmpty
            ? const Text('기록 없음')
            : Column(
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
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: const Text('상세')),
    body: Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('${km}km'),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('목록으로'),
          ),
        ],
      ),
    ),
  );
}
