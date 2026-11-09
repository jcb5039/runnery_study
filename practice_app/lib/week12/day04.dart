// 12주차 4일 — 목록과 합계 함께 바꾸기
// 실행 위치: ~/src/runnery-study/practice_app
// 실행: flutter run -d chrome -t lib/week12/day04.dart
// 정답은 answers/day04.dart에 있어요.
// 오늘의 강의: week12/README.md의 "2. 화면에서 듣기: ListenableBuilder — 1일, 3~4일" 섹션이에요. 그 섹션만 읽고 풀 수 있어요.
// 처음에는 stage = 0으로 예제를 봐요. 1단계를 풀면 stage = 1로 바꾸고 저장한 뒤 터미널에서 R(대문자)을 눌러요.
// 2단계, 3단계도 stage 숫자만 바꿔 확인해요. 단계마다 [문제] 바로 아래에 그 단계의 화면 클래스가 있어요.
// 다른 날짜를 열 때는 q로 종료하고 그 날짜의 -t 경로로 실행하세요.
//
// [예제 화면 / 관찰할 결과]
// 2.0km 추가 시 합계와 목록이 함께 갱신돼요.
//
// [한 줄씩 읽기]
// 1. 저장소의 records가 거리 목록이에요.
// 2. total getter가 현재 목록의 합계를 계산해요.
// 3. add가 목록을 바꾸고 한 번 알리면 목록과 합계가 함께 다시 그려져요.

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
              Text('합계: ${store.total}km'),
              Text(store.records.toString()),
              ElevatedButton(
                onPressed: () => store.add(2.0),
                child: const Text('2.0km 추가'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ExampleStore extends ChangeNotifier {
  final records = <double>[];
  double get total => records.fold<double>(0, (sum, km) => sum + km);
  void add(double km) {
    records.add(km);
    notifyListeners();
  }
}

// ━━━━━━━━━━ 1단계: 예제 따라 하기 ━━━━━━━━━━
// [문제] 파일 아래 NameStore extends ChangeNotifier를 정의하세요. final names = <String>[], int get count => names.length, add(String name)은 목록에 넣고 알려요.
//        _Step1PageState는 store를 만들고 dispose에서 정리하세요.
//        body는 ListenableBuilder로 '${store.count}명' Text와 '민수 추가' 버튼(store.add('민수'))을 보여줘요.
// [예상 화면]
// 0명 → 민수 추가 두 번 → 2명

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

// TODO ②: 여기에 NameStore 클래스를 정의하세요.

// ━━━━━━━━━━ 2단계: 직접 작성 ━━━━━━━━━━
// [문제] RunStore에 records = <double>[], total getter, add(double km)를 정의하세요.
//        add는 records.add(km) 후 notifyListeners를 호출하세요.
//        Step2Page에 합계, 전체 목록, 3.0km 추가 버튼을 ListenableBuilder로 표시하고 저장소를 dispose하세요.
// [예상 화면]
// 처음 합계 0.0km, [] / 두 번 추가하면 합계 6.0km, [3.0, 3.0]
// [조작을 바꿔 다시 확인] 추가할 값을 0.0으로 바꾸면 목록 개수는 늘지만 합계는 그대로예요.

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

// ━━━━━━━━━━ 3단계: Runnery 코드 읽기 — 기록 목록과 합계 getter ━━━━━━━━━━
// Runnery 기록 목록 화면은 기록들의 합계를 fold로 구해요(record/list/record_list_page.dart).
//
//   final total = runs.fold(0.0, (sum, r) => sum + r.distanceKm);
//
// 읽는 법: 4주차의 fold예요. 0.0에서 시작해 기록마다 거리를 더해요.
// 바로 아래 [주어진 코드]는 합계를 getter로 두고, 목록을 바꾼 뒤 한 번 알리는 저장소예요.
// [문제]
// (1) Step3Page의 build에서 Scaffold 대신 return const RecordsLite(); 한 줄만 남기세요.
// (2) 실행 전에 '5km 추가'를 두 번 누른 뒤 두 줄을 [내 예측]에 적고 비교하세요.
// (3) totalKm는 저장소에 따로 저장된 값인가요, 읽을 때마다 계산하는 값인가요?
// [내 예측]
//
// [예상 화면]
// 처음 총 0.0km / 0회 → 5km 추가 두 번 → 총 10.0km / 2회

// [주어진 코드 — 수정하지 말고 읽기만 하세요]
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
    // TODO ①: 아래 Scaffold 대신 const RecordsLite()를 반환하세요.
    return Scaffold(
      appBar: AppBar(title: const Text('3단계')),
      body: const Center(child: Text('TODO: 3단계 화면을 만드세요.')),
    );
  }
}

// [내 말로 설명]
// 목록을 바꾼 뒤 합계를 별도 변수로 저장하지 않아도 되는 이유는 무엇인가요?
