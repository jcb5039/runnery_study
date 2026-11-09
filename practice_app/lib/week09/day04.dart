// 9주차 4일 — pop으로 결과 돌려받기
// 실행 위치: ~/src/runnery-study/practice_app
// 실행: flutter run -d chrome -t lib/week09/day04.dart
// 정답은 answers/day04.dart에 있어요.
// 오늘의 강의: week09/README.md의 "3. 닫으면서 값 돌려받기 — 4일" 섹션이에요. 그 섹션만 읽고 풀 수 있어요.
// 처음에는 stage = 0으로 예제를 봐요. 1단계를 풀면 stage = 1로 바꾸고 저장한 뒤 터미널에서 R(대문자)을 눌러요.
// 2단계, 3단계도 stage 숫자만 바꿔 확인해요. 단계마다 [문제] 바로 아래에 그 단계의 화면 클래스가 있어요.
// 다른 날짜를 열 때는 q로 종료하고 그 날짜의 -t 경로로 실행하세요.
//
// [예제 화면 / 관찰할 결과]
// 선택 화면에서 2km를 고르면 원래 화면에 2km 선택
//
// [한 줄씩 읽기]
// 1. push<int>의 결과를 await하면 다음 화면이 닫힐 때까지 기다려요.
// 2. pop(2)는 화면을 닫으며 2를 돌려줘요.
// 3. 시스템 뒤로 가기는 결과가 null일 수 있어요.
// 4. 기다린 뒤 mounted를 확인하고 결과를 상태에 넣어요.

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
  String message = '선택 전';

  Future<void> choose() async {
    final result = await Navigator.of(context).push<int>(
      MaterialPageRoute<int>(builder: (context) => const ExamplePicker()),
    );
    if (!mounted) return;
    setState(() {
      message = result == null ? '선택 취소' : '${result}km 선택';
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
            Text(message),
            ElevatedButton(onPressed: choose, child: const Text('거리 선택')),
          ],
        ),
      ),
    );
  }
}

class ExamplePicker extends StatelessWidget {
  const ExamplePicker({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('달리기 연습')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.of(context).pop(2);
          },
          child: const Text('2km 선택'),
        ),
      ),
    );
  }
}

// ━━━━━━━━━━ 1단계: 예제 따라 하기 ━━━━━━━━━━
// [문제] _Step1PageState에 String weather = '모름'을 두세요. pick()은 await Navigator.of(context).push<String>(...)으로 WeatherPicker를 열어요.
//        결과를 받은 뒤 if (!mounted) return; 그다음 setState로 weather = result ?? '모름'을 넣으세요.
//        body에는 '오늘 날씨: $weather' Text와 '날씨 고르기' 버튼을 Column으로 놓아요.
//        파일 아래 WeatherPicker는 '맑음' 버튼에서 Navigator.pop(context, '맑음')을 불러요.
// [예상 화면]
// 날씨 고르기 → 맑음 누르면 원래 화면에 오늘 날씨: 맑음

class Step1Page extends StatefulWidget {
  const Step1Page({super.key});

  @override
  State<Step1Page> createState() => _Step1PageState();
}

class _Step1PageState extends State<Step1Page> {
  // TODO ①: weather 필드와 pick()을 만들고 body를 Column으로 바꾸세요.

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('1단계')),
      body: const Center(child: Text('TODO: 1단계 화면을 만드세요.')),
    );
  }
}

// TODO ②: 여기에 WeatherPicker 클래스를 정의하세요.

// ━━━━━━━━━━ 2단계: 직접 작성 ━━━━━━━━━━
// [문제] Step2Page의 State에 message = '선택 전'을 선언하세요.
//        choose()에서 DistancePicker를 push<int>로 열고 기다리세요. 결과를 받은 뒤 mounted를 확인하세요.
//        null이면 '선택 취소', 아니면 '5km 선택'처럼 표시하세요.
//        DistancePicker는 '5km 선택' 버튼에서 Navigator.pop(context, 5)를 호출하게 만드세요.
// [예상 화면]
// 거리 선택 → 5km 선택 클릭 → 원래 화면에 5km 선택 / 뒤로 가기로 닫으면 선택 취소
// [조작을 바꿔 다시 확인] 돌려주는 값을 3으로 바꾸면 3km 선택이에요.

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

// ━━━━━━━━━━ 3단계: Runnery 코드 읽기 — 메모를 고치고 돌아오기 ━━━━━━━━━━
// Runnery 기록 상세에서 메모를 고치면, 고친 글자를 돌려받아 화면에 반영해요. 그 흐름을 줄인 코드예요.
//
// 읽는 법: RecordMemoLite가 MemoEditLite를 push<String>으로 열고 기다려요.
//   MemoEditLite는 '저장'을 누르면 고친 글자를 pop으로 돌려줘요. 아무것도 안 돌려주고 닫히면 null이에요.
//   result == null이면(취소) 아무것도 바꾸지 않고 끝내요.
// [문제]
// (1) Step3Page의 build에서 Scaffold 대신 return const RecordMemoLite(); 한 줄만 남기세요.
// (2) 실행 전에 '메모 수정' → '저장'을 누른 뒤 글자를 [내 예측]에 적고 비교하세요.
// (3) 메모 화면에서 위쪽 뒤로 가기로 닫으면 메모는 어떻게 되나요? 어느 줄 때문인가요?
// [내 예측]
//
// [예상 화면]
// 처음: 메모: 없음 → 메모 수정 → 저장 → 메모: 비 옴 / 뒤로 가기로 닫으면 그대로

// [주어진 코드 — 수정하지 말고 읽기만 하세요]
class RecordMemoLite extends StatefulWidget {
  const RecordMemoLite({super.key});

  @override
  State<RecordMemoLite> createState() => _RecordMemoLiteState();
}

class _RecordMemoLiteState extends State<RecordMemoLite> {
  String memo = '없음';

  Future<void> edit() async {
    final result = await Navigator.of(context).push<String>(
      MaterialPageRoute(builder: (_) => const MemoEditLite()),
    );
    if (result == null || !mounted) return;
    setState(() {
      memo = result;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('3단계')),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('메모: $memo'),
            ElevatedButton(onPressed: edit, child: const Text('메모 수정')),
          ],
        ),
      ),
    );
  }
}

class MemoEditLite extends StatelessWidget {
  const MemoEditLite({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('메모 수정')),
      body: Center(
        child: ElevatedButton(
          onPressed: () => Navigator.pop(context, '비 옴'),
          child: const Text('저장'),
        ),
      ),
    );
  }
}

class Step3Page extends StatelessWidget {
  const Step3Page({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO ①: 아래 Scaffold 대신 const RecordMemoLite()를 반환하세요.
    return Scaffold(
      appBar: AppBar(title: const Text('3단계')),
      body: const Center(child: Text('TODO: 3단계 화면을 만드세요.')),
    );
  }
}

// [내 말로 설명]
// 함수의 return과 화면의 pop(result)은 어떤 점이 비슷한가요?
