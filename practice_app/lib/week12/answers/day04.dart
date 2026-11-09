// 12주차 4일 해설 — 목록과 합계 함께 바꾸기
// 실행: flutter run -d chrome -t lib/week12/answers/day04.dart
// 예상 결과:
// 처음 합계 0.0km, [] / 두 번 추가하면 합계 6.0km, [3.0, 3.0]
// 확인 질문: 목록을 바꾼 뒤 합계를 별도 변수로 저장하지 않아도 되는 이유는 무엇인가요?

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
  final store = RunStore();

  @override
  void dispose() {
    store.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('달리기 연습')),
      body: Center(
        child: ListenableBuilder(
          listenable: store,
          builder: (context, child) => Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('합계: ${store.total}km'),
              Text(store.records.toString()),
              ElevatedButton(
                onPressed: () => store.add(3.0),
                child: const Text('3.0km 추가'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class RunStore extends ChangeNotifier {
  final records = <double>[];
  double get total => records.fold<double>(0, (sum, km) => sum + km);
  void add(double km) {
    records.add(km);
    notifyListeners();
  }
}
