// 12주차 3일 — ListenableBuilder로 구독 맡기기
// 실행 위치: ~/src/runnery-study/practice_app
// 실행: flutter run -d chrome -t lib/week12/day03.dart
// 정답은 answers/day03.dart에 있어요.
// 오늘의 강의: week12/README.md의 "2. 화면에서 듣기: ListenableBuilder — 1일, 3~4일" 섹션이에요. 그 섹션만 읽고 풀 수 있어요.
// 처음에는 stage = 0으로 예제를 봐요. 1단계를 풀면 stage = 1로 바꾸고 저장한 뒤 터미널에서 R(대문자)을 눌러요.
// 2단계, 3단계도 stage 숫자만 바꿔 확인해요. 단계마다 [문제] 바로 아래에 그 단계의 화면 클래스가 있어요.
// 다른 날짜를 열 때는 q로 종료하고 그 날짜의 -t 경로로 실행하세요.
//
// [예제 화면 / 관찰할 결과]
// 추가할 때마다 2km씩 증가
//
// [한 줄씩 읽기]
// 1. listenable에 변경을 지켜볼 객체를 넣어요.
// 2. builder는 알림을 받을 때 다시 화면을 만들어요.
// 3. ListenableBuilder가 자기 구독을 관리해요. 저장소의 소유자는 여전히 저장소를 정리해야 해요.

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
    km += 2;
    notifyListeners();
  }
}

// ━━━━━━━━━━ 1단계: 예제 따라 하기 ━━━━━━━━━━
// [문제] 파일 아래 LampStore extends ChangeNotifier를 정의하세요. bool on = false, toggle()은 on = !on 뒤에 알려요.
//        _Step1PageState는 store를 만들고 dispose에서 정리하세요.
//        body는 ListenableBuilder로 store.on ? '켜짐' : '꺼짐' Text와 '스위치' 버튼을 보여줘요.
// [예상 화면]
// 꺼짐 → 스위치 → 켜짐 → 스위치 → 꺼짐

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

// TODO ②: 여기에 LampStore 클래스를 정의하세요.

// ━━━━━━━━━━ 2단계: 직접 작성 ━━━━━━━━━━
// [문제] RunStore는 km = 0과 5씩 더하는 add()를 정의하세요.
//        Step2Page에서 수동 addListener 없이 ListenableBuilder로 km와 추가 버튼을 표시하세요.
//        dispose에서 store.dispose()를 호출하세요.
// [예상 화면]
// 0km → 5km → 10km
// [조작을 바꿔 다시 확인] builder 안에 debugPrint를 넣고 언제 호출되는지 확인하세요.

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

// ━━━━━━━━━━ 3단계: Runnery 코드 읽기 — 달리는 거리만 다시 그리기 ━━━━━━━━━━
// Runnery 달리기 화면은 RunningSession을 ListenableBuilder로 듣고, 알림이 오면 거리 글자만 새로 만들어요.
//
//   ListenableBuilder(
//     listenable: _session,
//     builder: (context, _) => Text(RunningFormat.km(_session.distanceMeters)),
//   )
//
// 읽는 법: builder 함수가 알림마다 다시 불려서 새 Text를 돌려줘요. RunningFormat.km은 3주차 6일에 본 함수예요.
// 바로 아래 [주어진 코드]는 GPS 대신 '100m 이동' 버튼으로 거리를 늘려요.
// [문제]
// (1) Step3Page의 build에서 Scaffold 대신 return const DistanceLite(); 한 줄만 남기세요.
// (2) 실행 전에 '100m 이동'을 두 번 누른 뒤 글자를 [내 예측]에 적고 비교하세요.
// (3) 버튼 위젯은 ListenableBuilder 밖에 있어요. 알림이 와도 다시 만들어지는 것은 무엇인가요?
// [내 예측]
//
// [예상 화면]
// 처음 0.00km → 100m 이동 두 번 → 0.20km

// [주어진 코드 — 수정하지 말고 읽기만 하세요]
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
    // TODO ①: 아래 Scaffold 대신 const DistanceLite()를 반환하세요.
    return Scaffold(
      appBar: AppBar(title: const Text('3단계')),
      body: const Center(child: Text('TODO: 3단계 화면을 만드세요.')),
    );
  }
}

// [내 말로 설명]
// 수동 리스너 방식에서 어떤 역할을 ListenableBuilder가 맡았나요?
