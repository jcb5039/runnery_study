// 9주차 4일 — pop으로 결과 돌려받기
// 실행 위치: ~/src/runnery-study/practice_app
// 실행: flutter run -d chrome -t lib/week09/day04.dart
// 처음에는 showPractice = false로 예제를 실행하세요.
// 직접 푼 뒤 true로 바꾸고 저장하세요. 터미널에서 R(대문자)로 다시 시작하세요.
// 다른 날짜를 열 때는 q로 종료하고 그 날짜의 -t 경로로 실행하세요.
// 예제와 문제 작성 공간을 구분했어요. 해설은 answers/day04.dart에 있어요.
//
// [예제 화면 / 관찰할 결과]
// 선택 화면에서 2km를 고르면 원래 화면에 2km 선택
//
// [한 줄씩 읽기]
// 1. push<int>의 결과를 await하면 다음 화면이 닫힐 때까지 기다려요.
// 2. pop(2)는 화면을 닫으며 2를 돌려줘요.
// 3. 시스템 뒤로 가기는 결과가 null일 수 있어요.
// 4. 기다린 뒤 mounted를 확인하고 결과를 상태에 넣어요.
//
// [직접 풀 문제]
// PracticePage의 State에 message = '선택 전'을 선언하세요.
// choose()에서 DistancePicker를 push<int>로 열고 기다리세요. 결과를 받은 뒤 mounted를 확인하세요.
// null이면 '선택 취소', 아니면 '5km 선택'처럼 표시하세요.
// DistancePicker는 '5km 선택' 버튼에서 Navigator.pop(context, 5)를 호출하게 만드세요.
//
// [작성 위치와 호출 위치]
// 입력값은 아래 PracticePage 또는 _PracticePageState의 필드에 선언하세요.
// 새 메서드는 같은 클래스의 build 바깥에 정의하고, build 안 버튼의 onPressed에서 호출하거나 전달하세요.
// build는 화면을 만드는 메서드예요. 직접 반복 호출하지 않고 Flutter가 호출하게 둡니다.
// 화면 구조를 바꾸는 문제는 PracticePage의 build 안 TODO를 작성하세요.
// showPractice가 true이면 main의 MaterialApp이 PracticePage를 화면에 연결해요.
//
// [문제의 예상 결과]
// 거리 선택 → 5km 선택 클릭 → 원래 화면에 5km 선택 / 뒤로 가기로 닫으면 선택 취소
//
// [입력 / 조작을 바꿔 다시 확인]
// 돌려주는 값을 3으로 바꾸면 3km 선택이에요.
//
// [내 말로 설명]
// 함수의 return과 화면의 pop(result)은 어떤 점이 비슷한가요?

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
  String message = '선택 전';

  Future<void> choose() async {
    final result = await Navigator.of(context).push<int>(
      MaterialPageRoute<int>(builder: (context) => const ExamplePicker()),
    );
    if (!mounted) return;
    setState(() {
      message = result == null ? '선택 취소' : '${result}km 선택';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('달리기 연습')),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(message),
            ElevatedButton(onPressed: choose, child: const Text('거리 선택')),
          ],
        ),
      ),
    );
  }
}

class ExamplePicker extends StatelessWidget {
  const ExamplePicker({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('달리기 연습')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.of(context).pop(2);
          },
          child: const Text('2km 선택'),
        ),
      ),
    );
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
