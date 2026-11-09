// 7주차 6일 — 작은 위젯으로 분리하고 값 전달하기
// 실행 위치: ~/src/runnery-study/practice_app
// 실행: flutter run -d chrome -t lib/week07/day06.dart
// 정답은 answers/day06.dart에 있어요.
// 오늘의 강의: week07/README.md의 "3. 내 위젯을 만들고 값 넘기기 — 6~7일" 섹션이에요. 그 섹션만 읽고 풀 수 있어요.
// 처음에는 stage = 0으로 예제를 봐요. 1단계를 풀면 stage = 1로 바꾸고 저장한 뒤 터미널에서 R(대문자)을 눌러요.
// 2단계, 3단계도 stage 숫자만 바꿔 확인해요. 단계마다 [문제] 바로 아래에 그 단계의 화면 클래스가 있어요.
// 다른 날짜를 열 때는 q로 종료하고 그 날짜의 -t 경로로 실행하세요.
//
// [예제 화면 / 관찰할 결과]
// 수진: 2km 카드 한 개
//
// [한 줄씩 읽기]
// 1. ExamplePage가 ExampleCard의 생성자를 호출해요.
// 2. 이름 있는 입력이 카드의 final 필드에 들어가요.
// 3. 카드의 build가 자기 필드를 읽어요. 같은 클래스로 다른 값을 보여줄 수 있어요.

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
      body: Center(child: const ExampleCard(name: '수진', km: 2)),
    );
  }
}

class ExampleCard extends StatelessWidget {
  final String name;
  final int km;
  const ExampleCard({super.key, required this.name, required this.km});
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Text('$name: ${km}km'),
      ),
    );
  }
}

// ━━━━━━━━━━ 1단계: 예제 따라 하기 ━━━━━━━━━━
// [문제] 파일 아래 TODO ② 자리에 HelloLabel extends StatelessWidget을 정의하세요. 입력 없이 Text('나의 기록')을 돌려줘요.
//        Step1Page의 body를 Center(child: HelloLabel())로 바꾸세요.
// [예상 화면]
// 화면 가운데: 나의 기록

class Step1Page extends StatelessWidget {
  const Step1Page({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO ①: 아래 body에서 HelloLabel()을 부르세요.
    return Scaffold(
      appBar: AppBar(title: const Text('1단계')),
      body: const Center(child: Text('TODO: 1단계 화면을 만드세요.')),
    );
  }
}

// TODO ②: 여기에 HelloLabel 클래스를 정의하세요.

// ━━━━━━━━━━ 2단계: 직접 작성 ━━━━━━━━━━
// [문제] 파일 아래에 RunCard extends StatelessWidget을 정의하세요. name(String), km(int)를 required 생성자로 받으세요.
//        RunCard의 build는 Card 안에 '이름: 거리km'를 표시하세요.
//        Step2Page의 Column에서 RunCard(name: '민수', km: 3), RunCard(name: '지우', km: 5)를 호출하세요.
// [예상 화면]
// 민수: 3km / 지우: 5km 카드 두 개
// [조작을 바꿔 다시 확인] 두 번째 카드만 7km로 바꾸면 첫 번째는 그대로예요.

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

// ━━━━━━━━━━ 3단계: Runnery 코드 읽기 — 값을 받아 그리는 작은 위젯 ━━━━━━━━━━
// Runnery 기록 화면에는 숫자와 이름표를 받아 그리는 작은 위젯이 여러 번 쓰여요. 그 모양을 줄인 StatTile이에요.
//
// 읽는 법: 생성자에서 value와 label을 required로 받아 필드에 담고, build에서 그 필드를 읽어요.
//   같은 StatTile을 다른 값으로 두 번 부르면 두 개가 따로 그려져요.
// [문제]
// (1) Step3Page의 body에 Center → Column(mainAxisSize: MainAxisSize.min)을 놓고,
//     StatTile(value: '5.24', label: '거리')와 StatTile(value: '32:15', label: '시간')을 차례로 넣으세요.
// (2) 실행 전에 화면 모양을 [내 예측]에 적고, 실행해 비교하세요.
// (3) StatTile 안의 value는 누가 정하나요? StatTile 쪽인가요, 부르는 쪽인가요?
// [내 예측]
//
// [예상 화면]
// 위에서부터 5.24 / 거리 / 32:15 / 시간

// [주어진 코드 — 수정하지 말고 읽기만 하세요]
class StatTile extends StatelessWidget {
  const StatTile({super.key, required this.value, required this.label});

  final String value;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [Text(value, style: const TextStyle(fontSize: 28)), Text(label)],
    );
  }
}

class Step3Page extends StatelessWidget {
  const Step3Page({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO ①: 아래 body를 StatTile 두 개가 든 Column으로 바꾸세요.
    return Scaffold(
      appBar: AppBar(title: const Text('3단계')),
      body: const Center(child: Text('TODO: 3단계 화면을 만드세요.')),
    );
  }
}

// [내 말로 설명]
// 카드의 입력값을 선언한 곳과 실제 값을 전달한 곳을 각각 가리켜 보세요.
