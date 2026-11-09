// 7주차 2일 — StatelessWidget과 build
// 실행 위치: ~/src/runnery-study/practice_app
// 실행: flutter run -d chrome -t lib/week07/day02.dart
// 정답은 answers/day02.dart에 있어요.
// 오늘의 강의: week07/README.md의 "1. 앱의 시작: main → runApp → 첫 화면 — 1~2일" 섹션이에요. 그 섹션만 읽고 풀 수 있어요.
// 처음에는 stage = 0으로 예제를 봐요. 1단계를 풀면 stage = 1로 바꾸고 저장한 뒤 터미널에서 R(대문자)을 눌러요.
// 2단계, 3단계도 stage 숫자만 바꿔 확인해요. 단계마다 [문제] 바로 아래에 그 단계의 화면 클래스가 있어요.
// 다른 날짜를 열 때는 q로 종료하고 그 날짜의 -t 경로로 실행하세요.
//
// [예제 화면 / 관찰할 결과]
// 수진: 2km
//
// [한 줄씩 읽기]
// 1. extends StatelessWidget은 화면을 만드는 기본 동작을 이어받아요.
// 2. @override는 부모가 정한 build를 여기서 구현한다는 표시예요.
// 3. build는 Widget을 반환해요. BuildContext는 위젯 트리에서 이 위치의 정보를 제공해요.
// 4. final 필드를 읽어서 Text에 넣어요. const는 가능한 경우 같은 상수 구성을 재사용하게 해요.

import 'package:flutter/material.dart';

int stage = 0; // 0 예제, 1·2·3 단계. 숫자를 바꾸고 저장한 뒤 R을 눌러요.

void main() {
  const pages = <Widget>[ExamplePage(), Step1Page(), Step2Page(), Step3Page()];
  runApp(MaterialApp(home: pages[stage]));
}

// [짧은 실행 예제]
class ExamplePage extends StatelessWidget {
  const ExamplePage({super.key});
  final String name = '수진';
  final int km = 2;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('달리기 연습')),
      body: Center(child: Text('$name: ${km}km')),
    );
  }
}

// ━━━━━━━━━━ 1단계: 예제 따라 하기 ━━━━━━━━━━
// [문제] Step1Page에 final String city = '서울';을 선언하세요.
//        build에서 city를 읽어 화면 가운데에 '도시: 서울'을 표시하세요.
// [예상 화면]
// 화면 가운데: 도시: 서울

class Step1Page extends StatelessWidget {
  const Step1Page({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO ①: build 위에 city 필드를 선언하고, body의 Text를 '도시: $city'로 바꾸세요.
    return Scaffold(
      appBar: AppBar(title: const Text('1단계')),
      body: const Center(child: Text('TODO: 1단계 화면을 만드세요.')),
    );
  }
}

// ━━━━━━━━━━ 2단계: 직접 작성 ━━━━━━━━━━
// [문제] Step2Page에 final String name = '민수', final int km = 3을 선언하세요.
//        build에서 두 필드를 읽어 '민수: 3km'를 표시하세요. 필드를 다시 대입하는 코드는 쓰지 않아요.
// [예상 화면]
// 민수: 3km
// [조작을 바꿔 다시 확인] name을 지우, km를 5로 바꾸고 R로 다시 시작하면 지우: 5km예요.

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

// ━━━━━━━━━━ 3단계: Runnery 코드 읽기 — 필드를 읽어 인사하기 ━━━━━━━━━━
// Runnery 홈 화면은 사용자 별명을 읽어 인사 문구를 만들어요. 그 모양을 줄인 위젯이 아래에 있어요.
//
// 읽는 법: GreetingText는 필드 nickname을 build에서 읽어 Text를 만들어요.
//   build는 Flutter가 부르는 메서드예요. 우리 코드에서 build()를 직접 부르지 않아요.
// [문제]
// (1) 실행 전에 GreetingText가 화면에 보여줄 글자를 [내 예측]에 적으세요.
// (2) Step3Page의 body를 Center(child: GreetingText())로 바꾸세요. AppBar 제목은 '3단계' 그대로 둬요.
// (3) 실행해 비교하세요. 글자를 바꾸려면 어느 줄을 고쳐야 하나요?
// [내 예측]
//
// [예상 화면]
// 화면 가운데: 러너님, 오늘도 달려볼까요?

// [주어진 코드 — 수정하지 말고 읽기만 하세요]
class GreetingText extends StatelessWidget {
  const GreetingText({super.key});

  final String nickname = '러너';

  @override
  Widget build(BuildContext context) {
    return Text('$nickname님, 오늘도 달려볼까요?');
  }
}

class Step3Page extends StatelessWidget {
  const Step3Page({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO ①: 아래 body를 Center(child: GreetingText())로 바꾸세요.
    return Scaffold(
      appBar: AppBar(title: const Text('3단계')),
      body: const Center(child: Text('TODO: 3단계 화면을 만드세요.')),
    );
  }
}

// [내 말로 설명]
// build의 반환값은 숫자인가요, 화면을 구성하는 Widget인가요?
