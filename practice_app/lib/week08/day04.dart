// 8주차 4일 — initState → build → dispose 로그
// 실행 위치: ~/src/runnery-study/practice_app
// 실행: flutter run -d chrome -t lib/week08/day04.dart
// 정답은 answers/day04.dart에 있어요.
// 오늘의 강의: week08/README.md의 "3. 위젯 생명주기: initState → build → dispose — 4일, 6일" 섹션이에요. 그 섹션만 읽고 풀 수 있어요.
// 처음에는 stage = 0으로 예제를 봐요. 1단계를 풀면 stage = 1로 바꾸고 저장한 뒤 터미널에서 R(대문자)을 눌러요.
// 2단계, 3단계도 stage 숫자만 바꿔 확인해요. 단계마다 [문제] 바로 아래에 그 단계의 화면 클래스가 있어요.
// 다른 날짜를 열 때는 q로 종료하고 그 날짜의 -t 경로로 실행하세요.
//
// [예제 화면 / 관찰할 결과]
// 생명주기 보기 → 다시 그리기 → 뒤로 가기를 누르며 터미널 로그를 비교해요.
//
// [한 줄씩 읽기]
// 1. 예제의 버튼은 새 화면을 열어요. 이동 문법은 9주에 자세히 배워요.
// 2. State가 만들어지면 initState가 그 State에서 한 번 실행돼요. super.initState()를 먼저 호출해요.
// 3. build는 처음과 갱신 시 여러 번 호출될 수 있어요. 정확한 호출 횟수에 의존하지 마세요.
// 4. 뒤로 가기로 화면의 State가 제거되면 dispose가 실행돼요. 마지막에 super.dispose()를 호출해요.
// 5. 새 화면을 다시 열면 새 State의 initState가 다시 실행돼요.

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
                builder: (context) => const ExampleCounter(),
              ),
            );
          },
          child: const Text('생명주기 보기'),
        ),
      ),
    );
  }
}

class ExampleCounter extends StatefulWidget {
  const ExampleCounter({super.key});
  @override
  State<ExampleCounter> createState() => _ExampleCounterState();
}

class _ExampleCounterState extends State<ExampleCounter> {
  int count = 0;
  @override
  void initState() {
    super.initState();
    debugPrint('예제 initState');
  }

  @override
  void dispose() {
    debugPrint('예제 dispose');
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    debugPrint('예제 build');
    return Scaffold(
      appBar: AppBar(title: const Text('달리기 연습')),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('$count'),
            ElevatedButton(
              onPressed: () => setState(() {
                count++;
              }),
              child: const Text('다시 그리기'),
            ),
          ],
        ),
      ),
    );
  }
}

// ━━━━━━━━━━ 1단계: 예제 따라 하기 ━━━━━━━━━━
// [문제] _Step1PageState에 initState를 만들고 super.initState() 뒤에 debugPrint('1단계 initState')를 넣으세요.
//        build 첫 줄에는 debugPrint('1단계 build')를 넣고, body는 Center(child: Text('로그를 보세요'))로 바꿔요.
// [예상 화면]
// 화면 가운데: 로그를 보세요 / 터미널: 1단계 initState → 1단계 build

class Step1Page extends StatefulWidget {
  const Step1Page({super.key});

  @override
  State<Step1Page> createState() => _Step1PageState();
}

class _Step1PageState extends State<Step1Page> {
  // TODO ①: initState를 만들고, build 첫 줄에 로그를 넣고, body를 바꾸세요.

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('1단계')),
      body: const Center(child: Text('TODO: 1단계 화면을 만드세요.')),
    );
  }
}

// ━━━━━━━━━━ 2단계: 직접 작성 ━━━━━━━━━━
// [문제] Step2Page는 '기록 화면 열기' 버튼을 만들고 새 PracticeCounter 화면을 여세요. 예제의 이동 부분을 참고해도 돼요.
//        PracticeCounter와 그 State를 아래에 정의하고 count = 0, 증가 버튼을 만드세요.
//        initState, build, dispose에 각각 '기록 initState', '기록 build', '기록 dispose' 로그를 넣으세요.
//        initState는 super 호출 뒤, dispose는 super 호출 전에 로그를 넣으세요.
// [예상 화면]
// 열기: initState 다음 build / 증가: build가 다시 실행 / 뒤로 가기: dispose / 재열기: 새 initState와 0
// [조작을 바꿔 다시 확인] build 로그가 여러 번 나와도 initState는 같은 State에서 한 번인지 확인하세요. dispose는 앱 종료 때 항상 보장되는 알림이 아니에요.

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

// ━━━━━━━━━━ 3단계: Runnery 코드 읽기 — 열 때 듣기 시작, 닫을 때 그만 듣기 ━━━━━━━━━━
// Runnery 앱 전체(main.dart의 _MyAppState)는 설정이 바뀌는 소식을 이렇게 듣기 시작하고 그만둬요.
//
//   void initState() {
//     super.initState();
//     ...
//     _settings.addListener(_apply);
//   }
//   void dispose() {
//     _settings.removeListener(_apply);
//     ...
//     super.dispose();
//   }
//
// 읽는 법: 화면이 생길 때(initState) 시작한 일은 화면이 사라질 때(dispose) 정리해요. addListener는 12주차에 배워요.
// 바로 아래 [주어진 코드] SettingsLite는 시작과 정리 때 로그만 남겨요.
// [문제]
// (1) Step3Page의 body를 Center로 감싼 ElevatedButton으로 바꾸세요. 글자는 '설정 화면'이에요.
// (2) onPressed에서 Navigator.of(context).push(MaterialPageRoute<void>(builder: (context) => const SettingsLite()))로 여세요.
//     (예제 ExamplePage의 화면 여는 줄과 같은 모양이에요.)
// (3) 실행 전에 '설정 화면'을 눌러 열고 위쪽 뒤로 가기를 누르면 어떤 로그가 어떤 순서로 찍힐지 [내 예측]에 적고 비교하세요.
// [내 예측]
//
// [예상 화면]
// 설정 화면 버튼 → 열면 로그 설정 듣기 시작 → 뒤로 가면 로그 설정 듣기 끝

// [주어진 코드 — 수정하지 말고 읽기만 하세요]
class SettingsLite extends StatefulWidget {
  const SettingsLite({super.key});

  @override
  State<SettingsLite> createState() => _SettingsLiteState();
}

class _SettingsLiteState extends State<SettingsLite> {
  @override
  void initState() {
    super.initState();
    debugPrint('설정 듣기 시작');
  }

  @override
  void dispose() {
    debugPrint('설정 듣기 끝');
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('설정')),
      body: const Center(child: Text('설정 내용')),
    );
  }
}

class Step3Page extends StatelessWidget {
  const Step3Page({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO ①: body를 설정 화면을 여는 버튼으로 바꾸세요.
    return Scaffold(
      appBar: AppBar(title: const Text('3단계')),
      body: const Center(child: Text('TODO: 3단계 화면을 만드세요.')),
    );
  }
}

// [내 말로 설명]
// 화면을 가리는 것과 위젯을 트리에서 제거하는 것은 왜 다른가요?
