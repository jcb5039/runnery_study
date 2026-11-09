// 12주차 5일 해설 — 저장 완료 → 알림 → 다시 읽기
// 실행: flutter run -d chrome -t lib/week12/answers/day05.dart
// 아래 stage 숫자(1·2·3)로 볼 단계를 골라요. 먼저 직접 시도한 뒤 읽고, 닫은 다음 다시 풀어 보세요.
// 1단계 예상 화면: 메모: 없음 → 저장 누르고 0.2초 뒤 메모: 비 옴
// 2단계 예상 결과:
// 처음 [] / 저장 클릭 후 잠시 뒤 [3.0] / 다시 저장하면 [3.0, 3.0]
// 확인 질문: 이 실습에서 메모리 저장을 파일 저장으로 바꾸려면 어느 함수의 역할이 달라지나요?
// 3단계 예상 화면: 처음 저장 횟수: 0 → 저녁 저장 1 → 저녁 저장 1(그대로) → 아침 저장 2

import 'package:flutter/material.dart';

int stage = 1; // 1·2·3 중 보고 싶은 단계

void main() {
  const pages = <Widget>[Step1Page(), Step2Page(), Step3Page()];
  runApp(MaterialApp(home: pages[stage - 1]));
}

// ━━━━━━━━━━ 1단계 ━━━━━━━━━━
class Step1Page extends StatefulWidget {
  const Step1Page({super.key});

  @override
  State<Step1Page> createState() => _Step1PageState();
}

class _Step1PageState extends State<Step1Page> {
  final store = NoteStore();

  @override
  void dispose() {
    store.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('1단계')),
      body: Center(
        child: ListenableBuilder(
          listenable: store,
          builder: (context, child) {
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('메모: ${store.note}'),
                ElevatedButton(
                  onPressed: () => store.save('비 옴'),
                  child: const Text('저장'),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

class NoteStore extends ChangeNotifier {
  String note = '없음';

  Future<void> save(String value) async {
    await Future<void>.delayed(const Duration(milliseconds: 200));
    note = value;
    notifyListeners();
  }
}

// ━━━━━━━━━━ 2단계 ━━━━━━━━━━
class Step2Page extends StatefulWidget {
  const Step2Page({super.key});
  @override
  State<Step2Page> createState() => _Step2PageState();
}

class _Step2PageState extends State<Step2Page> {
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

// ━━━━━━━━━━ 3단계 ━━━━━━━━━━
class MemoSaveLite extends ChangeNotifier {
  String memo = '';
  int saves = 0;

  Future<void> save(String value) async {
    await Future<void>.delayed(const Duration(milliseconds: 100));
    if (value == memo) return;
    memo = value;
    saves++;
    notifyListeners();
  }
}

class SaveCountLite extends StatefulWidget {
  const SaveCountLite({super.key});

  @override
  State<SaveCountLite> createState() => _SaveCountLiteState();
}

class _SaveCountLiteState extends State<SaveCountLite> {
  final store = MemoSaveLite();

  @override
  void dispose() {
    store.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('3단계')),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListenableBuilder(
              listenable: store,
              builder: (context, child) => Text('저장 횟수: ${store.saves}'),
            ),
            ElevatedButton(onPressed: () => store.save('저녁'), child: const Text('저녁 저장')),
            ElevatedButton(onPressed: () => store.save('아침'), child: const Text('아침 저장')),
          ],
        ),
      ),
    );
  }
}

class Step3Page extends StatelessWidget {
  const Step3Page({super.key});

  @override
  Widget build(BuildContext context) {
    return const SaveCountLite();
  }
}
