// 16주차 2일 — 기능 선택: 메모 변경 흐름
// 실행 위치: ~/src/runnery-study/practice_app
// 실행: flutter run -d chrome -t lib/week16/day02.dart
// 정답은 answers/day02.dart에 있어요.
// 오늘의 강의: week16/README.md의 "2. 입력값 검사: trim과 isEmpty — 2일" 섹션이에요. 그 섹션만 읽고 풀 수 있어요.
// 처음에는 stage = 0으로 예제를 봐요. 1단계를 풀면 stage = 1로 바꾸고 저장한 뒤 터미널에서 R(대문자)을 눌러요.
// 2단계, 3단계도 stage 숫자만 바꿔 확인해요. 단계마다 [문제] 바로 아래에 그 단계의 화면 클래스가 있어요.
// 다른 날짜를 열 때는 q로 종료하고 그 날짜의 -t 경로로 실행하세요.
//
// [예제 화면 / 관찰할 결과]
// 아침 입력을 저장하면 저장: 아침
//
// [한 줄씩 읽기]
// 1. TextField가 입력을 받지만 저장 버튼을 누르기 전에는 저장 문구가 바뀌지 않아요.
// 2. save가 controller.text를 읽어요.
// 3. trim이 양끝 공백을 제거해요.
// 4. setState가 검사 결과를 화면에 표시해요. 지금은 메모리 안에서만 바뀌어요.

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
  late final TextEditingController controller;
  String message = '저장 전';
  @override
  void initState() {
    super.initState();
    controller = TextEditingController(text: '아침');
  }

  void save() {
    final memo = controller.text.trim();
    setState(() {
      message = memo.isEmpty ? '메모를 입력하세요' : '저장: $memo';
    });
  }

  @override
  void dispose() {
    controller.dispose();
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
            ElevatedButton(onPressed: save, child: const Text('저장')),
            Text(message),
          ],
        ),
      ),
    );
  }
}

// ━━━━━━━━━━ 1단계: 예제 따라 하기 ━━━━━━━━━━
// [문제] _Step1PageState에 controller를 TextEditingController(text: '  안녕  ')으로 만들고 dispose에서 정리하세요.
//        String shown = ''을 두고, show()는 setState로 shown = '[${controller.text.trim()}]'을 넣어요.
//        body는 Padding(24) 안의 Column: TextField, '보기' 버튼, Text(shown)이에요.
// [예상 화면]
// 보기 누르면 [안녕] (양끝 공백이 지워짐)

class Step1Page extends StatefulWidget {
  const Step1Page({super.key});

  @override
  State<Step1Page> createState() => _Step1PageState();
}

class _Step1PageState extends State<Step1Page> {
  // TODO ①: controller, dispose, shown, show()를 만들고 body를 바꾸세요.

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('1단계')),
      body: const Center(child: Text('TODO: 1단계 화면을 만드세요.')),
    );
  }
}

// ━━━━━━━━━━ 2단계: 직접 작성 ━━━━━━━━━━
// [문제] Step2Page에 메모 입력창과 저장 버튼을 만드세요. 초기 입력은 '저녁 달리기'예요.
//        save()는 trim한 입력이 비면 '메모를 입력하세요', 아니면 '저장: 입력값'을 표시하세요.
//        controller는 initState에서 만들고 dispose에서 정리하세요.
//        notes.md에 사용자 입력 → save → 상태 변경 → Text 순서를 적으세요.
// [예상 화면]
// 저장 전 → 저장 클릭 → 저장: 저녁 달리기
// [조작을 바꿔 다시 확인] 공백만 입력하면 메모를 입력하세요예요.

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

// ━━━━━━━━━━ 3단계: Runnery 코드 읽기 — 메모만 바꾼 새 기록 만들기 ━━━━━━━━━━
// Runnery는 기록의 메모를 바꿀 때 기존 기록을 고치지 않고, 메모만 다른 새 기록을 만들어요(record/models/running_record.dart).
//
//   RunningRecord.fromJson({...toJson(), 'memo': value});
//
// 읽는 법: ...toJson()은 기존 기록의 Map을 펼쳐 넣는 표시예요. 그 뒤에 쓴 'memo'가 같은 키를 덮어써요.
// 바로 아래 [주어진 코드]의 withMemo가 그 모양이고, MemoCompareLite는 바꾸기 전과 후를 함께 보여줘요.
// [문제]
// (1) Step3Page의 build에서 Scaffold 대신 return const MemoCompareLite(); 한 줄만 남기세요.
// (2) 실행 전에 화면의 세 줄을 [내 예측]에 적고 비교하세요.
// (3) withMemo를 부른 뒤에도 before.memo는 왜 그대로인가요?
// [내 예측]
//
// [예상 화면]
// 이전: (빈 메모) / 이후: 비 옴 / 거리: 5.0km 그대로

// [주어진 코드 — 수정하지 말고 읽기만 하세요]
class MemoRecord {
  const MemoRecord({required this.km, this.memo = ''});

  final double km;
  final String memo;

  Map<String, Object> toJson() => {'km': km, 'memo': memo};

  factory MemoRecord.fromJson(Map<String, Object> json) =>
      MemoRecord(km: json['km'] as double, memo: json['memo'] as String);

  MemoRecord withMemo(String value) => MemoRecord.fromJson({...toJson(), 'memo': value});
}

class MemoCompareLite extends StatelessWidget {
  const MemoCompareLite({super.key});

  @override
  Widget build(BuildContext context) {
    const before = MemoRecord(km: 5.0);
    final after = before.withMemo('비 옴');
    return Scaffold(
      appBar: AppBar(title: const Text('3단계')),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('이전: ${before.memo.isEmpty ? '(빈 메모)' : before.memo}'),
            Text('이후: ${after.memo}'),
            Text('거리: ${after.km}km'),
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
    // TODO ①: 아래 Scaffold 대신 const MemoCompareLite()를 반환하세요.
    return Scaffold(
      appBar: AppBar(title: const Text('3단계')),
      body: const Center(child: Text('TODO: 3단계 화면을 만드세요.')),
    );
  }
}

// [내 말로 설명]
// 화면 입력과 저장된 상태를 구분해서 설명하세요.
