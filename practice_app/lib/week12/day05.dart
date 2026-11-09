// 12주차 5일 — 저장 완료 → 알림 → 다시 읽기
// 실행 위치: ~/src/runnery-study/practice_app
// 실행: flutter run -d chrome -t lib/week12/day05.dart
// 정답은 answers/day05.dart에 있어요.
// 오늘의 강의: week12/README.md의 "3. 직접 등록하고 해제하기: addListener, removeListener — 2일, 5~6일" 섹션이에요. 그 섹션만 읽고 풀 수 있어요.
// 처음에는 stage = 0으로 예제를 봐요. 1단계를 풀면 stage = 1로 바꾸고 저장한 뒤 터미널에서 R(대문자)을 눌러요.
// 2단계, 3단계도 stage 숫자만 바꿔 확인해요. 단계마다 [문제] 바로 아래에 그 단계의 화면 클래스가 있어요.
// 다른 날짜를 열 때는 q로 종료하고 그 날짜의 -t 경로로 실행하세요.
//
// [예제 화면 / 관찰할 결과]
// 저장 완료 알림 뒤 [2.0]으로 표시돼요.
//
// [한 줄씩 읽기]
// 1. save 버튼이 저장소의 비동기 save를 호출해요.
// 2. 예제는 실제 디스크 대신 지연 뒤 메모리에 저장해요.
// 3. 저장 후 알림이 reload를 호출해요.
// 4. reload가 목록 복사본을 기다려 받은 뒤 mounted를 확인하고 setState해요.
// 5. 저장소는 dispose 후 늦게 끝난 작업이 알림을 보내지 않도록 _closed를 확인해요.

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
  List<double> records = [];
  bool saving = false;
  @override
  void initState() {
    super.initState();
    store.addListener(reload);
    reload();
  }

  Future<void> reload() async {
    final loaded = await store.load();
    if (!mounted) return;
    setState(() {
      records = loaded;
    });
  }

  Future<void> save() async {
    setState(() {
      saving = true;
    });
    await store.save(2.0);
    if (!mounted) return;
    setState(() {
      saving = false;
    });
  }

  @override
  void dispose() {
    store.removeListener(reload);
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
            Text(records.toString()),
            ElevatedButton(
              onPressed: saving ? null : save,
              child: const Text('저장'),
            ),
          ],
        ),
      ),
    );
  }
}

class ExampleStore extends ChangeNotifier {
  final records = <double>[];
  bool _closed = false;
  Future<void> save(double km) async {
    await Future<void>.delayed(const Duration(milliseconds: 300));
    if (_closed) return;
    records.add(km);
    notifyListeners();
  }

  Future<List<double>> load() async => List<double>.from(records);
  @override
  void dispose() {
    _closed = true;
    super.dispose();
  }
}

// ━━━━━━━━━━ 1단계: 예제 따라 하기 ━━━━━━━━━━
// [문제] 파일 아래 NoteStore extends ChangeNotifier를 정의하세요. String note = '없음', Future<void> save(String value) async는
//        200밀리초 기다린 뒤 note = value; notifyListeners();를 해요.
//        _Step1PageState는 store를 만들고 dispose에서 정리하세요.
//        body는 ListenableBuilder로 '메모: ${store.note}' Text와 '저장' 버튼(store.save('비 옴'))을 보여줘요.
// [예상 화면]
// 메모: 없음 → 저장 누르고 0.2초 뒤 메모: 비 옴

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

// TODO ②: 여기에 NoteStore 클래스를 정의하세요.

// ━━━━━━━━━━ 2단계: 직접 작성 ━━━━━━━━━━
// [문제] 예제의 저장소 흐름을 참고해 RunStore를 직접 정의하세요: save(double km), load(), dispose().
//        Step2Page는 initState에서 reload를 리스너로 등록하고 처음에도 호출하세요.
//        저장 버튼은 3.0을 저장하며, 대기 중 중복 클릭을 막으세요. reload는 mounted 확인 뒤 records를 갱신하세요.
//        dispose에서 리스너를 제거하고 소유한 저장소를 정리하세요.
// [예상 화면]
// 처음 [] / 저장 클릭 후 잠시 뒤 [3.0] / 다시 저장하면 [3.0, 3.0]
// [조작을 바꿔 다시 확인] reload 안에 로그를 넣어 저장 후 어떤 순서로 호출되는지 확인하세요.

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

// ━━━━━━━━━━ 3단계: Runnery 코드 읽기 — 같은 내용이면 알리지 않기 ━━━━━━━━━━
// Runnery 저장소의 _saveLocal은 파일 내용이 같으면 쓰지도 알리지도 않아요(11주차 4일).
//
//   if (await target.exists() && await target.readAsString() == content) {
//     return;
//   }
//   ... 파일 쓰기 ...
//   notifyListeners();
//
// 읽는 법: 같은 내용이면 return으로 끝나서 notifyListeners()까지 가지 않아요. 그래서 화면이 괜히 다시 그려지지 않아요.
// 바로 아래 [주어진 코드]는 파일 대신 메모 글자와 저장 횟수로 흉내 낸 거예요.
// [문제]
// (1) Step3Page의 build에서 Scaffold 대신 return const SaveCountLite(); 한 줄만 남기세요.
// (2) 실행 전에 '저녁 저장' → '저녁 저장' → '아침 저장'을 차례로 누른 뒤 글자를 [내 예측]에 적고 비교하세요.
// (3) 두 번째 누름에서 saves가 늘지 않은 이유를 코드 줄로 설명하세요.
// [내 예측]
//
// [예상 화면]
// 처음 저장 횟수: 0 → 저녁 저장 1 → 저녁 저장 1(그대로) → 아침 저장 2

// [주어진 코드 — 수정하지 말고 읽기만 하세요]
class MemoSaveLite extends ChangeNotifier {
  String memo = '';
  int saves = 0;

  Future<void> save(String value) async {
    await Future<void>.delayed(const Duration(milliseconds: 100));
    if (value == memo) return;
    memo = value;
    saves++;
    notifyListeners();
  }
}

class SaveCountLite extends StatefulWidget {
  const SaveCountLite({super.key});

  @override
  State<SaveCountLite> createState() => _SaveCountLiteState();
}

class _SaveCountLiteState extends State<SaveCountLite> {
  final store = MemoSaveLite();

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
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListenableBuilder(
              listenable: store,
              builder: (context, child) => Text('저장 횟수: ${store.saves}'),
            ),
            ElevatedButton(onPressed: () => store.save('저녁'), child: const Text('저녁 저장')),
            ElevatedButton(onPressed: () => store.save('아침'), child: const Text('아침 저장')),
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
    // TODO ①: 아래 Scaffold 대신 const SaveCountLite()를 반환하세요.
    return Scaffold(
      appBar: AppBar(title: const Text('3단계')),
      body: const Center(child: Text('TODO: 3단계 화면을 만드세요.')),
    );
  }
}

// [내 말로 설명]
// 이 실습에서 메모리 저장을 파일 저장으로 바꾸려면 어느 함수의 역할이 달라지나요?
