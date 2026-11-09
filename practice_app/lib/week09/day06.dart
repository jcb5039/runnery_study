// 9주차 6일 — 같은 기록 객체를 상세 화면에 전달
// 실행 위치: ~/src/runnery-study/practice_app
// 실행: flutter run -d chrome -t lib/week09/day06.dart
// 정답은 answers/day06.dart에 있어요.
// 오늘의 강의: week09/README.md의 "2. 생성자로 값 넘기기 — 2~3일, 6일" 섹션이에요. 그 섹션만 읽고 풀 수 있어요.
// 처음에는 stage = 0으로 예제를 봐요. 1단계를 풀면 stage = 1로 바꾸고 저장한 뒤 터미널에서 R(대문자)을 눌러요.
// 2단계, 3단계도 stage 숫자만 바꿔 확인해요. 단계마다 [문제] 바로 아래에 그 단계의 화면 클래스가 있어요.
// 다른 날짜를 열 때는 q로 종료하고 그 날짜의 -t 경로로 실행하세요.
//
// [예제 화면 / 관찰할 결과]
// 기록 보기 → 아침: 2km
//
// [한 줄씩 읽기]
// 1. 클래스 객체로 이름과 거리를 묶어요.
// 2. 상세 화면 생성자에 객체를 전달해요.
// 3. record.name과 record.km은 같은 기록의 값이에요.

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
        child: ElevatedButton(
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute<void>(
                builder: (context) =>
                    ExampleDetail(record: const ExampleRun('아침', 2)),
              ),
            );
          },
          child: const Text('기록 보기'),
        ),
      ),
    );
  }
}

class ExampleRun {
  final String name;
  final int km;
  const ExampleRun(this.name, this.km);
}

class ExampleDetail extends StatelessWidget {
  final ExampleRun record;
  const ExampleDetail({super.key, required this.record});
  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: const Text('상세')),
    body: Center(child: Text('${record.name}: ${record.km}km')),
  );
}

// ━━━━━━━━━━ 1단계: 예제 따라 하기 ━━━━━━━━━━
// [문제] 파일 아래에 Shoe 클래스를 정의하세요. final String brand와 const Shoe(this.brand) 생성자예요.
//        ShoeDetail은 Shoe shoe를 required로 받아 '신발: ${shoe.brand}'를 표시해요.
//        Step1Page의 '신발 보기' 버튼에서 ShoeDetail(shoe: Shoe('빠른신발'))을 push하세요.
// [예상 화면]
// 신발 보기 → 신발: 빠른신발

class Step1Page extends StatelessWidget {
  const Step1Page({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO ①: body를 신발 보기 버튼으로 바꾸세요.
    return Scaffold(
      appBar: AppBar(title: const Text('1단계')),
      body: const Center(child: Text('TODO: 1단계 화면을 만드세요.')),
    );
  }
}

// TODO ②: 여기에 Shoe와 ShoeDetail 클래스를 정의하세요.

// ━━━━━━━━━━ 2단계: 직접 작성 ━━━━━━━━━━
// [문제] PracticeRun(String name, int km) 클래스를 final 필드와 const 생성자로 정의하세요.
//        Step2Page에서 PracticeRun('저녁', 5)를 만들어 RunDetail(record: record)에 전달하세요.
//        RunDetail은 PracticeRun record를 필수 입력으로 받고 이름과 거리를 표시하세요.
// [예상 화면]
// 상세 보기 → 저녁: 5km
// [조작을 바꿔 다시 확인] 기록 이름만 아침으로 바꾸면 상세에도 아침: 5km예요.

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

// ━━━━━━━━━━ 3단계: Runnery 코드 읽기 — 기록 객체 하나를 통째로 넘기기 ━━━━━━━━━━
// Runnery 기록 상세 화면은 기록 객체(RunningRecord) 하나를 받아 그 안의 getter로 글자를 만들어요.
// 바로 아래 [주어진 코드]는 거리와 시간만 가진 RecordLite와, 그것을 받는 상세 화면이에요.
//
// 읽는 법: paceLabel은 5주차·10주차에 본 페이스 계산을 글자로 바꾸는 getter예요.
//   상세 화면은 record.distanceKm, record.paceLabel처럼 받은 객체의 값을 읽기만 해요.
// [문제]
// (1) Step3Page의 body에 Center로 감싼 '상세' 버튼을 놓으세요.
// (2) 누르면 RecordDetailLite(record: RecordLite(5.0, 1800))을 push하세요.
// (3) 실행 전에 상세 화면 두 줄을 [내 예측]에 적고 비교하세요. 6'00"은 어디서 계산되나요?
// [내 예측]
//
// [예상 화면]
// 상세 → 5.0km / 6'00"

// [주어진 코드 — 수정하지 말고 읽기만 하세요]
class RecordLite {
  const RecordLite(this.distanceKm, this.movingSeconds);

  final double distanceKm;
  final int movingSeconds;

  String get paceLabel {
    final pace = (movingSeconds / distanceKm).round();
    return "${pace ~/ 60}'${(pace % 60).toString().padLeft(2, '0')}\"";
  }
}

class RecordDetailLite extends StatelessWidget {
  const RecordDetailLite({super.key, required this.record});

  final RecordLite record;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('기록 상세')),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [Text('${record.distanceKm}km'), Text(record.paceLabel)],
        ),
      ),
    );
  }
}

class Step3Page extends StatelessWidget {
  const Step3Page({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO ①: body를 상세 화면을 여는 버튼으로 바꾸세요.
    return Scaffold(
      appBar: AppBar(title: const Text('3단계')),
      body: const Center(child: Text('TODO: 3단계 화면을 만드세요.')),
    );
  }
}

// [내 말로 설명]
// 이름과 거리를 따로 전달하는 것과 객체로 전달하는 것을 비교해 보세요.
