// 7주차 5일 — Padding과 Card
// 실행 위치: ~/src/runnery-study/practice_app
// 실행: flutter run -d chrome -t lib/week07/day05.dart
// 정답은 answers/day05.dart에 있어요.
// 오늘의 강의: week07/README.md의 "2. 위젯 안에 위젯 넣기: child와 children — 3~5일" 섹션이에요. 그 섹션만 읽고 풀 수 있어요.
// 처음에는 stage = 0으로 예제를 봐요. 1단계를 풀면 stage = 1로 바꾸고 저장한 뒤 터미널에서 R(대문자)을 눌러요.
// 2단계, 3단계도 stage 숫자만 바꿔 확인해요. 단계마다 [문제] 바로 아래에 그 단계의 화면 클래스가 있어요.
// 다른 날짜를 열 때는 q로 종료하고 그 날짜의 -t 경로로 실행하세요.
//
// [예제 화면 / 관찰할 결과]
// 카드 안에 2km 기록이 표시돼요.
//
// [한 줄씩 읽기]
// 1. Card가 기록 영역의 모양을 만들어요.
// 2. Padding이 자식 주변에 여백을 넣어요.
// 3. EdgeInsets.all(12)는 네 방향 모두 12만큼 띄워요.

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
        child: const Card(
          child: Padding(padding: EdgeInsets.all(12), child: Text('2km 기록')),
        ),
      ),
    );
  }
}

// ━━━━━━━━━━ 1단계: 예제 따라 하기 ━━━━━━━━━━
// [문제] Step1Page의 body에 Center → Card → Padding(12) → Text('카드 안') 순서로 감싸세요.
// [예상 화면]
// 여백이 있는 카드 안에 카드 안

class Step1Page extends StatelessWidget {
  const Step1Page({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO ①: 아래 body를 Center 안의 Card로 바꾸세요.
    return Scaffold(
      appBar: AppBar(title: const Text('1단계')),
      body: const Center(child: Text('TODO: 1단계 화면을 만드세요.')),
    );
  }
}

// ━━━━━━━━━━ 2단계: 직접 작성 ━━━━━━━━━━
// [문제] Step2Page에서 Card → Padding(20) → Column 순서로 감싸세요.
//        Column에는 '민수'와 '3km'를 두고 사이에 높이 8의 SizedBox를 넣으세요.
// [예상 화면]
// 여백이 있는 카드 안에 민수와 3km가 세로로 보여요.
// [조작을 바꿔 다시 확인] Padding을 4로 바꾸어 카드 안쪽 공간 변화를 보세요.

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

// ━━━━━━━━━━ 3단계: Runnery 코드 읽기 — 기록 카드 한 장 ━━━━━━━━━━
// Runnery 기록 목록의 카드 한 장을 줄인 위젯이에요. 장소와 거리를 위아래로 보여줘요.
//
// 읽는 법: Card → Padding → Column 순서로 감싸져 있어요. 바깥 위젯일수록 넓은 테두리 역할을 해요.
// [문제]
// (1) 실행 전에 RecordCardLite가 어떤 모양일지 [내 예측]에 적으세요.
// (2) Step3Page의 body를 Center(child: RecordCardLite())로 바꾸세요.
// (3) 실행해 비교하세요. Padding을 지우면 화면이 어떻게 달라질까요?
// [내 예측]
//
// [예상 화면]
// 카드 안에 위: 한강공원 / 아래: 5.24km

// [주어진 코드 — 수정하지 말고 읽기만 하세요]
class RecordCardLite extends StatelessWidget {
  const RecordCardLite({super.key});

  @override
  Widget build(BuildContext context) {
    return const Card(
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [Text('한강공원'), SizedBox(height: 8), Text('5.24km')],
        ),
      ),
    );
  }
}

class Step3Page extends StatelessWidget {
  const Step3Page({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO ①: 아래 body를 Center(child: RecordCardLite())로 바꾸세요.
    return Scaffold(
      appBar: AppBar(title: const Text('3단계')),
      body: const Center(child: Text('TODO: 3단계 화면을 만드세요.')),
    );
  }
}

// [내 말로 설명]
// Padding의 child와 Column의 children은 왜 형태가 다른가요?
