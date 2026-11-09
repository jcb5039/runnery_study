// 7주차 3일 — Column으로 세로 배치
// 실행 위치: ~/src/runnery-study/practice_app
// 실행: flutter run -d chrome -t lib/week07/day03.dart
// 정답은 answers/day03.dart에 있어요.
// 오늘의 강의: week07/README.md의 "2. 위젯 안에 위젯 넣기: child와 children — 3~5일" 섹션이에요. 그 섹션만 읽고 풀 수 있어요.
// 처음에는 stage = 0으로 예제를 봐요. 1단계를 풀면 stage = 1로 바꾸고 저장한 뒤 터미널에서 R(대문자)을 눌러요.
// 2단계, 3단계도 stage 숫자만 바꿔 확인해요. 단계마다 [문제] 바로 아래에 그 단계의 화면 클래스가 있어요.
// 다른 날짜를 열 때는 q로 종료하고 그 날짜의 -t 경로로 실행하세요.
//
// [예제 화면 / 관찰할 결과]
// 위에서부터 수진 → 2km
//
// [한 줄씩 읽기]
// 1. Column은 children 목록을 위에서 아래로 배치해요.
// 2. 각 Text가 목록의 한 항목이에요.
// 3. mainAxisSize.min은 필요한 높이만 사용하게 해요.

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
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [const Text('수진'), const Text('2km')],
        ),
      ),
    );
  }
}

// ━━━━━━━━━━ 1단계: 예제 따라 하기 ━━━━━━━━━━
// [문제] Step1Page의 body에 Center → Column(mainAxisSize: MainAxisSize.min)을 놓고 '아침', '점심'을 위에서 아래로 표시하세요.
// [예상 화면]
// 위에서부터 아침 → 점심

class Step1Page extends StatelessWidget {
  const Step1Page({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO ①: 아래 body를 Center 안의 Column으로 바꾸세요.
    return Scaffold(
      appBar: AppBar(title: const Text('1단계')),
      body: const Center(child: Text('TODO: 1단계 화면을 만드세요.')),
    );
  }
}

// ━━━━━━━━━━ 2단계: 직접 작성 ━━━━━━━━━━
// [문제] Step2Page의 body에 Column을 놓고 '민수', '3km', '20분'을 위에서 아래로 표시하세요.
//        Column은 Center 안에 두고 mainAxisSize를 min으로 지정하세요.
// [예상 화면]
// 위에서부터 민수 → 3km → 20분
// [조작을 바꿔 다시 확인] children에서 거리와 시간의 위치를 바꾸면 표시 순서도 바뀌어요.

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

// ━━━━━━━━━━ 3단계: Runnery 코드 읽기 — 숫자와 단위를 세로로 ━━━━━━━━━━
// Runnery 달리기 화면은 큰 숫자 아래에 작은 단위 글자를 놓아요. 그 모양을 줄인 위젯이에요.
//
// 읽는 법: Column의 children 순서대로 위에서 아래로 그려요.
//   TextStyle(fontSize: 32)는 글자 크기를 32로 키우는 꾸밈이에요. 값과 상관없이 모양만 바꿔요.
// [문제]
// (1) 실행 전에 StatColumn이 위에서 아래로 무엇을 보여줄지 [내 예측]에 적으세요.
// (2) Step3Page의 body를 Center(child: StatColumn())으로 바꾸세요.
// (3) 실행해 비교하세요. '킬로미터'를 숫자 위로 올리려면 무엇을 바꾸나요?
// [내 예측]
//
// [예상 화면]
// 위: 큰 글자 5.24 / 아래: 킬로미터

// [주어진 코드 — 수정하지 말고 읽기만 하세요]
class StatColumn extends StatelessWidget {
  const StatColumn({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text('5.24', style: TextStyle(fontSize: 32)),
        Text('킬로미터'),
      ],
    );
  }
}

class Step3Page extends StatelessWidget {
  const Step3Page({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO ①: 아래 body를 Center(child: StatColumn())으로 바꾸세요.
    return Scaffold(
      appBar: AppBar(title: const Text('3단계')),
      body: const Center(child: Text('TODO: 3단계 화면을 만드세요.')),
    );
  }
}

// [내 말로 설명]
// 글자를 그리는 위젯과 세로 배치를 하는 위젯은 각각 무엇인가요?
