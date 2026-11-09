// 8주차 3일 — 초기화 버튼과 상태의 위치
// 실행 위치: ~/src/runnery-study/practice_app
// 실행: flutter run -d chrome -t lib/week08/day03.dart
// 정답은 answers/day03.dart에 있어요.
// 오늘의 강의: week08/README.md의 "2. StatefulWidget, State, setState — 2~3일" 섹션이에요. 그 섹션만 읽고 풀 수 있어요.
// 처음에는 stage = 0으로 예제를 봐요. 1단계를 풀면 stage = 1로 바꾸고 저장한 뒤 터미널에서 R(대문자)을 눌러요.
// 2단계, 3단계도 stage 숫자만 바꿔 확인해요. 단계마다 [문제] 바로 아래에 그 단계의 화면 클래스가 있어요.
// 다른 날짜를 열 때는 q로 종료하고 그 날짜의 -t 경로로 실행하세요.
//
// [예제 화면 / 관찰할 결과]
// 증가와 초기화가 같은 count를 변경해요.
//
// [한 줄씩 읽기]
// 1. 같은 count를 두 콜백이 바꿔요.
// 2. count는 build 밖의 State 필드라 다시 build해도 유지돼요.
// 3. build 안에서 0으로 선언하면 다시 만들 때 값이 초기화될 수 있어요.

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
  int count = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('달리기 연습')),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('$count'),
            ElevatedButton(
              onPressed: () => setState(() {
                count++;
              }),
              child: const Text('+1'),
            ),
            TextButton(
              onPressed: () => setState(() {
                count = 0;
              }),
              child: const Text('초기화'),
            ),
          ],
        ),
      ),
    );
  }
}

// ━━━━━━━━━━ 1단계: 예제 따라 하기 ━━━━━━━━━━
// [문제] _Step1PageState에 int score = 0을 선언하세요. addTen()은 10을 더하고, restart()는 0을 넣어요. 둘 다 setState 안에서 바꿔요.
//        body에는 '$score점' Text, '+10' 버튼, '처음으로' 버튼을 Column으로 놓아요.
// [예상 화면]
// +10 두 번: 20점 / 처음으로: 0점

class Step1Page extends StatefulWidget {
  const Step1Page({super.key});

  @override
  State<Step1Page> createState() => _Step1PageState();
}

class _Step1PageState extends State<Step1Page> {
  // TODO ①: score 필드, addTen(), restart()를 만들고 body를 Column으로 바꾸세요.

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('1단계')),
      body: const Center(child: Text('TODO: 1단계 화면을 만드세요.')),
    );
  }
}

// ━━━━━━━━━━ 2단계: 직접 작성 ━━━━━━━━━━
// [문제] _Step2PageState에 km = 0을 선언하세요. increase()와 reset()을 build 바깥에 정의하세요.
//        각각 setState로 1 증가와 0 대입을 하세요. 거리 Text와 '추가', '초기화' 버튼을 연결하세요.
// [예상 화면]
// 추가 두 번: 2km / 초기화 한 번: 0km
// [조작을 바꿔 다시 확인] 0km에서 초기화를 눌러도 0km예요.

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

// ━━━━━━━━━━ 3단계: Runnery 코드 읽기 — 상태에 따라 버튼 동작 고르기 ━━━━━━━━━━
// Runnery 홈 화면에는 이런 버튼 연결이 있어요(home/home_page.dart).
//
//   onTap: _error != null ? _reload : () => _open('기록'),
//
// 읽는 법: 오류가 있으면(null이 아니면) 누를 때 _reload(다시 불러오기)를, 없으면 기록 화면 열기를 맡겨요.
//   조건 ? A : B는 10주차에 자세히 배워요. 지금은 "조건이 참이면 A, 아니면 B"로 읽어요.
// 바로 아래 [주어진 코드] RetryLite는 처음에 오류가 있는 상태로 시작해요.
// [문제]
// (1) Step3Page의 build에서 Scaffold 대신 return const RetryLite(); 한 줄만 남기세요.
// (2) 실행 전에 버튼을 두 번 누르면 화면이 어떻게 바뀔지 [내 예측]에 적고 비교하세요.
// (3) 같은 버튼인데 첫 번째와 두 번째에 다른 함수가 불린 이유는 무엇인가요?
// [내 예측]
//
// [예상 화면]
// 처음: 불러오기 실패 + 다시 시도 버튼 → 누르면: 정상 + 기록 보기 버튼 → 누르면: 기록 화면으로 이동

// [주어진 코드 — 수정하지 말고 읽기만 하세요]
class RetryLite extends StatefulWidget {
  const RetryLite({super.key});

  @override
  State<RetryLite> createState() => _RetryLiteState();
}

class _RetryLiteState extends State<RetryLite> {
  String? error = '불러오기 실패';
  String message = '';

  void reload() {
    setState(() {
      error = null;
    });
  }

  void open() {
    setState(() {
      message = '기록 화면으로 이동';
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
            Text(error ?? '정상'),
            ElevatedButton(
              onPressed: error != null ? reload : open,
              child: Text(error != null ? '다시 시도' : '기록 보기'),
            ),
            Text(message),
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
    // TODO ①: 아래 Scaffold 대신 const RetryLite()를 반환하세요.
    return Scaffold(
      appBar: AppBar(title: const Text('3단계')),
      body: const Center(child: Text('TODO: 3단계 화면을 만드세요.')),
    );
  }
}

// [내 말로 설명]
// 상태 변수를 build 바깥에 선언하는 이유는 무엇인가요?
