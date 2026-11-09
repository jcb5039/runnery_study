// 12주차 1일 해설 — ChangeNotifier가 변경을 알리기
// 실행: flutter run -d chrome -t lib/week12/answers/day01.dart
// 예상 결과:
// 0km → 추가 한 번 3km → 두 번 6km
// 확인 질문: 값을 바꾸는 코드와 화면을 다시 만들게 알리는 코드는 어느 줄인가요?

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
    km += 3;
    notifyListeners();
  }
}
