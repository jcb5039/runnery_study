// 7주차 4일 — Row로 가로 배치
// 실행 위치: ~/src/runnery-study/practice_app
// 실행: flutter run -d chrome -t lib/week07/day04.dart
// 정답은 answers/day04.dart에 있어요.
// 오늘의 강의: week07/README.md의 "2. 위젯 안에 위젯 넣기: child와 children — 3~5일" 섹션이에요. 그 섹션만 읽고 풀 수 있어요.
// 처음에는 stage = 0으로 예제를 봐요. 1단계를 풀면 stage = 1로 바꾸고 저장한 뒤 터미널에서 R(대문자)을 눌러요.
// 2단계, 3단계도 stage 숫자만 바꿔 확인해요. 단계마다 [문제] 바로 아래에 그 단계의 화면 클래스가 있어요.
// 다른 날짜를 열 때는 q로 종료하고 그 날짜의 -t 경로로 실행하세요.
//
// [예제 화면 / 관찰할 결과]
// 2km와 12분이 가로로 배치돼요.
//
// [한 줄씩 읽기]
// 1. Row는 children을 가로로 배치해요.
// 2. mainAxisAlignment.center는 가로 방향 가운데로 모아요.
// 3. SizedBox(width: 16)은 두 글자 사이 간격이에요.

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
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Text('2km'), SizedBox(width: 16), Text('12분')],
        ),
      ),
    );
  }
}

// ━━━━━━━━━━ 1단계: 예제 따라 하기 ━━━━━━━━━━
// [문제] Step1Page의 body에 Center → Row(mainAxisSize: MainAxisSize.min)를 놓으세요.
//        '왼쪽', 폭 16의 SizedBox, '오른쪽'을 차례로 넣어요.
// [예상 화면]
// 한 줄에 왼쪽과 오른쪽, 사이 간격 16

class Step1Page extends StatelessWidget {
  const Step1Page({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO ①: 아래 body를 Center 안의 Row로 바꾸세요.
    return Scaffold(
      appBar: AppBar(title: const Text('1단계')),
      body: const Center(child: Text('TODO: 1단계 화면을 만드세요.')),
    );
  }
}

// ━━━━━━━━━━ 2단계: 직접 작성 ━━━━━━━━━━
// [문제] Step2Page에서 Row로 '거리 3km'와 '시간 20분'을 가로로 놓으세요.
//        두 Text 사이에 폭 24의 SizedBox를 넣고 가운데 정렬하세요.
// [예상 화면]
// 한 줄에 거리 3km와 시간 20분, 사이 간격 24
// [조작을 바꿔 다시 확인] 간격을 0으로 바꾸면 글자가 붙어 보여요.

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

// ━━━━━━━━━━ 3단계: Runnery 코드 읽기 — 거리·시간·페이스 한 줄 ━━━━━━━━━━
// Runnery 달리기 화면 아래쪽에는 거리, 시간, 페이스가 한 줄로 나란히 있어요. 그 모양을 줄인 위젯이에요.
//
// 읽는 법: Row의 children이 왼쪽부터 오른쪽으로 놓여요. 페이스 글자에는 ' 와 " 가 들어 있어요.
// [문제]
// (1) 실행 전에 StatRow가 왼쪽부터 무엇을 보여줄지 [내 예측]에 적으세요.
// (2) Step3Page의 body를 Center(child: StatRow())로 바꾸세요.
// (3) 실행해 비교하세요. 간격을 넓히려면 어느 숫자를 바꾸나요?
// [내 예측]
//
// [예상 화면]
// 한 줄에 왼쪽부터 5.24km → 32:15 → 6'09"

// [주어진 코드 — 수정하지 말고 읽기만 하세요]
class StatRow extends StatelessWidget {
  const StatRow({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text('5.24km'),
        SizedBox(width: 24),
        Text('32:15'),
        SizedBox(width: 24),
        Text("6'09\""),
      ],
    );
  }
}

class Step3Page extends StatelessWidget {
  const Step3Page({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO ①: 아래 body를 Center(child: StatRow())로 바꾸세요.
    return Scaffold(
      appBar: AppBar(title: const Text('3단계')),
      body: const Center(child: Text('TODO: 3단계 화면을 만드세요.')),
    );
  }
}

// [내 말로 설명]
// Column과 Row의 주된 배치 방향은 어떻게 다른가요?
