// 7주차 7일 — 복습: 정적인 기록 카드
// 실행 위치: ~/src/runnery-study/practice_app
// 실행: flutter run -d chrome -t lib/week07/day07.dart
// 정답은 answers/day07.dart에 있어요.
// 오늘의 강의: week07/README.md의 "3. 내 위젯을 만들고 값 넘기기 — 6~7일(복습은 1~3번 섹션 전체)" 섹션이에요. 그 섹션만 읽고 풀 수 있어요.
// 처음에는 stage = 0으로 예제를 봐요. 1단계를 풀면 stage = 1로 바꾸고 저장한 뒤 터미널에서 R(대문자)을 눌러요.
// 2단계, 3단계도 stage 숫자만 바꿔 확인해요. 단계마다 [문제] 바로 아래에 그 단계의 화면 클래스가 있어요.
// 다른 날짜를 열 때는 q로 종료하고 그 날짜의 -t 경로로 실행하세요.
//
// [예제 화면 / 관찰할 결과]
// 아래 ExamplePage의 입력값과 버튼 동작을 먼저 확인하세요.
//
// [한 줄씩 읽기]
// 1. 이번에는 필요한 위젯을 먼저 종이에 세로·가로로 배치해 보세요.

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
      body: Center(child: const Text('이름·거리·시간 카드를 직접 구성하세요.')),
    );
  }
}

// ━━━━━━━━━━ 1단계: 복습 ━━━━━━━━━━
// [문제] Step1Page의 body에 Center → Row(mainAxisSize: MainAxisSize.min)를 놓고
//        '5km', 폭 16의 SizedBox, '30분'을 차례로 넣으세요.
// [예상 화면]
// 한 줄에 5km와 30분

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
// [문제] Step2Page의 final 필드 name = '민수', km = 5, minutes = 30을 선언하세요.
//        Card 안에 Padding(16), Column을 두세요. 위에는 이름, 아래 Row에는 거리와 시간을 표시하세요.
//        Row는 mainAxisSize.min, 두 값 사이 간격은 16으로 하세요.
// [예상 화면]
// 카드 위에 민수, 아래 한 줄에 5km와 30분
// [조작을 바꿔 다시 확인] 거리만 0으로 바꾸고 어떤 Text가 바뀔지 먼저 예측하세요.

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

// ━━━━━━━━━━ 3단계: Runnery 코드 읽기 — 카드 위젯을 여러 번 쓰기 ━━━━━━━━━━
// Runnery 기록 목록은 같은 카드 위젯에 기록마다 다른 값을 넣어 여러 장을 그려요. 그 모양을 줄인 RunRecordCard예요.
//
// 읽는 법: place, km, minutes를 받아 카드 한 장을 그려요. 위에는 장소, 아래 Row에는 거리와 시간이 있어요.
// [문제]
// (1) Step3Page의 body에 Center → Column(mainAxisSize: MainAxisSize.min)을 놓고 아래 두 카드를 넣으세요.
//       RunRecordCard(place: '한강공원', km: 5, minutes: 30)
//       RunRecordCard(place: '올림픽공원', km: 3, minutes: 20)
// (2) 실행 전에 화면 모양을 [내 예측]에 적고, 실행해 비교하세요.
// (3) 카드를 하나 더 늘리려면 어디에 무엇을 쓰면 되나요?
// [내 예측]
//
// [예상 화면]
// 카드 두 장: 한강공원 / 5km 30분, 올림픽공원 / 3km 20분

// [주어진 코드 — 수정하지 말고 읽기만 하세요]
class RunRecordCard extends StatelessWidget {
  const RunRecordCard({
    super.key,
    required this.place,
    required this.km,
    required this.minutes,
  });

  final String place;
  final int km;
  final int minutes;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(place),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [Text('${km}km'), const SizedBox(width: 16), Text('$minutes분')],
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
    // TODO ①: 아래 body를 RunRecordCard 두 개가 든 Column으로 바꾸세요.
    return Scaffold(
      appBar: AppBar(title: const Text('3단계')),
      body: const Center(child: Text('TODO: 3단계 화면을 만드세요.')),
    );
  }
}

// [내 말로 설명]
// main부터 이 Text까지 이어지는 위젯 트리를 자기 말로 설명하세요.
