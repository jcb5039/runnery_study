// 12주차 2일 — addListener와 removeListener
// 실행 위치: ~/src/runnery-study/practice_app
// 실행: flutter run -d chrome -t lib/week12/day02.dart
// 처음에는 showPractice = false로 예제를 실행하세요.
// 직접 푼 뒤 true로 바꾸고 저장하세요. 터미널에서 R(대문자)로 다시 시작하세요.
// 다른 날짜를 열 때는 q로 종료하고 그 날짜의 -t 경로로 실행하세요.
// 예제와 문제 작성 공간을 구분했어요. 해설은 answers/day02.dart에 있어요.
//
// [예제 화면 / 관찰할 결과]
// 리스너가 refresh를 호출해 1km씩 갱신돼요.
//
// [한 줄씩 읽기]
// 1. initState에서 store.addListener(refresh)로 함수를 등록해요.
// 2. notifyListeners가 refresh를 호출해요.
// 3. refresh의 setState가 화면 갱신을 예약해요.
// 4. dispose에서 같은 함수 참조로 removeListener를 호출해요. 등록할 때마다 다른 익명 함수를 만들지 않아요.
//
// [직접 풀 문제]
// RunStore는 km = 0, add()에서 2 증가 후 notifyListeners를 하게 정의하세요.
// PracticePage는 initState에서 refresh를 등록하고 refresh에서 setState(() {})를 호출하세요.
// build는 store.km와 추가 버튼을 표시하세요. dispose에서 리스너 제거 후 store.dispose를 호출하세요.
//
// [작성 위치와 호출 위치]
// 입력값은 아래 PracticePage 또는 _PracticePageState의 필드에 선언하세요.
// 새 메서드는 같은 클래스의 build 바깥에 정의하고, build 안 버튼의 onPressed에서 호출하거나 전달하세요.
// build는 화면을 만드는 메서드예요. 직접 반복 호출하지 않고 Flutter가 호출하게 둡니다.
// 화면 구조를 바꾸는 문제는 PracticePage의 build 안 TODO를 작성하세요.
// showPractice가 true이면 main의 MaterialApp이 PracticePage를 화면에 연결해요.
//
// [문제의 예상 결과]
// 0km → 추가하면 2km씩 증가
//
// [입력 / 조작을 바꿔 다시 확인]
// notifyListeners를 잠깐 빼서 값만 바뀌고 화면이 그대로인 경우를 확인한 뒤 복구하세요.
//
// [내 말로 설명]
// 등록한 리스너를 왜 제거해야 하나요?

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
