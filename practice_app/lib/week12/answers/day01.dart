// 12주차 1일 해설 — ChangeNotifier가 변경을 알리기
// 실행: flutter run -d chrome -t lib/week12/answers/day01.dart
// 아래 stage 숫자(1·2·3)로 볼 단계를 골라요. 먼저 직접 시도한 뒤 읽고, 닫은 다음 다시 풀어 보세요.
// 1단계 예상 화면: 좋아요 0 → 버튼 두 번 누르면 좋아요 2
// 2단계 예상 결과:
// 0km → 추가 한 번 3km → 두 번 6km
// 확인 질문: 값을 바꾸는 코드와 화면을 다시 만들게 알리는 코드는 어느 줄인가요?
// 3단계 예상 화면: 처음 0:00 → 1초 지남 두 번 → 0:02

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
  final store = LikeStore();

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
                Text('좋아요 ${store.likes}'),
                ElevatedButton(onPressed: store.like, child: const Text('좋아요')),
              ],
            );
          },
        ),
      ),
    );
  }
}

class LikeStore extends ChangeNotifier {
  int likes = 0;

  void like() {
    likes++;
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
    km += 3;
    notifyListeners();
  }
}

// ━━━━━━━━━━ 3단계 ━━━━━━━━━━
class SessionLite extends ChangeNotifier {
  int seconds = 0;

  void tick() {
    seconds++;
    notifyListeners();
  }
}

class ClockLite extends StatefulWidget {
  const ClockLite({super.key});

  @override
  State<ClockLite> createState() => _ClockLiteState();
}

class _ClockLiteState extends State<ClockLite> {
  final session = SessionLite();

  @override
  void dispose() {
    session.dispose();
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
              listenable: session,
              builder: (context, child) {
                final s = session.seconds;
                return Text('${s ~/ 60}:${(s % 60).toString().padLeft(2, '0')}');
              },
            ),
            ElevatedButton(onPressed: session.tick, child: const Text('1초 지남')),
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
    return const ClockLite();
  }
}
