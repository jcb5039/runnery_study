// 12주차 5일 — 저장 완료 → 알림 → 다시 읽기
// 실행 위치: ~/src/runnery-study/practice_app
// 실행: flutter run -d chrome -t lib/week12/day05.dart
// 처음에는 showPractice = false로 예제를 실행하세요.
// 직접 푼 뒤 true로 바꾸고 저장하세요. 터미널에서 R(대문자)로 다시 시작하세요.
// 다른 날짜를 열 때는 q로 종료하고 그 날짜의 -t 경로로 실행하세요.
// 예제와 문제 작성 공간을 구분했어요. 해설은 answers/day05.dart에 있어요.
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
//
// [직접 풀 문제]
// 예제의 저장소 흐름을 참고해 RunStore를 직접 정의하세요: save(double km), load(), dispose().
// PracticePage는 initState에서 reload를 리스너로 등록하고 처음에도 호출하세요.
// 저장 버튼은 3.0을 저장하며, 대기 중 중복 클릭을 막으세요. reload는 mounted 확인 뒤 records를 갱신하세요.
// dispose에서 리스너를 제거하고 소유한 저장소를 정리하세요.
//
// [작성 위치와 호출 위치]
// 입력값은 아래 PracticePage 또는 _PracticePageState의 필드에 선언하세요.
// 새 메서드는 같은 클래스의 build 바깥에 정의하고, build 안 버튼의 onPressed에서 호출하거나 전달하세요.
// build는 화면을 만드는 메서드예요. 직접 반복 호출하지 않고 Flutter가 호출하게 둡니다.
// 화면 구조를 바꾸는 문제는 PracticePage의 build 안 TODO를 작성하세요.
// showPractice가 true이면 main의 MaterialApp이 PracticePage를 화면에 연결해요.
//
// [문제의 예상 결과]
// 처음 [] / 저장 클릭 후 잠시 뒤 [3.0] / 다시 저장하면 [3.0, 3.0]
//
// [입력 / 조작을 바꿔 다시 확인]
// reload 안에 로그를 넣어 저장 후 어떤 순서로 호출되는지 확인하세요.
//
// [내 말로 설명]
// 이 실습에서 메모리 저장을 파일 저장으로 바꾸려면 어느 함수의 역할이 달라지나요?

import 'package:flutter/material.dart';

bool showPractice = false; // 예제 확인 후 true로 바꾸세요.

void main() {
  runApp(
    MaterialApp(
      home: showPractice ? const PracticePage() : const ExamplePage(),
    ),
  );
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

// [직접 풀 문제 — 작성 공간]
class PracticePage extends StatefulWidget {
  const PracticePage({super.key});
  @override
  State<PracticePage> createState() => _PracticePageState();
}

class _PracticePageState extends State<PracticePage> {
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
