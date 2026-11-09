// 8주차 1일 — 콜백은 버튼을 누를 때 실행
// 실행 위치: ~/src/runnery-study/practice_app
// 실행: flutter run -d chrome -t lib/week08/day01.dart
// 정답은 answers/day01.dart에 있어요.
// 오늘의 강의: week08/README.md의 "1. 콜백: 나중에 불러 달라고 함수를 맡기기 — 1일" 섹션이에요. 그 섹션만 읽고 풀 수 있어요.
// 처음에는 stage = 0으로 예제를 봐요. 1단계를 풀면 stage = 1로 바꾸고 저장한 뒤 터미널에서 R(대문자)을 눌러요.
// 2단계, 3단계도 stage 숫자만 바꿔 확인해요. 단계마다 [문제] 바로 아래에 그 단계의 화면 클래스가 있어요.
// 다른 날짜를 열 때는 q로 종료하고 그 날짜의 -t 경로로 실행하세요.
//
// [예제 화면 / 관찰할 결과]
// 예제 인사를 누르면 터미널에 안녕하세요
//
// [한 줄씩 읽기]
// 1. sayHello 메서드를 build 바깥에 정의해요.
// 2. onPressed: sayHello는 함수를 전달해요.
// 3. 버튼을 누를 때 Flutter가 호출해요. sayHello()는 그 자리에서 즉시 호출하는 표현이에요.
// 4. debugPrint 결과는 실행한 터미널에서 확인해요.

import 'package:flutter/material.dart';

int stage = 0; // 0 예제, 1·2·3 단계. 숫자를 바꾸고 저장한 뒤 R을 눌러요.

void main() {
  const pages = <Widget>[ExamplePage(), Step1Page(), Step2Page(), Step3Page()];
  runApp(MaterialApp(home: pages[stage]));
}

// [짧은 실행 예제]
class ExamplePage extends StatelessWidget {
  const ExamplePage({super.key});
  void sayHello() {
    debugPrint('안녕하세요');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('달리기 연습')),
      body: Center(
        child: ElevatedButton(onPressed: sayHello, child: const Text('예제 인사')),
      ),
    );
  }
}

// ━━━━━━━━━━ 1단계: 예제 따라 하기 ━━━━━━━━━━
// [문제] Step1Page 안, build 바깥에 void sayHi()를 정의하고 debugPrint('안녕')을 하세요.
//        body에는 Center로 감싼 ElevatedButton을 놓고, 글자는 '인사', onPressed에는 sayHi를 넘기세요.
// [예상 화면]
// 인사 버튼 / 누를 때마다 터미널에 안녕 한 줄

class Step1Page extends StatelessWidget {
  const Step1Page({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO ①: build 위에 sayHi()를 정의하고, body를 인사 버튼으로 바꾸세요.
    return Scaffold(
      appBar: AppBar(title: const Text('1단계')),
      body: const Center(child: Text('TODO: 1단계 화면을 만드세요.')),
    );
  }
}

// ━━━━━━━━━━ 2단계: 직접 작성 ━━━━━━━━━━
// [문제] Step2Page 안 build 바깥에 void startRun()을 정의하고 '달리기 시작'을 debugPrint하세요.
//        버튼 이름은 '시작', onPressed에는 startRun을 전달하세요.
// [예상 화면]
// 처음에는 로그 없음. 시작을 누를 때마다 터미널에 달리기 시작 한 줄.
// [조작을 바꿔 다시 확인] 두 번 누르면 로그도 두 번이에요.

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

// ━━━━━━━━━━ 3단계: Runnery 코드 읽기 — 번호를 들고 부르는 콜백 ━━━━━━━━━━
// Runnery의 MainTabs(home/main_tabs.dart)는 화면마다 "다른 탭으로 가 줘"라는 콜백을 넘겨요.
//
//   onRecords: () => _go(1),
//   onProfile: () => _go(3),
//
// 읽는 법: () => _go(1)은 "눌리면 _go에 1을 넣어 불러 줘"라는 이름 없는 함수예요. 지금 바로 _go를 부르지 않아요.
// 바로 아래 [주어진 코드]의 TabButtons는 숫자 하나를 받는 함수 onTap을 받아서, 버튼마다 다른 번호로 불러요.
// [문제]
// (1) Step3Page 안, build 바깥에 void go(int index)를 정의하고 debugPrint('탭 $index')를 하세요.
// (2) body를 Center(child: TabButtons(onTap: go))로 바꾸세요.
// (3) 실행 전에 '기록', '프로필'을 차례로 누르면 터미널에 무엇이 찍힐지 [내 예측]에 적고 비교하세요.
// (4) onTap: go와 onTap: go(1)은 무엇이 다른가요?
// [내 예측]
//
// [예상 화면]
// 기록·프로필 버튼 / 기록 누르면 탭 1, 프로필 누르면 탭 3 로그

// [주어진 코드 — 수정하지 말고 읽기만 하세요]
class TabButtons extends StatelessWidget {
  const TabButtons({super.key, required this.onTap});

  final void Function(int) onTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        ElevatedButton(onPressed: () => onTap(1), child: const Text('기록')),
        const SizedBox(width: 16),
        ElevatedButton(onPressed: () => onTap(3), child: const Text('프로필')),
      ],
    );
  }
}

class Step3Page extends StatelessWidget {
  const Step3Page({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO ①: build 위에 go(int index)를 정의하고, body에서 TabButtons(onTap: go)를 쓰세요.
    return Scaffold(
      appBar: AppBar(title: const Text('3단계')),
      body: const Center(child: Text('TODO: 3단계 화면을 만드세요.')),
    );
  }
}

// [내 말로 설명]
// onPressed에 함수 이름만 전달하는 이유는 무엇인가요?
