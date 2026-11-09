// 16주차 6일 — 화면 진입부터 종료까지 추적
// 실행 위치: ~/src/runnery-study/practice_app
// 실행: flutter run -d chrome -t lib/week16/day06.dart
// 정답은 answers/day06.dart에 있어요.
// 오늘의 강의: week16/README.md의 "3. 기능 하나를 끝까지 따라가기 — 2~7일" 섹션이에요. 그 섹션만 읽고 풀 수 있어요.
// 처음에는 stage = 0으로 예제를 봐요. 1단계를 풀면 stage = 1로 바꾸고 저장한 뒤 터미널에서 R(대문자)을 눌러요.
// 2단계, 3단계도 stage 숫자만 바꿔 확인해요. 단계마다 [문제] 바로 아래에 그 단계의 화면 클래스가 있어요.
// 다른 날짜를 열 때는 q로 종료하고 그 날짜의 -t 경로로 실행하세요.
//
// [예제 화면 / 관찰할 결과]
// 메모 화면의 생성과 제거를 이동과 함께 관찰해요.
//
// [한 줄씩 읽기]
// 1. 목록 역할의 첫 화면에서 편집 화면을 열어요.
// 2. 편집 화면은 자기 controller와 저장소를 소유해요.
// 3. 저장 중 뒤로 가면 mounted 검사로 제거된 화면 갱신을 건너뛰어요.
// 4. 현재 저장소는 화면마다 새로 생겨요. 화면 간 유지하려면 소유 위치를 옮겨야 해요.

import 'package:flutter/material.dart';
import 'dart:async';

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
          child: const Text('메모 화면'),
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
// [문제] _Step1PageState의 initState에 debugPrint('메모 화면 시작'), dispose에 debugPrint('메모 화면 끝')을 넣으세요.
//        (initState는 super 호출 뒤, dispose는 super 호출 전) body는 Center(child: Text('메모 화면'))이에요.
// [예상 화면]
// 메모 화면 / 열리면 로그 메모 화면 시작, 사라지면 메모 화면 끝

class Step1Page extends StatefulWidget {
  const Step1Page({super.key});

  @override
  State<Step1Page> createState() => _Step1PageState();
}

class _Step1PageState extends State<Step1Page> {
  // TODO ①: initState와 dispose를 만들고 body를 바꾸세요.

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('1단계')),
      body: const Center(child: Text('TODO: 1단계 화면을 만드세요.')),
    );
  }
}

// ━━━━━━━━━━ 2단계: 직접 작성 ━━━━━━━━━━
// [문제] Step2Page에서 MemoEditor를 여는 버튼을 만드세요.
//        MemoEditor는 초기 입력 '저녁 달리기'로 비동기 저장을 수행하세요.
//        initState에는 '편집 시작', dispose에는 '편집 종료' 로그를 넣으세요.
//        저장 중 뒤로 가기, 다시 열기를 해보며 상태와 저장소의 수명을 기록하세요.
// [예상 화면]
// 열면 편집 시작 / 저장 중 뒤로 가면 편집 종료 / 다시 열면 새 상태와 초기 입력
// [조작을 바꿔 다시 확인] 저장 지연을 2초로 늘리고 바로 뒤로 가도 화면 갱신 오류가 없어야 해요.

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

// ━━━━━━━━━━ 3단계: Runnery 코드 읽기 — 화면이 닫히면 타이머도 멈추기 ━━━━━━━━━━
// Runnery 달리기 화면이 사라질 때는 RunningSession의 타이머와 GPS 구독을 모두 멈춰요(13주차 4·5일의 _stop).
// 바로 아래 [주어진 코드] RunPageLite는 initState에서 타이머를 켜고 dispose에서 꺼요.
//
// 읽는 법: Timer.periodic이 0.1초마다 seconds를 1 늘려요(빨리 보려고 1초 대신 0.1초로 했어요).
//   dispose에서 _ticker?.cancel()을 하지 않으면 화면이 없어진 뒤에도 setState를 부르려 해서 오류가 나요.
// [문제]
// (1) Step3Page의 body에 Center로 감싼 '달리기 화면' 버튼을 놓고, 누르면 RunPageLite를 push하세요.
// (2) 실행 전에 열고 잠시 뒤 숫자가 어떻게 되는지, 뒤로 가면 어떤 로그가 찍히는지 [내 예측]에 적고 비교하세요.
// (3) dispose의 cancel 줄을 지우면 무슨 일이 생길지 설명해 보세요(직접 지우지는 않아도 돼요).
// [내 예측]
//
// [예상 화면]
// 달리기 화면 → 숫자가 0초, 1초, 2초…로 늘어요 → 뒤로 가기 → 로그 타이머 멈춤

// [주어진 코드 — 수정하지 말고 읽기만 하세요]
class RunPageLite extends StatefulWidget {
  const RunPageLite({super.key});

  @override
  State<RunPageLite> createState() => _RunPageLiteState();
}

class _RunPageLiteState extends State<RunPageLite> {
  Timer? _ticker;
  int seconds = 0;

  @override
  void initState() {
    super.initState();
    _ticker = Timer.periodic(const Duration(milliseconds: 100), (_) {
      setState(() => seconds++);
    });
  }

  @override
  void dispose() {
    _ticker?.cancel();
    debugPrint('타이머 멈춤');
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('달리는 중')),
      body: Center(child: Text('$seconds초')),
    );
  }
}

class Step3Page extends StatelessWidget {
  const Step3Page({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO ①: body를 RunPageLite를 여는 버튼으로 바꾸세요.
    return Scaffold(
      appBar: AppBar(title: const Text('3단계')),
      body: const Center(child: Text('TODO: 3단계 화면을 만드세요.')),
    );
  }
}

// [내 말로 설명]
// 입력 → 버튼 → 서비스 → 값 변화 → 화면 → 정리까지 함수 이름으로 설명하세요.
