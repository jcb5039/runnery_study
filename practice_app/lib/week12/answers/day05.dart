// 12주차 5일 해설 — 저장 완료 → 알림 → 다시 읽기
// 실행: flutter run -d chrome -t lib/week12/answers/day05.dart
// 예상 결과:
// 처음 [] / 저장 클릭 후 잠시 뒤 [3.0] / 다시 저장하면 [3.0, 3.0]
// 확인 질문: 이 실습에서 메모리 저장을 파일 저장으로 바꾸려면 어느 함수의 역할이 달라지나요?

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
  List<double> records = [];
  bool saving = false;
  @override
  void initState() {
    super.initState();
    store.addListener(reload);
    reload();
  }

  Future<void> reload() async {
    final loaded = await store.load();
    if (!mounted) return;
    setState(() {
      records = loaded;
    });
  }

  Future<void> save() async {
    setState(() {
      saving = true;
    });
    await store.save(3.0);
    if (!mounted) return;
    setState(() {
      saving = false;
    });
  }

  @override
  void dispose() {
    store.removeListener(reload);
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
            Text(records.toString()),
            ElevatedButton(
              onPressed: saving ? null : save,
              child: const Text('저장'),
            ),
          ],
        ),
      ),
    );
  }
}

class RunStore extends ChangeNotifier {
  final records = <double>[];
  bool _closed = false;
  Future<void> save(double km) async {
    await Future<void>.delayed(const Duration(milliseconds: 300));
    if (_closed) return;
    records.add(km);
    notifyListeners();
  }

  Future<List<double>> load() async => List<double>.from(records);
  @override
  void dispose() {
    _closed = true;
    super.dispose();
  }
}
