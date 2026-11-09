// 8주차 6일 — dispose에서 사용한 도구 정리
// 실행 위치: ~/src/runnery-study/practice_app
// 실행: flutter run -d chrome -t lib/week08/day06.dart
// 정답은 answers/day06.dart에 있어요.
// 오늘의 강의: week08/README.md의 "3. 위젯 생명주기: initState → build → dispose — 4일, 6일" 섹션이에요. 그 섹션만 읽고 풀 수 있어요.
// 처음에는 stage = 0으로 예제를 봐요. 1단계를 풀면 stage = 1로 바꾸고 저장한 뒤 터미널에서 R(대문자)을 눌러요.
// 2단계, 3단계도 stage 숫자만 바꿔 확인해요. 단계마다 [문제] 바로 아래에 그 단계의 화면 클래스가 있어요.
// 다른 날짜를 열 때는 q로 종료하고 그 날짜의 -t 경로로 실행하세요.
//
// [예제 화면 / 관찰할 결과]
// 초기 입력 아침, 확인 버튼으로 아래에 표시
//
// [한 줄씩 읽기]
// 1. TextEditingController는 입력창 내용을 관리하는 도구예요.
// 2. initState에서 한 번 만들고 TextField에 전달해요.
// 3. controller.text로 지금 입력한 글자를 읽어요.
// 4. 이 State가 소유한 controller를 dispose에서 정리해요.
// 5. 입력 도구를 build 안에서 매번 새로 만들지 않아요.

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
                builder: (context) => const ExampleEditor(),
              ),
            );
          },
          child: const Text('입력 화면'),
        ),
      ),
    );
  }
}

class ExampleEditor extends StatefulWidget {
  const ExampleEditor({super.key});
  @override
  State<ExampleEditor> createState() => _ExampleEditorState();
}

class _ExampleEditorState extends State<ExampleEditor> {
  late final TextEditingController controller;
  String saved = '';
  @override
  void initState() {
    super.initState();
    controller = TextEditingController(text: '아침');
  }

  @override
  void dispose() {
    controller.dispose();
    debugPrint('입력 도구 정리');
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('달리기 연습')),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: TextField(controller: controller),
            ),
            ElevatedButton(
              onPressed: () => setState(() {
                saved = controller.text;
              }),
              child: const Text('메모 확인'),
            ),
            Text(saved),
          ],
        ),
      ),
    );
  }
}

// ━━━━━━━━━━ 1단계: 예제 따라 하기 ━━━━━━━━━━
// [문제] _Step1PageState에 late final TextEditingController controller를 선언하세요.
//        initState에서 TextEditingController(text: '안녕')으로 만들고, dispose에서 controller.dispose() 뒤 super.dispose()를 부르세요.
//        body는 Padding(24) 안의 TextField(controller: controller)예요.
// [예상 화면]
// 입력 칸에 안녕이 들어 있어요. 화면을 닫으면 controller가 정리돼요.

class Step1Page extends StatefulWidget {
  const Step1Page({super.key});

  @override
  State<Step1Page> createState() => _Step1PageState();
}

class _Step1PageState extends State<Step1Page> {
  // TODO ①: controller 필드, initState, dispose를 만들고 body를 TextField로 바꾸세요.

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('1단계')),
      body: const Center(child: Text('TODO: 1단계 화면을 만드세요.')),
    );
  }
}

// ━━━━━━━━━━ 2단계: 직접 작성 ━━━━━━━━━━
// [문제] Step2Page의 버튼에서 PracticeEditor를 여세요.
//        PracticeEditor의 State는 initState에서 초기 글자 '천천히 달림'인 controller를 만드세요.
//        TextField와 '메모 확인' 버튼, 확인한 메모를 표시할 Text를 넣으세요.
//        dispose에서 controller.dispose()를 호출한 뒤 super.dispose()를 호출하세요.
// [예상 화면]
// 초기 입력: 천천히 달림 / 메모 확인: 아래에도 같은 문구 / 뒤로 가기: 입력 도구 정리 로그
// [조작을 바꿔 다시 확인] 입력창을 비우고 확인하면 아래 표시도 빈 문자열이에요.

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

// ━━━━━━━━━━ 3단계: Runnery 코드 읽기 — 입력 칸 글자를 숫자로 ━━━━━━━━━━
// Runnery 프로필 수정 화면(profile/edit/profile_edit_page.dart)은 나이 입력 칸을 이렇게 읽어요.
//
//   int? get _ageValue => int.tryParse(_age.text.trim());
//
// 읽는 법: _age는 TextEditingController예요. .text로 칸의 글자를 꺼내 trim()으로 양끝 공백을 지우고,
//   int.tryParse로 숫자로 바꿔요. 숫자가 아니면 오류 대신 null을 돌려줘요.
// 바로 아래 [주어진 코드] AgeFieldLite는 칸에 '29 '(뒤에 공백)가 들어 있는 채로 시작해요.
// [문제]
// (1) Step3Page의 build에서 Scaffold 대신 return const AgeFieldLite(); 한 줄만 남기세요.
// (2) 실행 전에 '나이 확인'을 누르면 무엇이 보일지 [내 예측]에 적고 비교하세요.
// (3) 칸의 글자를 '스물'로 바꾸고 다시 누르면 무엇이 보일까요? controller는 어디서 정리되나요?
// [내 예측]
//
// [예상 화면]
// 처음 칸: 29 / 나이 확인 누르면: 나이: 29 / 숫자가 아니면: 숫자를 입력하세요

// [주어진 코드 — 수정하지 말고 읽기만 하세요]
class AgeFieldLite extends StatefulWidget {
  const AgeFieldLite({super.key});

  @override
  State<AgeFieldLite> createState() => _AgeFieldLiteState();
}

class _AgeFieldLiteState extends State<AgeFieldLite> {
  late final TextEditingController _age;
  String message = '';

  @override
  void initState() {
    super.initState();
    _age = TextEditingController(text: '29 ');
  }

  @override
  void dispose() {
    _age.dispose();
    super.dispose();
  }

  int? get _ageValue => int.tryParse(_age.text.trim());

  void check() {
    setState(() {
      final age = _ageValue;
      message = age == null ? '숫자를 입력하세요' : '나이: $age';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('3단계')),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            TextField(controller: _age),
            ElevatedButton(onPressed: check, child: const Text('나이 확인')),
            Text(message),
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
    // TODO ①: 아래 Scaffold 대신 const AgeFieldLite()를 반환하세요.
    return Scaffold(
      appBar: AppBar(title: const Text('3단계')),
      body: const Center(child: Text('TODO: 3단계 화면을 만드세요.')),
    );
  }
}

// [내 말로 설명]
// initState에서 만든 도구를 dispose에서 정리하는 이유를 말해보세요.
