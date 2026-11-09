// 16주차 4일 — 실패하면 기존 값 유지하기
// 실행 위치: ~/src/runnery-study/practice_app
// 실행: flutter run -d chrome -t lib/week16/day04.dart
// 정답은 answers/day04.dart에 있어요.
// 오늘의 강의: week16/README.md의 "3. 기능 하나를 끝까지 따라가기 — 2~7일" 섹션이에요. 그 섹션만 읽고 풀 수 있어요.
// 처음에는 stage = 0으로 예제를 봐요. 1단계를 풀면 stage = 1로 바꾸고 저장한 뒤 터미널에서 R(대문자)을 눌러요.
// 2단계, 3단계도 stage 숫자만 바꿔 확인해요. 단계마다 [문제] 바로 아래에 그 단계의 화면 클래스가 있어요.
// 다른 날짜를 열 때는 q로 종료하고 그 날짜의 -t 경로로 실행하세요.
//
// [예제 화면 / 관찰할 결과]
// 실패 후에도 보관된 메모: 기존 기록
//
// [한 줄씩 읽기]
// 1. 저장소는 성공을 확인한 뒤에만 memo를 바꿔요.
// 2. 실패한 입력을 기존 저장값에 먼저 덮어쓰지 않아요.
// 3. catch에서 실패를 표시해도 사용자의 입력창 내용은 남아요.

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
  final bool succeed = false;
  String message = '저장 전';
  @override
  void initState() {
    super.initState();
    controller = TextEditingController(text: '바꿀 메모');
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
  String memo = '기존 기록';
  Future<void> save(String value, {required bool succeed}) async {
    await Future<void>.delayed(const Duration(milliseconds: 300));
    if (!succeed) throw StateError('저장 실패');
    memo = value;
  }
}

// ━━━━━━━━━━ 1단계: 예제 따라 하기 ━━━━━━━━━━
// [문제] _Step1PageState에 String saved = '기존', String message = ''을 두세요.
//        trySave()는 try에서 failSave()를 기다린 뒤 saved = '새 값'을 넣고, catch에서는 message = '저장 실패'를 넣어요(mounted 확인, setState).
//        파일 아래 Future<void> failSave() async는 100밀리초 뒤 StateError('실패')를 던져요.
//        body에는 '보관: $saved', message, '저장' 버튼을 Column으로 놓아요.
// [예상 화면]
// 저장 → 0.1초 뒤 저장 실패 / 보관: 기존 그대로

class Step1Page extends StatefulWidget {
  const Step1Page({super.key});

  @override
  State<Step1Page> createState() => _Step1PageState();
}

class _Step1PageState extends State<Step1Page> {
  // TODO ①: saved, message, trySave()를 만들고 body를 Column으로 바꾸세요.

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('1단계')),
      body: const Center(child: Text('TODO: 1단계 화면을 만드세요.')),
    );
  }
}

// TODO ②: 여기에 Future<void> failSave() async를 정의하세요.

// ━━━━━━━━━━ 2단계: 직접 작성 ━━━━━━━━━━
// [문제] MemoStore의 초기 memo를 '기존 메모'로 두세요. 실패이면 기존 값을 변경하기 전에 throw하세요.
//        Step2Page는 초기 입력 '새 메모', succeed = false로 설정하세요.
//        저장 실패 문구를 표시하고 보관된 메모는 기존 메모로 유지하세요. 다시 누를 수 있어야 해요.
// [예상 화면]
// 저장 실패 / 보관된 메모: 기존 메모 / 입력창: 새 메모
// [조작을 바꿔 다시 확인] succeed를 true로 바꾸고 R로 다시 시작한 뒤 저장하면 보관된 메모는 새 메모예요.

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

// ━━━━━━━━━━ 3단계: Runnery 코드 읽기 — 새로고침이 실패해도 목록은 남기기 ━━━━━━━━━━
// Runnery 홈 화면의 _reload는 실패하면 _error만 바꾸고 _records는 그대로 둬요(6주차 6일에 Dart로 읽었어요).
//
//   } catch (error) {
//     if (mounted) setState(() => _error = error);
//   }
//
// 바로 아래 [주어진 코드] HomeErrorLite는 처음에 기록 [3.0]을 가지고 있고, 새로고침은 항상 실패해요.
// [문제]
// (1) Step3Page의 build에서 Scaffold 대신 return const HomeErrorLite(); 한 줄만 남기세요.
// (2) 실행 전에 '새로고침'을 누르고 0.2초 뒤 화면 두 줄을 [내 예측]에 적고 비교하세요.
// (3) 실패했을 때 목록까지 비워 버리면 사용자는 무엇을 오해할 수 있나요?
// [내 예측]
//
// [예상 화면]
// [3.0] / 오류 없음 → 새로고침 → [3.0] / 불러오지 못했어요

// [주어진 코드 — 수정하지 말고 읽기만 하세요]
class HomeErrorLite extends StatefulWidget {
  const HomeErrorLite({super.key});

  @override
  State<HomeErrorLite> createState() => _HomeErrorLiteState();
}

class _HomeErrorLiteState extends State<HomeErrorLite> {
  List<double> _records = [3.0];
  Object? _error;

  Future<List<double>> load() async {
    await Future<void>.delayed(const Duration(milliseconds: 100));
    throw StateError('인터넷 끊김');
  }

  Future<void> _reload() async {
    try {
      final loaded = await load();
      if (mounted) {
        setState(() {
          _records = loaded;
          _error = null;
        });
      }
    } catch (error) {
      if (mounted) setState(() => _error = error);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('3단계')),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('$_records'),
            Text(_error == null ? '오류 없음' : '불러오지 못했어요'),
            ElevatedButton(onPressed: _reload, child: const Text('새로고침')),
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
    // TODO ①: 아래 Scaffold 대신 const HomeErrorLite()를 반환하세요.
    return Scaffold(
      appBar: AppBar(title: const Text('3단계')),
      body: const Center(child: Text('TODO: 3단계 화면을 만드세요.')),
    );
  }
}

// [내 말로 설명]
// 입력값, 저장값, 화면 문구 세 가지를 각각 가리켜 보세요.
