// 12주차 6일 — 화면을 닫을 때 리스너 정리
// 실행 위치: ~/src/runnery-study/practice_app
// 실행: flutter run -d chrome -t lib/week12/day06.dart
// 처음에는 showPractice = false로 예제를 실행하세요.
// 직접 푼 뒤 true로 바꾸고 저장하세요. 터미널에서 R(대문자)로 다시 시작하세요.
// 다른 날짜를 열 때는 q로 종료하고 그 날짜의 -t 경로로 실행하세요.
// 예제와 문제 작성 공간을 구분했어요. 해설은 answers/day06.dart에 있어요.
//
// [예제 화면 / 관찰할 결과]
// 기록 화면을 열고 닫으며 새 State와 저장소 수명을 확인해요.
//
// [한 줄씩 읽기]
// 1. 새 화면의 State가 자기 저장소를 소유해요.
// 2. 화면 진입 시 등록하고 나갈 때 제거해요.
// 3. 전역 공유 저장소라면 화면은 자기 리스너만 제거하고 공유 저장소를 임의로 dispose하지 않아요.
//
// [직접 풀 문제]
// PracticePage는 '기록 열기' 버튼으로 RecordsPage를 여세요.
// RecordsPage는 자기 RunStore를 만들고 initState에 refresh 리스너를 등록하세요.
// RunStore는 3km씩 증가하며 알림을 보내요.
// dispose에서는 removeListener → store.dispose → super.dispose 순으로 정리하고 '구독 정리' 로그를 남기세요.
//
// [작성 위치와 호출 위치]
// 입력값은 아래 PracticePage 또는 _PracticePageState의 필드에 선언하세요.
// 새 메서드는 같은 클래스의 build 바깥에 정의하고, build 안 버튼의 onPressed에서 호출하거나 전달하세요.
// build는 화면을 만드는 메서드예요. 직접 반복 호출하지 않고 Flutter가 호출하게 둡니다.
// 화면 구조를 바꾸는 문제는 PracticePage의 build 안 TODO를 작성하세요.
// showPractice가 true이면 main의 MaterialApp이 PracticePage를 화면에 연결해요.
//
// [문제의 예상 결과]
// 열기 → 추가: 3km / 뒤로 가기: 구독 정리 로그 / 다시 열기: 새 저장소라 0km
//
// [입력 / 조작을 바꿔 다시 확인]
// 세 번 열고 닫아도 한 번의 클릭이 여러 번 처리되지 않는지 확인하세요.
//
// [내 말로 설명]
// 저장소 소유자와 리스너를 등록한 화면의 책임을 구분해 보세요.

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

// [직접 풀 문제 — 작성 공간]
class PracticePage extends StatelessWidget {
  const PracticePage({super.key});
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
