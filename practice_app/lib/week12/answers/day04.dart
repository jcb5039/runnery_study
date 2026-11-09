// 12주차 4일 해설 — 목록과 합계 함께 바꾸기
// 실행: flutter run -d chrome -t lib/week12/answers/day04.dart
// 아래 stage 숫자(1·2·3)로 볼 단계를 골라요. 먼저 직접 시도한 뒤 읽고, 닫은 다음 다시 풀어 보세요.
// 1단계 예상 화면: 0명 → 민수 추가 두 번 → 2명
// 2단계 예상 결과:
// 처음 합계 0.0km, [] / 두 번 추가하면 합계 6.0km, [3.0, 3.0]
// 확인 질문: 목록을 바꾼 뒤 합계를 별도 변수로 저장하지 않아도 되는 이유는 무엇인가요?
// 3단계 예상 화면: 처음 총 0.0km / 0회 → 5km 추가 두 번 → 총 10.0km / 2회

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
  final store = NameStore();

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
                Text('${store.count}명'),
                ElevatedButton(
                  onPressed: () => store.add('민수'),
                  child: const Text('민수 추가'),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

class NameStore extends ChangeNotifier {
  final names = <String>[];

  int get count => names.length;

  void add(String name) {
    names.add(name);
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

// ━━━━━━━━━━ 3단계 ━━━━━━━━━━
class RunsStoreLite extends ChangeNotifier {
  final runs = <double>[];

  double get totalKm => runs.fold(0.0, (sum, km) => sum + km);

  void add(double km) {
    runs.add(km);
    notifyListeners();
  }
}

class RecordsLite extends StatefulWidget {
  const RecordsLite({super.key});

  @override
  State<RecordsLite> createState() => _RecordsLiteState();
}

class _RecordsLiteState extends State<RecordsLite> {
  final store = RunsStoreLite();

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
              Text('총 ${store.totalKm}km'),
              Text('${store.runs.length}회'),
              ElevatedButton(onPressed: () => store.add(5), child: const Text('5km 추가')),
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
    return const RecordsLite();
  }
}
