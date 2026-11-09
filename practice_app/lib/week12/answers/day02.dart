// 12주차 2일 해설 — addListener와 removeListener
// 실행: flutter run -d chrome -t lib/week12/answers/day02.dart
// 예상 결과:
// 0km → 추가하면 2km씩 증가
// 확인 질문: 등록한 리스너를 왜 제거해야 하나요?

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
  void initState() {
    super.initState();
    store.addListener(refresh);
  }

  void refresh() {
    setState(() {});
  }

  @override
  void dispose() {
    store.removeListener(refresh);
    store.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('달리기 연습')),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('${store.km}km'),
            ElevatedButton(onPressed: store.add, child: const Text('추가')),
          ],
        ),
      ),
    );
  }
}

class RunStore extends ChangeNotifier {
  int km = 0;
  void add() {
    km += 2;
    notifyListeners();
  }
}
