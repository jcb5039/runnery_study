// 8주차 2일 — StatefulWidget과 setState
// 실행 위치: ~/src/runnery-study/practice_app
// 실행: flutter run -d chrome -t lib/week08/day02.dart
// 정답은 answers/day02.dart에 있어요.
// 오늘의 강의: week08/README.md의 "2. StatefulWidget, State, setState — 2~3일" 섹션이에요. 그 섹션만 읽고 풀 수 있어요.
// 처음에는 stage = 0으로 예제를 봐요. 1단계를 풀면 stage = 1로 바꾸고 저장한 뒤 터미널에서 R(대문자)을 눌러요.
// 2단계, 3단계도 stage 숫자만 바꿔 확인해요. 단계마다 [문제] 바로 아래에 그 단계의 화면 클래스가 있어요.
// 다른 날짜를 열 때는 q로 종료하고 그 날짜의 -t 경로로 실행하세요.
//
// [예제 화면 / 관찰할 결과]
// 0 → +1 버튼을 누르면 1
//
// [한 줄씩 읽기]
// 1. StatefulWidget은 State를 만들어요. 변하는 값은 State에 둬요.
// 2. 버튼이 increase를 호출해요.
// 3. setState 안에서 count가 바뀌어요.
// 4. Flutter가 다시 build할 때 새 count를 Text에 넣어요.

import 'package:flutter/material.dart';

int stage = 0; // 0 예제, 1·2·3 단계. 숫자를 바꾸고 저장한 뒤 R을 눌러요.

void main() {
  const pages = <Widget>[ExamplePage(), Step1Page(), Step2Page(), Step3Page()];
  runApp(MaterialApp(home: pages[stage]));
}

// [짧은 실행 예제]
class ExamplePage extends StatefulWidget {
  const ExamplePage({super.key});
  @override
  State<ExamplePage> createState() => _ExamplePageState();
}

class _ExamplePageState extends State<ExamplePage> {
  int count = 0;

  void increase() {
    setState(() {
      count++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('달리기 연습')),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('$count'),
            ElevatedButton(onPressed: increase, child: const Text('+1')),
          ],
        ),
      ),
    );
  }
}

// ━━━━━━━━━━ 1단계: 예제 따라 하기 ━━━━━━━━━━
// [문제] _Step1PageState에 int cups = 0을 선언하세요.
//        void drink()에서 setState로 cups를 1 늘리세요. body에는 '$cups잔' Text와 '한 잔' 버튼을 Column으로 놓아요.
// [예상 화면]
// 처음 0잔 → 한 잔 누를 때마다 1잔, 2잔

class Step1Page extends StatefulWidget {
  const Step1Page({super.key});

  @override
  State<Step1Page> createState() => _Step1PageState();
}

class _Step1PageState extends State<Step1Page> {
  // TODO ①: cups 필드와 drink()를 만들고, body를 Text와 버튼이 든 Column으로 바꾸세요.

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('1단계')),
      body: const Center(child: Text('TODO: 1단계 화면을 만드세요.')),
    );
  }
}

// ━━━━━━━━━━ 2단계: 직접 작성 ━━━━━━━━━━
// [문제] _Step2PageState에 int km = 0을 선언하세요.
//        void increase()에서 setState로 km를 1 늘리세요.
//        build에는 '${km}km' 형태의 Text와 '1km 추가' 버튼을 놓으세요.
// [예상 화면]
// 처음 0km → 한 번 누르면 1km → 두 번 누르면 2km
// [조작을 바꿔 다시 확인] setState를 빼고 값만 바꾸면 화면 갱신이 예약되지 않는다는 점을 비교한 뒤 되돌리세요.

class Step2Page extends StatefulWidget {
  const Step2Page({super.key});
  @override
  State<Step2Page> createState() => _Step2PageState();
}

class _Step2PageState extends State<Step2Page> {
  // TODO: 문제의 상태 변수 선언 위치

  // TODO: 버튼 동작과 필요한 생명주기 메서드 정의 위치

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

// ━━━━━━━━━━ 3단계: Runnery 코드 읽기 — 같은 탭이면 그냥 끝내기 ━━━━━━━━━━
// MainTabs의 _go예요(home/main_tabs.dart).
//
//   void _go(int index) {
//     if (index == _index) return;
//     setState(() {
//       _index = index;
//     });
//   }
//
// 읽는 법: 이미 보고 있는 탭을 또 누르면 return으로 바로 끝내서 setState를 하지 않아요(다시 그리지 않음).
// 바로 아래 [주어진 코드] TabsLite는 이 _go를 그대로 쓰고, build할 때마다 '탭 화면 build' 로그를 남겨요.
// [문제]
// (1) Step3Page의 build에서 Scaffold 대신 return const TabsLite(); 한 줄만 남기세요.
// (2) 실행 전에 '기록'을 두 번 누르면 화면 글자와 'build' 로그가 몇 번 찍힐지 [내 예측]에 적으세요(처음 그릴 때 1번 포함).
// (3) 실행해 비교하세요. 두 번째 누름에서는 왜 로그가 늘지 않나요?
// [내 예측]
//
// [예상 화면]
// 처음 현재 탭: 0 → 기록 누르면 현재 탭: 1 → 한 번 더 눌러도 그대로 / build 로그는 모두 2번

// [주어진 코드 — 수정하지 말고 읽기만 하세요]
class TabsLite extends StatefulWidget {
  const TabsLite({super.key});

  @override
  State<TabsLite> createState() => _TabsLiteState();
}

class _TabsLiteState extends State<TabsLite> {
  int _index = 0;

  void _go(int index) {
    if (index == _index) return;
    setState(() {
      _index = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    debugPrint('탭 화면 build');
    return Scaffold(
      appBar: AppBar(title: const Text('3단계')),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('현재 탭: $_index'),
            ElevatedButton(onPressed: () => _go(0), child: const Text('홈')),
            ElevatedButton(onPressed: () => _go(1), child: const Text('기록')),
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
    // TODO ①: 아래 Scaffold 대신 const TabsLite()를 반환하세요.
    return Scaffold(
      appBar: AppBar(title: const Text('3단계')),
      body: const Center(child: Text('TODO: 3단계 화면을 만드세요.')),
    );
  }
}

// [내 말로 설명]
// 버튼 클릭 → 값 변경 → build → Text의 순서를 설명하세요.
