// 7주차 1일 — main → runApp → MaterialApp → Scaffold
// 실행 위치: ~/src/runnery-study/practice_app
// 실행: flutter run -d chrome -t lib/week07/day01.dart
// 정답은 answers/day01.dart에 있어요.
// 오늘의 강의: week07/README.md의 "1. 앱의 시작: main → runApp → 첫 화면 — 1~2일" 섹션이에요. 그 섹션만 읽고 풀 수 있어요.
// 처음에는 stage = 0으로 예제를 봐요. 1단계를 풀면 stage = 1로 바꾸고 저장한 뒤 터미널에서 R(대문자)을 눌러요.
// 2단계, 3단계도 stage 숫자만 바꿔 확인해요. 단계마다 [문제] 바로 아래에 그 단계의 화면 클래스가 있어요.
// 다른 날짜를 열 때는 q로 종료하고 그 날짜의 -t 경로로 실행하세요.
//
// [예제 화면 / 관찰할 결과]
// 제목: 달리기 연습 / 가운데: 첫 Flutter 화면
//
// [한 줄씩 읽기]
// 1. main에서 프로그램이 시작돼요.
// 2. runApp에 루트 위젯을 전달해요.
// 3. MaterialApp은 화면 이동과 테마 등 앱의 틀을 제공해요.
// 4. home에 넣은 ExamplePage의 build가 Scaffold를 반환해요.
// 5. Scaffold는 화면 뼈대, AppBar는 제목 영역, Text는 글자예요.

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
      body: Center(child: const Text('첫 Flutter 화면')),
    );
  }
}

// ━━━━━━━━━━ 1단계: 예제 따라 하기 ━━━━━━━━━━
// [문제] Step1Page의 build에서 Scaffold를 반환하세요. AppBar 제목은 '1단계 연습'이에요.
//        body에는 Center로 감싼 Text('안녕 Flutter')를 넣으세요.
// [예상 화면]
// 위쪽 제목: 1단계 연습 / 화면 가운데: 안녕 Flutter

class Step1Page extends StatelessWidget {
  const Step1Page({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO ①: 아래 Scaffold의 제목과 body를 문제대로 바꾸세요.
    return Scaffold(
      appBar: AppBar(title: const Text('1단계')),
      body: const Center(child: Text('TODO: 1단계 화면을 만드세요.')),
    );
  }
}

// ━━━━━━━━━━ 2단계: 직접 작성 ━━━━━━━━━━
// [문제] Step2Page의 build에서 Scaffold를 반환하세요. AppBar 제목은 '나의 달리기'로 하세요.
//        body에는 Center로 감싼 Text('오늘 3km')를 넣으세요. 새 함수나 상태 변수는 필요 없어요.
// [예상 화면]
// 위쪽 제목: 나의 달리기 / 화면 가운데: 오늘 3km
// [조작을 바꿔 다시 확인] 3km를 5km로 바꾸어 저장한 뒤 r로 갱신해 보세요.

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

// ━━━━━━━━━━ 3단계: Runnery 코드 읽기 — 첫 화면 정하기 ━━━━━━━━━━
// Runnery의 main.dart에서 앱 전체를 감싸는 MaterialApp이에요.
//
//   Widget build(BuildContext context) => MaterialApp(
//     title: '러너리',
//     theme: AppTheme.current,
//     home: const AppStartPage(),
//   );
//
// 읽는 법: home에 넣은 위젯이 앱을 켰을 때 처음 보이는 화면이에요. Runnery는 AppStartPage예요.
// 바로 아래 [주어진 코드]는 AppStartPage를 아주 짧게 흉내 낸 위젯이에요.
// [문제]
// (1) 실행 전에, Step3Page의 build가 const AppStartLite()를 그대로 반환하면 화면에 무엇이 보일지 [내 예측]에 적으세요.
// (2) Step3Page의 build에서 Scaffold 대신 return const AppStartLite(); 한 줄만 남기세요.
// (3) stage = 3으로 실행해 비교하세요. Runnery에서 이 화면 자리에 들어가는 클래스 이름은 무엇인가요?
// [내 예측]
//
// [예상 화면]
// 화면 가운데: 러너리 시작 화면

// [주어진 코드 — 수정하지 말고 읽기만 하세요]
class AppStartLite extends StatelessWidget {
  const AppStartLite({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: Center(child: Text('러너리 시작 화면')));
  }
}

class Step3Page extends StatelessWidget {
  const Step3Page({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO ①: 아래 Scaffold 대신 const AppStartLite()를 반환하세요.
    return Scaffold(
      appBar: AppBar(title: const Text('3단계')),
      body: const Center(child: Text('TODO: 3단계 화면을 만드세요.')),
    );
  }
}

// [내 말로 설명]
// main, runApp, MaterialApp, Scaffold, Text를 순서대로 가리켜 보세요.
