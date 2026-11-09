// 9주차 2일 — 생성자로 상세 화면에 값 전달
// 실행 위치: ~/src/runnery-study/practice_app
// 실행: flutter run -d chrome -t lib/week09/day02.dart
// 정답은 answers/day02.dart에 있어요.
// 오늘의 강의: week09/README.md의 "2. 생성자로 값 넘기기 — 2~3일, 6일" 섹션이에요. 그 섹션만 읽고 풀 수 있어요.
// 처음에는 stage = 0으로 예제를 봐요. 1단계를 풀면 stage = 1로 바꾸고 저장한 뒤 터미널에서 R(대문자)을 눌러요.
// 2단계, 3단계도 stage 숫자만 바꿔 확인해요. 단계마다 [문제] 바로 아래에 그 단계의 화면 클래스가 있어요.
// 다른 날짜를 열 때는 q로 종료하고 그 날짜의 -t 경로로 실행하세요.
//
// [예제 화면 / 관찰할 결과]
// 2km 보기 → 2km
//
// [한 줄씩 읽기]
// 1. 버튼 콜백의 ExampleDetail(km: 2)가 입력값을 전달해요.
// 2. 상세 화면의 required this.km가 필드에 저장해요.
// 3. 상세 화면 build는 자기 필드의 값을 표시해요.

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
                builder: (context) => const ExampleDetail(km: 2),
              ),
            );
          },
          child: const Text('2km 보기'),
        ),
      ),
    );
  }
}

class ExampleDetail extends StatelessWidget {
  final int km;
  const ExampleDetail({super.key, required this.km});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('기록 상세')),
      body: Center(child: Text('${km}km')),
    );
  }
}

// ━━━━━━━━━━ 1단계: 예제 따라 하기 ━━━━━━━━━━
// [문제] Step1Page의 body에 Center로 감싼 '인사하기' 버튼을 놓고, 누르면 GreetingPage(name: '지우')를 push하세요.
//        파일 아래 GreetingPage는 final String name과 required 생성자를 정의하고 '안녕, $name'을 표시하세요.
// [예상 화면]
// 인사하기 → 안녕, 지우

class Step1Page extends StatelessWidget {
  const Step1Page({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO ①: body를 인사하기 버튼으로 바꾸세요.
    return Scaffold(
      appBar: AppBar(title: const Text('1단계')),
      body: const Center(child: Text('TODO: 1단계 화면을 만드세요.')),
    );
  }
}

// TODO ②: 여기에 GreetingPage 클래스를 정의하세요.

// ━━━━━━━━━━ 2단계: 직접 작성 ━━━━━━━━━━
// [문제] Step2Page에 final int km = 5를 선언하고 '상세 보기' 버튼에서 RunDetail(km: km)을 push하세요.
//        RunDetail은 final int km와 required 생성자를 정의하고 거리km를 표시하세요.
// [예상 화면]
// 상세 보기 → 5km
// [조작을 바꿔 다시 확인] Step2Page의 km만 3으로 바꾸면 상세 화면은 3km예요.

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

// ━━━━━━━━━━ 3단계: Runnery 코드 읽기 — 결과 화면에 기록 값 넘기기 ━━━━━━━━━━
// Runnery는 달리기를 마치면 결과 화면에 거리와 시간을 넘겨서 열어요. 그 모양을 줄인 ResultPageLite예요.
//
// 읽는 법: 결과 화면은 km와 seconds를 required로 받아요. build에서 초를 분으로 바꿔(~/ 60) 보여줘요.
// [문제]
// (1) Step3Page의 body에 Center로 감싼 '결과 보기' 버튼을 놓으세요.
// (2) 누르면 ResultPageLite(km: 5.0, seconds: 1800)을 push하세요.
// (3) 실행 전에 결과 화면 글자를 [내 예측]에 적고 비교하세요. 1800은 어디서 30으로 바뀌나요?
// [내 예측]
//
// [예상 화면]
// 결과 보기 → 5.0km / 30분

// [주어진 코드 — 수정하지 말고 읽기만 하세요]
class ResultPageLite extends StatelessWidget {
  const ResultPageLite({super.key, required this.km, required this.seconds});

  final double km;
  final int seconds;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('결과')),
      body: Center(child: Text('${km}km / ${seconds ~/ 60}분')),
    );
  }
}

class Step3Page extends StatelessWidget {
  const Step3Page({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO ①: body를 결과 화면을 여는 버튼으로 바꾸세요.
    return Scaffold(
      appBar: AppBar(title: const Text('3단계')),
      body: const Center(child: Text('TODO: 3단계 화면을 만드세요.')),
    );
  }
}

// [내 말로 설명]
// 상세 화면에 보이는 숫자가 어디에서 선언되고 전달되는지 짚어보세요.
