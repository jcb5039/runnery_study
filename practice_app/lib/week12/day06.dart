// 12주차 6일 — 화면을 닫을 때 리스너 정리
// 실행 위치: ~/src/runnery-study/practice_app
// 실행: flutter run -d chrome -t lib/week12/day06.dart
// 정답은 answers/day06.dart에 있어요.
// 오늘의 강의: week12/README.md의 "3. 직접 등록하고 해제하기: addListener, removeListener — 2일, 5~6일" 섹션이에요. 그 섹션만 읽고 풀 수 있어요.
// 처음에는 stage = 0으로 예제를 봐요. 1단계를 풀면 stage = 1로 바꾸고 저장한 뒤 터미널에서 R(대문자)을 눌러요.
// 2단계, 3단계도 stage 숫자만 바꿔 확인해요. 단계마다 [문제] 바로 아래에 그 단계의 화면 클래스가 있어요.
// 다른 날짜를 열 때는 q로 종료하고 그 날짜의 -t 경로로 실행하세요.
//
// [예제 화면 / 관찰할 결과]
// 기록 화면을 열고 닫으며 새 State와 저장소 수명을 확인해요.
//
// [한 줄씩 읽기]
// 1. 새 화면의 State가 자기 저장소를 소유해요.
// 2. 화면 진입 시 등록하고 나갈 때 제거해요.
// 3. 전역 공유 저장소라면 화면은 자기 리스너만 제거하고 공유 저장소를 임의로 dispose하지 않아요.

import 'package:flutter/material.dart';

int stage = 0; // 0 예제, 1·2·3 단계. 숫자를 바꾸고 저장한 뒤 R을 눌러요.

void main() {
  const pages = <Widget>[ExamplePage(), Step1Page(), Step2Page(), Step3Page()];
  runApp(MaterialApp(home: pages[stage]));
}

// [짧은 실행 예제]
class ExamplePage extends StatelessWidget {
  const ExamplePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('달리기 연습')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute<void>(
                builder: (context) => const ExampleRecords(),
              ),
            );
          },
          child: const Text('기록 화면'),
        ),
      ),
    );
  }
}

class ExampleRecords extends StatefulWidget {
  const ExampleRecords({super.key});
  @override
  State<ExampleRecords> createState() => _ExampleRecordsState();
}

class _ExampleRecordsState extends State<ExampleRecords> {
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
// [문제] 파일 아래 TickStore extends ChangeNotifier를 정의하세요(int ticks = 0, tick()은 1 더하고 알림).
//        _Step1PageState는 store를 만들어 쓰고, dispose에서 store.dispose() 뒤 debugPrint('저장소 정리'), 그다음 super.dispose()를 불러요.
//        body는 ListenableBuilder로 '${store.ticks}' Text와 '틱' 버튼을 보여줘요.
// [예상 화면]
// 0 → 틱 → 1 / 이 화면이 사라지면 터미널에 저장소 정리

class Step1Page extends StatefulWidget {
  const Step1Page({super.key});

  @override
  State<Step1Page> createState() => _Step1PageState();
}

class _Step1PageState extends State<Step1Page> {
  // TODO ①: store를 만들고 dispose에 로그를 넣고, body를 ListenableBuilder로 바꾸세요.

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('1단계')),
      body: const Center(child: Text('TODO: 1단계 화면을 만드세요.')),
    );
  }
}

// TODO ②: 여기에 TickStore 클래스를 정의하세요.

// ━━━━━━━━━━ 2단계: 직접 작성 ━━━━━━━━━━
// [문제] Step2Page는 '기록 열기' 버튼으로 RecordsPage를 여세요.
//        RecordsPage는 자기 RunStore를 만들고 initState에 refresh 리스너를 등록하세요.
//        RunStore는 3km씩 증가하며 알림을 보내요.
//        dispose에서는 removeListener → store.dispose → super.dispose 순으로 정리하고 '구독 정리' 로그를 남기세요.
// [예상 화면]
// 열기 → 추가: 3km / 뒤로 가기: 구독 정리 로그 / 다시 열기: 새 저장소라 0km
// [조작을 바꿔 다시 확인] 세 번 열고 닫아도 한 번의 클릭이 여러 번 처리되지 않는지 확인하세요.

class Step2Page extends StatelessWidget {
  const Step2Page({super.key});
  // TODO: 문제의 입력 필드나 메서드 정의 위치
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

// ━━━━━━━━━━ 3단계: Runnery 코드 읽기 — 함께 쓰는 저장소는 화면이 정리하지 않기 ━━━━━━━━━━
// Runnery의 AccountStore.instance처럼 앱 전체가 함께 쓰는 저장소가 있어요.
// 이런 저장소를 듣는 화면은 dispose에서 자기 리스너만 떼고, 저장소 자체는 dispose하지 않아요.
//
// 읽는 법: 바로 아래 [주어진 코드]의 sharedCounter는 파일 맨 바깥에 하나만 만든 저장소예요.
//   CounterView는 열릴 때 듣기 시작하고 닫힐 때 removeListener만 해요.
// [문제]
// (1) Step3Page의 body에 Center로 감싼 '카운터 열기' 버튼을 놓고, 누르면 CounterView를 push하세요.
// (2) 실행 전에 열기 → '+1' → 뒤로 가기 → 다시 열기를 하면 숫자가 무엇일지 [내 예측]에 적고 비교하세요.
// (3) 12주차 6일 2단계는 다시 열면 0이었어요. 여기서는 왜 다른가요?
// [내 예측]
//
// [예상 화면]
// 카운터 열기 → 0 → +1 → 1 → 뒤로 가기 → 다시 열기 → 1 그대로

// [주어진 코드 — 수정하지 말고 읽기만 하세요]
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
    // TODO ①: body를 CounterView를 여는 버튼으로 바꾸세요.
    return Scaffold(
      appBar: AppBar(title: const Text('3단계')),
      body: const Center(child: Text('TODO: 3단계 화면을 만드세요.')),
    );
  }
}

// [내 말로 설명]
// 저장소 소유자와 리스너를 등록한 화면의 책임을 구분해 보세요.
