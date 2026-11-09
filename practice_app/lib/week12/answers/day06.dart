// 12주차 6일 해설 — 화면을 닫을 때 리스너 정리
// 실행: flutter run -d chrome -t lib/week12/answers/day06.dart
// 아래 stage 숫자(1·2·3)로 볼 단계를 골라요. 먼저 직접 시도한 뒤 읽고, 닫은 다음 다시 풀어 보세요.
// 1단계 예상 화면: 0 → 틱 → 1 / 이 화면이 사라지면 터미널에 저장소 정리
// 2단계 예상 결과:
// 열기 → 추가: 3km / 뒤로 가기: 구독 정리 로그 / 다시 열기: 새 저장소라 0km
// 확인 질문: 저장소 소유자와 리스너를 등록한 화면의 책임을 구분해 보세요.
// 3단계 예상 화면: 카운터 열기 → 0 → +1 → 1 → 뒤로 가기 → 다시 열기 → 1 그대로

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
  final store = TickStore();

  @override
  void dispose() {
    store.dispose();
    debugPrint('저장소 정리');
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('1단계')),
      body: Center(
        child: ListenableBuilder(
          listenable: store,
          builder: (context, child) => Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('${store.ticks}'),
              ElevatedButton(onPressed: store.tick, child: const Text('틱')),
            ],
          ),
        ),
      ),
    );
  }
}

class TickStore extends ChangeNotifier {
  int ticks = 0;

  void tick() {
    ticks++;
    notifyListeners();
  }
}

// ━━━━━━━━━━ 2단계 ━━━━━━━━━━
class Step2Page extends StatelessWidget {
  const Step2Page({super.key});

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

// ━━━━━━━━━━ 3단계 ━━━━━━━━━━
class CounterLite extends ChangeNotifier {
  int value = 0;

  void up() {
    value++;
    notifyListeners();
  }
}

final sharedCounter = CounterLite();

class CounterView extends StatefulWidget {
  const CounterView({super.key});

  @override
  State<CounterView> createState() => _CounterViewState();
}

class _CounterViewState extends State<CounterView> {
  @override
  void initState() {
    super.initState();
    sharedCounter.addListener(refresh);
  }

  void refresh() {
    setState(() {});
  }

  @override
  void dispose() {
    sharedCounter.removeListener(refresh);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('카운터')),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('${sharedCounter.value}'),
            ElevatedButton(onPressed: sharedCounter.up, child: const Text('+1')),
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
    return Scaffold(
      appBar: AppBar(title: const Text('3단계')),
      body: Center(
        child: ElevatedButton(
          onPressed: () => Navigator.of(context).push(
            MaterialPageRoute<void>(builder: (context) => const CounterView()),
          ),
          child: const Text('카운터 열기'),
        ),
      ),
    );
  }
}
