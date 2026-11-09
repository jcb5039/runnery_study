// 12주차 2일 해설 — addListener와 removeListener
// 실행: flutter run -d chrome -t lib/week12/answers/day02.dart
// 아래 stage 숫자(1·2·3)로 볼 단계를 골라요. 먼저 직접 시도한 뒤 읽고, 닫은 다음 다시 풀어 보세요.
// 1단계 예상 화면: 물 0잔 → 마시기 누르면 물 1잔
// 2단계 예상 결과:
// 0km → 추가하면 2km씩 증가
// 확인 질문: 등록한 리스너를 왜 제거해야 하나요?
// 3단계 예상 화면: 처음 기록 0개 → 저장 두 번 → 기록 2개

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
  final store = WaterStore();

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
      appBar: AppBar(title: const Text('1단계')),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('물 ${store.cups}잔'),
            ElevatedButton(onPressed: store.drink, child: const Text('마시기')),
          ],
        ),
      ),
    );
  }
}

class WaterStore extends ChangeNotifier {
  int cups = 0;

  void drink() {
    cups++;
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

// ━━━━━━━━━━ 3단계 ━━━━━━━━━━
class RecordStoreLite extends ChangeNotifier {
  final records = <double>[];

  void save(double km) {
    records.add(km);
    notifyListeners();
  }
}

final sharedRecords = RecordStoreLite();

class HomeListenLite extends StatefulWidget {
  const HomeListenLite({super.key});

  @override
  State<HomeListenLite> createState() => _HomeListenLiteState();
}

class _HomeListenLiteState extends State<HomeListenLite> {
  int _count = 0;

  @override
  void initState() {
    super.initState();
    sharedRecords.addListener(_reload);
    _reload();
  }

  @override
  void dispose() {
    sharedRecords.removeListener(_reload);
    super.dispose();
  }

  void _reload() {
    setState(() {
      _count = sharedRecords.records.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('3단계')),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('기록 $_count개'),
            ElevatedButton(
              onPressed: () => sharedRecords.save(3.0),
              child: const Text('저장'),
            ),
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
    return const HomeListenLite();
  }
}
