// 12주차 6일 해설 — 화면을 닫을 때 리스너 정리
// 실행: flutter run -d chrome -t lib/week12/answers/day06.dart
// 예상 결과:
// 열기 → 추가: 3km / 뒤로 가기: 구독 정리 로그 / 다시 열기: 새 저장소라 0km
// 확인 질문: 저장소 소유자와 리스너를 등록한 화면의 책임을 구분해 보세요.

import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(home: PracticePage()));
}

class PracticePage extends StatelessWidget {
  const PracticePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('달리기 연습')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute<void>(
                builder: (context) => const RecordsPage(),
              ),
            );
          },
          child: const Text('기록 열기'),
        ),
      ),
    );
  }
}

class RecordsPage extends StatefulWidget {
  const RecordsPage({super.key});
  @override
  State<RecordsPage> createState() => _RecordsPageState();
}

class _RecordsPageState extends State<RecordsPage> {
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
    debugPrint('구독 정리');
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
    km += 3;
    notifyListeners();
  }
}
