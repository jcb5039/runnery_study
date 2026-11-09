// 8주차 7일 — 복습: 상태와 생명주기 설명하기
// 실행 위치: ~/src/runnery-study/practice_app
// 실행: flutter run -d chrome -t lib/week08/day07.dart
// 정답은 answers/day07.dart에 있어요.
// 오늘의 강의: week08/README.md의 "1~4번 섹션 전체" 섹션이에요. 그 섹션만 읽고 풀 수 있어요.
// 처음에는 stage = 0으로 예제를 봐요. 1단계를 풀면 stage = 1로 바꾸고 저장한 뒤 터미널에서 R(대문자)을 눌러요.
// 2단계, 3단계도 stage 숫자만 바꿔 확인해요. 단계마다 [문제] 바로 아래에 그 단계의 화면 클래스가 있어요.
// 다른 날짜를 열 때는 q로 종료하고 그 날짜의 -t 경로로 실행하세요.
//
// [예제 화면 / 관찰할 결과]
// 아래 ExamplePage의 입력값과 버튼 동작을 먼저 확인하세요.
//
// [한 줄씩 읽기]
// 1. 오늘은 상태 변수, 버튼 콜백, 생명주기 로그를 함께 작성해요.

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
      body: Center(child: const Text('0km에서 시작하는 기록 화면을 만드세요.')),
    );
  }
}

// ━━━━━━━━━━ 1단계: 복습 ━━━━━━━━━━
// [문제] _Step1PageState에 int likes = 0을 두고, like()에서 setState로 1 늘리세요.
//        body에는 '좋아요 $likes' Text와 '좋아요' 버튼을 Column으로 놓아요.
// [예상 화면]
// 좋아요 0 → 버튼 세 번 누르면 좋아요 3

class Step1Page extends StatefulWidget {
  const Step1Page({super.key});

  @override
  State<Step1Page> createState() => _Step1PageState();
}

class _Step1PageState extends State<Step1Page> {
  // TODO ①: likes 필드와 like()를 만들고 body를 Column으로 바꾸세요.

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('1단계')),
      body: const Center(child: Text('TODO: 1단계 화면을 만드세요.')),
    );
  }
}

// ━━━━━━━━━━ 2단계: 직접 작성 ━━━━━━━━━━
// [문제] _Step2PageState에 km = 0을 두고 '추가'와 '초기화' 버튼을 만드세요.
//        각 버튼은 setState로 1 증가와 0 대입을 하세요.
//        initState에는 '준비', build에는 '그리기', dispose에는 '정리' 로그를 넣으세요.
//        기본 Scaffold와 거리 Text도 직접 구성하세요. 앱을 강제 종료하면 정리 로그가 항상 보장되지는 않아요.
// [예상 화면]
// 시작 0km, 추가 두 번 2km, 초기화 0km. 같은 State에서 준비는 한 번, 그리기는 여러 번 가능.
// [조작을 바꿔 다시 확인] 8주 4일처럼 별도 화면으로 열고 뒤로 가면 정리 로그를 확인할 수 있어요.

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

// ━━━━━━━━━━ 3단계: Runnery 코드 읽기 — 위젯이 받은 값으로 상태 시작하기 ━━━━━━━━━━
// MainTabs는 처음 보여줄 탭 번호를 생성자로 받아, State의 시작값으로 써요(home/main_tabs.dart).
//
//   late int _index = widget.initialIndex;
//
// 읽는 법: State 안에서 widget.이름으로 위젯(StatefulWidget)이 받은 값을 읽어요.
//   late는 "처음 쓸 때 값을 계산한다"는 뜻이라 widget을 읽을 수 있어요. 그 뒤로는 _index만 setState로 바꿔요.
// 바로 아래 [주어진 코드] StartTabLite는 initialIndex를 받아요.
// [문제]
// (1) Step3Page의 build에서 Scaffold 대신 return const StartTabLite(initialIndex: 2); 한 줄만 남기세요.
// (2) 실행 전에 처음 글자와 '홈'을 누른 뒤 글자를 [내 예측]에 적고 비교하세요.
// (3) initialIndex는 누가 정하고, _index는 누가 바꾸나요?
// [내 예측]
//
// [예상 화면]
// 처음: 현재 탭: 2 → 홈 누르면: 현재 탭: 0

// [주어진 코드 — 수정하지 말고 읽기만 하세요]
class StartTabLite extends StatefulWidget {
  const StartTabLite({super.key, required this.initialIndex});

  final int initialIndex;

  @override
  State<StartTabLite> createState() => _StartTabLiteState();
}

class _StartTabLiteState extends State<StartTabLite> {
  late int _index = widget.initialIndex;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('3단계')),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('현재 탭: $_index'),
            ElevatedButton(
              onPressed: () => setState(() => _index = 0),
              child: const Text('홈'),
            ),
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
    // TODO ①: 아래 Scaffold 대신 const StartTabLite(initialIndex: 2)를 반환하세요.
    return Scaffold(
      appBar: AppBar(title: const Text('3단계')),
      body: const Center(child: Text('TODO: 3단계 화면을 만드세요.')),
    );
  }
}

// [내 말로 설명]
// build에서 파일 저장이나 Timer 생성을 매번 하면 왜 문제가 되나요?
