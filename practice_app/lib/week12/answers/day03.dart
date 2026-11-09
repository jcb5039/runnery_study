// 12주차 3일 해설 — ListenableBuilder로 구독 맡기기
// 실행: flutter run -d chrome -t lib/week12/answers/day03.dart
// 예상 결과:
// 0km → 5km → 10km
// 확인 질문: 수동 리스너 방식에서 어떤 역할을 ListenableBuilder가 맡았나요?

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
              Text('${store.km}km'),
              ElevatedButton(onPressed: store.add, child: const Text('추가')),
            ],
          ),
        ),
      ),
    );
  }
}

class RunStore extends ChangeNotifier {
  int km = 0;
  void add() {
    km += 5;
    notifyListeners();
  }
}
