// 12주차 3일 해설 — ListenableBuilder로 구독 맡기기
// 실행: flutter run -d chrome -t lib/week12/answers/day03.dart
// 아래 stage 숫자(1·2·3)로 볼 단계를 골라요. 먼저 직접 시도한 뒤 읽고, 닫은 다음 다시 풀어 보세요.
// 1단계 예상 화면: 꺼짐 → 스위치 → 켜짐 → 스위치 → 꺼짐
// 2단계 예상 결과:
// 0km → 5km → 10km
// 확인 질문: 수동 리스너 방식에서 어떤 역할을 ListenableBuilder가 맡았나요?
// 3단계 예상 화면: 처음 0.00km → 100m 이동 두 번 → 0.20km

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
  final store = LampStore();

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
                Text(store.on ? '켜짐' : '꺼짐'),
                ElevatedButton(onPressed: store.toggle, child: const Text('스위치')),
              ],
            );
          },
        ),
      ),
    );
  }
}

class LampStore extends ChangeNotifier {
  bool on = false;

  void toggle() {
    on = !on;
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

// ━━━━━━━━━━ 3단계 ━━━━━━━━━━
class TrackLite extends ChangeNotifier {
  double distanceMeters = 0;

  void move(double meters) {
    distanceMeters += meters;
    notifyListeners();
  }
}

String kmText(double meters) => (meters / 1000).toStringAsFixed(2);

class DistanceLite extends StatefulWidget {
  const DistanceLite({super.key});

  @override
  State<DistanceLite> createState() => _DistanceLiteState();
}

class _DistanceLiteState extends State<DistanceLite> {
  final _session = TrackLite();

  @override
  void dispose() {
    _session.dispose();
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
              listenable: _session,
              builder: (context, _) => Text('${kmText(_session.distanceMeters)}km'),
            ),
            ElevatedButton(
              onPressed: () => _session.move(100),
              child: const Text('100m 이동'),
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
    return const DistanceLite();
  }
}
