// 16주차 5일 — 정상·빈 값·실패를 같은 화면에서 확인
// 실행 위치: ~/src/runnery-study/practice_app
// 실행: flutter run -d chrome -t lib/week16/day05.dart
// 정답은 answers/day05.dart에 있어요.
// 오늘의 강의: week16/README.md의 "3. 기능 하나를 끝까지 따라가기 — 2~7일" 섹션이에요. 그 섹션만 읽고 풀 수 있어요.
// 처음에는 stage = 0으로 예제를 봐요. 1단계를 풀면 stage = 1로 바꾸고 저장한 뒤 터미널에서 R(대문자)을 눌러요.
// 2단계, 3단계도 stage 숫자만 바꿔 확인해요. 단계마다 [문제] 바로 아래에 그 단계의 화면 클래스가 있어요.
// 다른 날짜를 열 때는 q로 종료하고 그 날짜의 -t 경로로 실행하세요.
//
// [예제 화면 / 관찰할 결과]
// 정상 저장 흐름을 먼저 확인해요.
//
// [한 줄씩 읽기]
// 1. 세 가지 입력 조건을 정해 검증해요.
// 2. 정상 입력은 저장되고, 빈 입력은 요청 전에 막고, 실패는 기존 값을 유지해야 해요.

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
  final store = ExampleStore();
  late final TextEditingController controller;
  bool saving = false;
  final bool succeed = true;
  String message = '저장 전';
  @override
  void initState() {
    super.initState();
    controller = TextEditingController(text: '아침');
  }

  Future<void> save() async {
    final value = controller.text.trim();
    if (value.isEmpty) {
      setState(() {
        message = '메모를 입력하세요';
      });
      return;
    }
    setState(() {
      saving = true;
      message = '저장 중';
    });
    try {
      await store.save(value, succeed: succeed);
      if (!mounted) return;
      setState(() {
        message = '저장 완료';
      });
    } catch (error) {
      if (!mounted) return;
      setState(() {
        message = '저장 실패';
      });
    } finally {
      if (mounted) {
        setState(() {
          saving = false;
        });
      }
    }
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
            ElevatedButton(
              onPressed: saving ? null : save,
              child: const Text('저장'),
            ),
            Text(message),
            Text('보관된 메모: ${store.memo}'),
          ],
        ),
      ),
    );
  }
}

class ExampleStore {
  String memo = '';
  Future<void> save(String value, {required bool succeed}) async {
    await Future<void>.delayed(const Duration(milliseconds: 300));
    if (!succeed) throw StateError('저장 실패');
    memo = value;
  }
}

// ━━━━━━━━━━ 1단계: 예제 따라 하기 ━━━━━━━━━━
// [문제] _Step1PageState에 bool on = false를 두세요.
//        body는 Center → SwitchListTile(title: Text('알림'), value: on, onChanged: (v) => setState(() => on = v))와
//        그 아래 Text(on ? '켜짐' : '꺼짐')을 Column(mainAxisSize: MainAxisSize.min)으로 놓아요.
// [예상 화면]
// 꺼짐 → 알림 줄을 누르면 켜짐

class Step1Page extends StatefulWidget {
  const Step1Page({super.key});

  @override
  State<Step1Page> createState() => _Step1PageState();
}

class _Step1PageState extends State<Step1Page> {
  // TODO ①: on 필드를 만들고 body를 SwitchListTile과 Text가 든 Column으로 바꾸세요.

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('1단계')),
      body: const Center(child: Text('TODO: 1단계 화면을 만드세요.')),
    );
  }
}

// ━━━━━━━━━━ 2단계: 직접 작성 ━━━━━━━━━━
// [문제] MemoStore와 메모 편집 화면을 다시 구성하세요.
//        succeed를 변경 가능한 bool 상태로 두고 SwitchListTile 제목 '저장 성공'으로 연결하세요.
//        저장 중에는 스위치도 비활성화하세요. 초기 메모는 '기존 메모', 입력은 '새 메모'예요.
//        성공·공백 입력·실패를 각각 확인하고 notes.md에 예상과 실제 결과를 적으세요.
// [예상 화면]
// 성공 켬 + 새 메모 → 저장 완료 / 공백만 입력 → 메모를 입력하세요 / 성공 끔 → 저장 실패, 직전 저장값 유지
// [조작을 바꿔 다시 확인] 실패 후 성공으로 바꿔 재시도하면 새 입력이 저장되어야 해요.

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

// ━━━━━━━━━━ 3단계: Runnery 코드 읽기 — 설정 스위치와 설명 글자 ━━━━━━━━━━
// Runnery 달리기 설정에는 "자동 일시정지" 스위치가 있어요. 켜져 있으면 멈췄을 때 운동 시간도 멈춰요.
// 바로 아래 [주어진 코드] AutoPauseLite는 스위치 값에 따라 설명(subtitle)을 바꿔 보여줘요.
//
// 읽는 법: onChanged는 스위치를 누르면 새 값 v를 넣어 불리는 콜백이에요. setState로 값을 바꾸면 subtitle도 바뀌어요.
// [문제]
// (1) Step3Page의 build에서 Scaffold 대신 return const AutoPauseLite(); 한 줄만 남기세요.
// (2) 실행 전에 처음 설명 글자와 스위치를 한 번 누른 뒤 글자를 [내 예측]에 적고 비교하세요.
// (3) onChanged를 null로 바꾸면 스위치는 어떻게 될까요? (16주 5일 2단계의 "저장 중 스위치 끄기"와 연결해요)
// [내 예측]
//
// [예상 화면]
// 처음 켜짐: 멈추면 시간도 멈춰요 → 누르면: 계속 시간을 재요

// [주어진 코드 — 수정하지 말고 읽기만 하세요]
class AutoPauseLite extends StatefulWidget {
  const AutoPauseLite({super.key});

  @override
  State<AutoPauseLite> createState() => _AutoPauseLiteState();
}

class _AutoPauseLiteState extends State<AutoPauseLite> {
  bool autoPause = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('3단계')),
      body: Center(
        child: SwitchListTile(
          title: const Text('자동 일시정지'),
          subtitle: Text(autoPause ? '멈추면 시간도 멈춰요' : '계속 시간을 재요'),
          value: autoPause,
          onChanged: (v) => setState(() => autoPause = v),
        ),
      ),
    );
  }
}

class Step3Page extends StatelessWidget {
  const Step3Page({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO ①: 아래 Scaffold 대신 const AutoPauseLite()를 반환하세요.
    return Scaffold(
      appBar: AppBar(title: const Text('3단계')),
      body: const Center(child: Text('TODO: 3단계 화면을 만드세요.')),
    );
  }
}

// [내 말로 설명]
// 검증 사례가 정상값만 있으면 무엇을 놓칠 수 있나요?
