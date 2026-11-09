// 12주차 7일 해설 — 복습: 기록 추가와 비우기
// 실행: flutter run -d chrome -t lib/week12/answers/day07.dart
// 아래 stage 숫자(1·2·3)로 볼 단계를 골라요. 먼저 직접 시도한 뒤 읽고, 닫은 다음 다시 풀어 보세요.
// 1단계 예상 화면: [] → 달리기 추가 → [달리기] → 비우기 → []
// 2단계 예상 결과:
// 추가 두 번: [3.0, 3.0], 합계 6.0km / 비우기: [], 합계 0.0km
// 확인 질문: Runnery의 save → notifyListeners → _reload → setState를 원본 파일에서 찾아 설명하세요.
// 3단계 예상 화면: 처음 r1, r2, r3 → 지우기 → r2, r3 → 지우기 → r3

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
  final store = TagStore();

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
                Text('${store.tags}'),
                ElevatedButton(
                  onPressed: () => store.add('달리기'),
                  child: const Text('달리기 추가'),
                ),
                TextButton(onPressed: store.clear, child: const Text('비우기')),
              ],
            );
          },
        ),
      ),
    );
  }
}

class TagStore extends ChangeNotifier {
  final tags = <String>[];

  void add(String t) {
    tags.add(t);
    notifyListeners();
  }

  void clear() {
    tags.clear();
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
                child: const Text('추가'),
              ),
              TextButton(onPressed: store.clear, child: const Text('비우기')),
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
  void clear() {
    records.clear();
    notifyListeners();
  }

  void add(double km) {
    records.add(km);
    notifyListeners();
  }
}

// ━━━━━━━━━━ 3단계 ━━━━━━━━━━
class DeleteStoreLite extends ChangeNotifier {
  final all = ['r1', 'r2', 'r3'];
  final _deleted = <String>[];

  List<String> get visible => all.where((id) => !_deleted.contains(id)).toList();

  void delete(String id) {
    _deleted.add(id);
    notifyListeners();
  }
}

class DeleteLite extends StatefulWidget {
  const DeleteLite({super.key});

  @override
  State<DeleteLite> createState() => _DeleteLiteState();
}

class _DeleteLiteState extends State<DeleteLite> {
  final store = DeleteStoreLite();

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
        child: ListenableBuilder(
          listenable: store,
          builder: (context, child) => Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(store.visible.join(', ')),
              ElevatedButton(
                onPressed: () => store.delete(store.visible.first),
                child: const Text('첫 기록 지우기'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Step3Page extends StatelessWidget {
  const Step3Page({super.key});

  @override
  Widget build(BuildContext context) {
    return const DeleteLite();
  }
}
