// 12주차 1일 — ChangeNotifier가 변경을 알리기
// 실행 위치: ~/src/runnery-study/practice_app
// 실행: flutter run -d chrome -t lib/week12/day01.dart
// 정답은 answers/day01.dart에 있어요.
// 오늘의 강의: week12/README.md의 "1. 알림을 보내는 저장소: ChangeNotifier — 1일, 2. 화면에서 듣기: ListenableBuilder — 1일, 3~4일" 섹션이에요. 그 섹션만 읽고 풀 수 있어요.
// 처음에는 stage = 0으로 예제를 봐요. 1단계를 풀면 stage = 1로 바꾸고 저장한 뒤 터미널에서 R(대문자)을 눌러요.
// 2단계, 3단계도 stage 숫자만 바꿔 확인해요. 단계마다 [문제] 바로 아래에 그 단계의 화면 클래스가 있어요.
// 다른 날짜를 열 때는 q로 종료하고 그 날짜의 -t 경로로 실행하세요.
//
// [예제 화면 / 관찰할 결과]
// 0km → 추가 한 번 1km
//
// [한 줄씩 읽기]
// 1. ChangeNotifier를 상속한 저장소에 값을 둬요.
// 2. add는 값을 바꾸고 notifyListeners로 알림을 보내요.
// 3. ListenableBuilder는 저장소의 알림을 받고 자기 builder를 다시 실행해요.
// 4. 화면이 만든 저장소는 화면 dispose에서 정리해요. 이 저장소는 메모리에만 있어요.

import 'package:flutter/material.dart';

int stage = 0; // 0 예제, 1·2·3 단계. 숫자를 바꾸고 저장한 뒤 R을 눌러요.

void main() {
  const pages = <Widget>[ExamplePage(), Step1Page(), Step2Page(), Step3Page()];
  runApp(MaterialApp(home: pages[stage]));
}

// [짧은 실행 예제]
class ExamplePage extends StatefulWidget {
  const ExamplePage({super.key});
  @override
  State<ExamplePage> createState() => _ExamplePageState();
}

class _ExamplePageState extends State<ExamplePage> {
  final store = ExampleStore();

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

class ExampleStore extends ChangeNotifier {
  int km = 0;
  void add() {
    km += 1;
    notifyListeners();
  }
}

// ━━━━━━━━━━ 1단계: 예제 따라 하기 ━━━━━━━━━━
// [문제] 파일 아래 TODO ② 자리에 LikeStore extends ChangeNotifier를 정의하세요. int likes = 0, like()는 1을 더한 뒤 notifyListeners()를 불러요.
//        _Step1PageState에서 final store = LikeStore();를 만들고 dispose에서 store.dispose()를 부르세요.
//        body는 ListenableBuilder로 '좋아요 ${store.likes}' Text와 '좋아요' 버튼(onPressed: store.like)을 보여줘요.
// [예상 화면]
// 좋아요 0 → 버튼 두 번 누르면 좋아요 2

class Step1Page extends StatefulWidget {
  const Step1Page({super.key});

  @override
  State<Step1Page> createState() => _Step1PageState();
}

class _Step1PageState extends State<Step1Page> {
  // TODO ①: store를 만들고 dispose를 쓰고, body를 ListenableBuilder로 바꾸세요.

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('1단계')),
      body: const Center(child: Text('TODO: 1단계 화면을 만드세요.')),
    );
  }
}

// TODO ②: 여기에 LikeStore 클래스를 정의하세요.

// ━━━━━━━━━━ 2단계: 직접 작성 ━━━━━━━━━━
// [문제] 파일 아래 RunStore extends ChangeNotifier를 정의하세요. km = 0에서 시작하고 add()는 3을 더한 뒤 notifyListeners를 호출하세요.
//        Step2Page의 State에서 RunStore 객체를 만들고 ListenableBuilder로 거리 Text와 추가 버튼을 연결하세요.
//        dispose에서 store.dispose()를 호출하세요.
// [예상 화면]
// 0km → 추가 한 번 3km → 두 번 6km
// [조작을 바꿔 다시 확인] 앱을 R로 다시 시작하면 메모리 값은 0km예요.

class Step2Page extends StatefulWidget {
  const Step2Page({super.key});
  @override
  State<Step2Page> createState() => _Step2PageState();
}

class _Step2PageState extends State<Step2Page> {
  // TODO: 문제의 상태 변수 선언 위치

  // TODO: 버튼 동작과 필요한 생명주기 메서드 정의 위치

  @override
  Widget build(BuildContext context) {
    // TODO: 아래 예제용 안내 화면을 문제에서 요구한 위젯으로 바꾸세요.
    return Scaffold(
      appBar: AppBar(title: const Text('달리기 연습')),
      body: Center(child: const Text('TODO: 여기에 문제 화면을 만드세요.')),
    );
  }
}

// TODO ②: 문제에서 새 클래스를 요구하면 여기에 정의하세요.

// ━━━━━━━━━━ 3단계: Runnery 코드 읽기 — 달리는 중 1초마다 알리기 ━━━━━━━━━━
// Runnery의 RunningSession(home/running/running_start_page.dart)은 ChangeNotifier예요. 0.5초마다 이렇게 알려요.
//
//   _ticker = Timer.periodic(const Duration(milliseconds: 500), (_) {
//     _checkAutoPause();
//     notifyListeners();
//   });
//
// 읽는 법: 값(시간)이 바뀔 때마다 notifyListeners()로 "다시 그려 줘"라고 알려요. 타이머는 13주차에 배워요.
// 바로 아래 [주어진 코드]는 타이머 대신 '1초 지남' 버튼으로 tick()을 부르게 줄였어요.
// [문제]
// (1) Step3Page의 build에서 Scaffold 대신 return const ClockLite(); 한 줄만 남기세요.
// (2) 실행 전에 '1초 지남'을 두 번 누른 뒤 글자를 [내 예측]에 적고 비교하세요.
// (3) tick() 안의 notifyListeners();를 지우면 버튼을 눌렀을 때 seconds와 화면은 각각 어떻게 될까요?
// [내 예측]
//
// [예상 화면]
// 처음 0:00 → 1초 지남 두 번 → 0:02

// [주어진 코드 — 수정하지 말고 읽기만 하세요]
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
    // TODO ①: 아래 Scaffold 대신 const ClockLite()를 반환하세요.
    return Scaffold(
      appBar: AppBar(title: const Text('3단계')),
      body: const Center(child: Text('TODO: 3단계 화면을 만드세요.')),
    );
  }
}

// [내 말로 설명]
// 값을 바꾸는 코드와 화면을 다시 만들게 알리는 코드는 어느 줄인가요?
