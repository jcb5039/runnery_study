// 12주차 1일 — ChangeNotifier가 변경을 알리기
// 실행 위치: ~/src/runnery-study/practice_app
// 실행: flutter run -d chrome -t lib/week12/day01.dart
// 처음에는 showPractice = false로 예제를 실행하세요.
// 직접 푼 뒤 true로 바꾸고 저장하세요. 터미널에서 R(대문자)로 다시 시작하세요.
// 다른 날짜를 열 때는 q로 종료하고 그 날짜의 -t 경로로 실행하세요.
// 예제와 문제 작성 공간을 구분했어요. 해설은 answers/day01.dart에 있어요.
//
// [예제 화면 / 관찰할 결과]
// 0km → 추가 한 번 1km
//
// [한 줄씩 읽기]
// 1. ChangeNotifier를 상속한 저장소에 값을 둬요.
// 2. add는 값을 바꾸고 notifyListeners로 알림을 보내요.
// 3. ListenableBuilder는 저장소의 알림을 받고 자기 builder를 다시 실행해요.
// 4. 화면이 만든 저장소는 화면 dispose에서 정리해요. 이 저장소는 메모리에만 있어요.
//
// [직접 풀 문제]
// 파일 아래 RunStore extends ChangeNotifier를 정의하세요. km = 0에서 시작하고 add()는 3을 더한 뒤 notifyListeners를 호출하세요.
// PracticePage의 State에서 RunStore 객체를 만들고 ListenableBuilder로 거리 Text와 추가 버튼을 연결하세요.
// dispose에서 store.dispose()를 호출하세요.
//
// [작성 위치와 호출 위치]
// 입력값은 아래 PracticePage 또는 _PracticePageState의 필드에 선언하세요.
// 새 메서드는 같은 클래스의 build 바깥에 정의하고, build 안 버튼의 onPressed에서 호출하거나 전달하세요.
// build는 화면을 만드는 메서드예요. 직접 반복 호출하지 않고 Flutter가 호출하게 둡니다.
// 화면 구조를 바꾸는 문제는 PracticePage의 build 안 TODO를 작성하세요.
// showPractice가 true이면 main의 MaterialApp이 PracticePage를 화면에 연결해요.
//
// [문제의 예상 결과]
// 0km → 추가 한 번 3km → 두 번 6km
//
// [입력 / 조작을 바꿔 다시 확인]
// 앱을 R로 다시 시작하면 메모리 값은 0km예요.
//
// [내 말로 설명]
// 값을 바꾸는 코드와 화면을 다시 만들게 알리는 코드는 어느 줄인가요?

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
