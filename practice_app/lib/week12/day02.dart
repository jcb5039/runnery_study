// 12주차 2일 — addListener와 removeListener
// 실행 위치: ~/src/runnery-study/practice_app
// 실행: flutter run -d chrome -t lib/week12/day02.dart
// 정답은 answers/day02.dart에 있어요.
// 오늘의 강의: week12/README.md의 "3. 직접 등록하고 해제하기: addListener, removeListener — 2일, 5~6일" 섹션이에요. 그 섹션만 읽고 풀 수 있어요.
// 처음에는 stage = 0으로 예제를 봐요. 1단계를 풀면 stage = 1로 바꾸고 저장한 뒤 터미널에서 R(대문자)을 눌러요.
// 2단계, 3단계도 stage 숫자만 바꿔 확인해요. 단계마다 [문제] 바로 아래에 그 단계의 화면 클래스가 있어요.
// 다른 날짜를 열 때는 q로 종료하고 그 날짜의 -t 경로로 실행하세요.
//
// [예제 화면 / 관찰할 결과]
// 리스너가 refresh를 호출해 1km씩 갱신돼요.
//
// [한 줄씩 읽기]
// 1. initState에서 store.addListener(refresh)로 함수를 등록해요.
// 2. notifyListeners가 refresh를 호출해요.
// 3. refresh의 setState가 화면 갱신을 예약해요.
// 4. dispose에서 같은 함수 참조로 removeListener를 호출해요. 등록할 때마다 다른 익명 함수를 만들지 않아요.

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

class ExampleStore extends ChangeNotifier {
  int km = 0;
  void add() {
    km += 1;
    notifyListeners();
  }
}

// ━━━━━━━━━━ 1단계: 예제 따라 하기 ━━━━━━━━━━
// [문제] 파일 아래 WaterStore extends ChangeNotifier를 정의하세요. int cups = 0, drink()는 1을 더하고 알려요.
//        _Step1PageState는 store를 만들고, initState에서 store.addListener(refresh)를 하세요. refresh()는 setState(() {})예요.
//        dispose에서는 store.removeListener(refresh) → store.dispose() → super.dispose() 순서예요.
//        body에는 '물 ${store.cups}잔' Text와 '마시기' 버튼을 Column으로 놓아요(ListenableBuilder 없이).
// [예상 화면]
// 물 0잔 → 마시기 누르면 물 1잔

class Step1Page extends StatefulWidget {
  const Step1Page({super.key});

  @override
  State<Step1Page> createState() => _Step1PageState();
}

class _Step1PageState extends State<Step1Page> {
  // TODO ①: store, initState, refresh, dispose를 만들고 body를 Column으로 바꾸세요.

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('1단계')),
      body: const Center(child: Text('TODO: 1단계 화면을 만드세요.')),
    );
  }
}

// TODO ②: 여기에 WaterStore 클래스를 정의하세요.

// ━━━━━━━━━━ 2단계: 직접 작성 ━━━━━━━━━━
// [문제] RunStore는 km = 0, add()에서 2 증가 후 notifyListeners를 하게 정의하세요.
//        Step2Page는 initState에서 refresh를 등록하고 refresh에서 setState(() {})를 호출하세요.
//        build는 store.km와 추가 버튼을 표시하세요. dispose에서 리스너 제거 후 store.dispose를 호출하세요.
// [예상 화면]
// 0km → 추가하면 2km씩 증가
// [조작을 바꿔 다시 확인] notifyListeners를 잠깐 빼서 값만 바뀌고 화면이 그대로인 경우를 확인한 뒤 복구하세요.

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

// ━━━━━━━━━━ 3단계: Runnery 코드 읽기 — 홈 화면이 저장소를 듣는 방법 ━━━━━━━━━━
// Runnery 홈 화면(home/home_page.dart)의 initState와 dispose예요.
//
//   _store.addListener(_reload);
//   _reload();
//   ...
//   _store.removeListener(_reload);
//
// 읽는 법: 저장소가 알리면 _reload가 불려요. 처음 한 번은 직접 _reload()를 불러서 화면을 채워요.
// 바로 아래 [주어진 코드]는 기록 개수를 세는 _reload를 가진 홈 화면이에요. 저장소는 다른 곳과 함께 쓰는 것이라 화면이 dispose하지 않아요.
// [문제]
// (1) Step3Page의 build에서 Scaffold 대신 return const HomeListenLite(); 한 줄만 남기세요.
// (2) 실행 전에 처음 글자와 '저장'을 두 번 누른 뒤 글자를 [내 예측]에 적고 비교하세요.
// (3) 우리 코드 어디에도 저장 버튼에서 _reload를 부르는 줄이 없어요. 그런데 왜 개수가 바뀌나요?
// [내 예측]
//
// [예상 화면]
// 처음 기록 0개 → 저장 두 번 → 기록 2개

// [주어진 코드 — 수정하지 말고 읽기만 하세요]
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
    // TODO ①: 아래 Scaffold 대신 const HomeListenLite()를 반환하세요.
    return Scaffold(
      appBar: AppBar(title: const Text('3단계')),
      body: const Center(child: Text('TODO: 3단계 화면을 만드세요.')),
    );
  }
}

// [내 말로 설명]
// 등록한 리스너를 왜 제거해야 하나요?
