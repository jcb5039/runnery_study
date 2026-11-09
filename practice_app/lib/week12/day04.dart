// 12주차 4일 — 목록과 합계 함께 바꾸기
// 실행 위치: ~/src/runnery-study/practice_app
// 실행: flutter run -d chrome -t lib/week12/day04.dart
// 처음에는 showPractice = false로 예제를 실행하세요.
// 직접 푼 뒤 true로 바꾸고 저장하세요. 터미널에서 R(대문자)로 다시 시작하세요.
// 다른 날짜를 열 때는 q로 종료하고 그 날짜의 -t 경로로 실행하세요.
// 예제와 문제 작성 공간을 구분했어요. 해설은 answers/day04.dart에 있어요.
//
// [예제 화면 / 관찰할 결과]
// 2.0km 추가 시 합계와 목록이 함께 갱신돼요.
//
// [한 줄씩 읽기]
// 1. 저장소의 records가 거리 목록이에요.
// 2. total getter가 현재 목록의 합계를 계산해요.
// 3. add가 목록을 바꾸고 한 번 알리면 목록과 합계가 함께 다시 그려져요.
//
// [직접 풀 문제]
// RunStore에 records = <double>[], total getter, add(double km)를 정의하세요.
// add는 records.add(km) 후 notifyListeners를 호출하세요.
// PracticePage에 합계, 전체 목록, 3.0km 추가 버튼을 ListenableBuilder로 표시하고 저장소를 dispose하세요.
//
// [작성 위치와 호출 위치]
// 입력값은 아래 PracticePage 또는 _PracticePageState의 필드에 선언하세요.
// 새 메서드는 같은 클래스의 build 바깥에 정의하고, build 안 버튼의 onPressed에서 호출하거나 전달하세요.
// build는 화면을 만드는 메서드예요. 직접 반복 호출하지 않고 Flutter가 호출하게 둡니다.
// 화면 구조를 바꾸는 문제는 PracticePage의 build 안 TODO를 작성하세요.
// showPractice가 true이면 main의 MaterialApp이 PracticePage를 화면에 연결해요.
//
// [문제의 예상 결과]
// 처음 합계 0.0km, [] / 두 번 추가하면 합계 6.0km, [3.0, 3.0]
//
// [입력 / 조작을 바꿔 다시 확인]
// 추가할 값을 0.0으로 바꾸면 목록 개수는 늘지만 합계는 그대로예요.
//
// [내 말로 설명]
// 목록을 바꾼 뒤 합계를 별도 변수로 저장하지 않아도 되는 이유는 무엇인가요?

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
