// 9주차 1일 — push로 새 화면 열기
// 실행 위치: ~/src/runnery-study/practice_app
// 실행: flutter run -d chrome -t lib/week09/day01.dart
// 정답은 answers/day01.dart에 있어요.
// 오늘의 강의: week09/README.md의 "1. 화면 쌓기: push와 pop — 1일" 섹션이에요. 그 섹션만 읽고 풀 수 있어요.
// 처음에는 stage = 0으로 예제를 봐요. 1단계를 풀면 stage = 1로 바꾸고 저장한 뒤 터미널에서 R(대문자)을 눌러요.
// 2단계, 3단계도 stage 숫자만 바꿔 확인해요. 단계마다 [문제] 바로 아래에 그 단계의 화면 클래스가 있어요.
// 다른 날짜를 열 때는 q로 종료하고 그 날짜의 -t 경로로 실행하세요.
//
// [예제 화면 / 관찰할 결과]
// 화면 열기 클릭 → 두 번째 화면
//
// [한 줄씩 읽기]
// 1. Navigator는 화면 이동 기록을 관리해요.
// 2. push는 새 경로를 위에 올려요.
// 3. MaterialPageRoute의 builder가 새 화면 위젯을 만들어요.
// 4. AppBar의 뒤로 가기로 이전 화면에 돌아올 수 있어요.

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
                builder: (context) => const ExampleDetail(),
              ),
            );
          },
          child: const Text('화면 열기'),
        ),
      ),
    );
  }
}

class ExampleDetail extends StatelessWidget {
  const ExampleDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('달리기 연습')),
      body: Center(child: const Text('두 번째 화면')),
    );
  }
}

// ━━━━━━━━━━ 1단계: 예제 따라 하기 ━━━━━━━━━━
// [문제] Step1Page의 body에 Center로 감싼 '설정 열기' 버튼을 놓고, 누르면 SettingsOne 화면을 push하세요.
//        파일 아래 TODO ② 자리에 SettingsOne extends StatelessWidget을 정의하고 Scaffold 가운데에 '설정 화면'을 표시하세요.
// [예상 화면]
// 설정 열기 → 설정 화면 / 뒤로 가기 → 원래 버튼 화면

class Step1Page extends StatelessWidget {
  const Step1Page({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO ①: body를 설정 화면을 여는 버튼으로 바꾸세요.
    return Scaffold(
      appBar: AppBar(title: const Text('1단계')),
      body: const Center(child: Text('TODO: 1단계 화면을 만드세요.')),
    );
  }
}

// TODO ②: 여기에 SettingsOne 클래스를 정의하세요.

// ━━━━━━━━━━ 2단계: 직접 작성 ━━━━━━━━━━
// [문제] Step2Page에 '기록 보기' 버튼을 만드세요. 버튼에서 MaterialPageRoute<void>로 RunDetail을 push하세요.
//        파일 아래 RunDetail extends StatelessWidget을 정의하고 Scaffold 안에 '오늘 기록'을 표시하세요.
// [예상 화면]
// 기록 보기 클릭 → 오늘 기록 화면 / 뒤로 가기 → 원래 버튼 화면
// [조작을 바꿔 다시 확인] 새 화면을 두 번 열고 돌아오며 이전 화면이 남아 있는지 확인하세요.

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

// ━━━━━━━━━━ 3단계: Runnery 코드 읽기 — 화면 여는 일을 함수로 묶기 ━━━━━━━━━━
// Runnery 홈 화면은 메뉴 이름(label)에 따라 다른 화면을 열어요(home/home_page.dart). 일부예요.
//
//   } else if (label == '기록') {
//     Navigator.of(context).pushReplacement<void, void>(
//       MaterialPageRoute(builder: (_) => const RecordListPageV2()),
//     );
//
// 읽는 법: 화면 여는 긴 줄을 버튼마다 쓰지 않고, 이름을 받아 여는 함수 하나로 모아요. (_)는 안 쓰는 입력이에요.
// 바로 아래 [주어진 코드] openPage는 제목을 받아 그 제목의 화면을 push해요.
// [문제]
// (1) Step3Page의 body에 Center → Column(mainAxisSize: MainAxisSize.min)을 놓고 '기록', '프로필' 버튼 두 개를 넣으세요.
// (2) 각 버튼의 onPressed에서 openPage(context, '기록'), openPage(context, '프로필')을 부르세요.
// (3) 실행 전에 '프로필'을 누르면 무엇이 보일지 [내 예측]에 적고 비교하세요.
// [내 예측]
//
// [예상 화면]
// 기록·프로필 버튼 / 프로필 누르면 프로필 화면

// [주어진 코드 — 수정하지 말고 읽기만 하세요]
void openPage(BuildContext context, String title) {
  Navigator.of(context).push(
    MaterialPageRoute<void>(builder: (_) => TitlePage(title: title)),
  );
}

class TitlePage extends StatelessWidget {
  const TitlePage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Center(child: Text('$title 화면')),
    );
  }
}

class Step3Page extends StatelessWidget {
  const Step3Page({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO ①: body를 '기록', '프로필' 버튼이 든 Column으로 바꾸세요.
    return Scaffold(
      appBar: AppBar(title: const Text('3단계')),
      body: const Center(child: Text('TODO: 3단계 화면을 만드세요.')),
    );
  }
}

// [내 말로 설명]
// builder 안의 생성자는 어느 시점에 화면을 만들기 위해 호출되나요?
