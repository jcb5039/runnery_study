// 16주차 4일 — 실패하면 기존 값 유지하기
// 실행 위치: ~/src/runnery-study/practice_app
// 실행: flutter run -d chrome -t lib/week16/day04.dart
// 처음에는 showPractice = false로 예제를 실행하세요.
// 직접 푼 뒤 true로 바꾸고 저장하세요. 터미널에서 R(대문자)로 다시 시작하세요.
// 다른 날짜를 열 때는 q로 종료하고 그 날짜의 -t 경로로 실행하세요.
// 예제와 문제 작성 공간을 구분했어요. 해설은 answers/day04.dart에 있어요.
//
// [예제 화면 / 관찰할 결과]
// 실패 후에도 보관된 메모: 기존 기록
//
// [한 줄씩 읽기]
// 1. 저장소는 성공을 확인한 뒤에만 memo를 바꿔요.
// 2. 실패한 입력을 기존 저장값에 먼저 덮어쓰지 않아요.
// 3. catch에서 실패를 표시해도 사용자의 입력창 내용은 남아요.
//
// [직접 풀 문제]
// MemoStore의 초기 memo를 '기존 메모'로 두세요. 실패이면 기존 값을 변경하기 전에 throw하세요.
// PracticePage는 초기 입력 '새 메모', succeed = false로 설정하세요.
// 저장 실패 문구를 표시하고 보관된 메모는 기존 메모로 유지하세요. 다시 누를 수 있어야 해요.
//
// [작성 위치와 호출 위치]
// 입력값은 아래 PracticePage 또는 _PracticePageState의 필드에 선언하세요.
// 새 메서드는 같은 클래스의 build 바깥에 정의하고, build 안 버튼의 onPressed에서 호출하거나 전달하세요.
// build는 화면을 만드는 메서드예요. 직접 반복 호출하지 않고 Flutter가 호출하게 둡니다.
// 화면 구조를 바꾸는 문제는 PracticePage의 build 안 TODO를 작성하세요.
// showPractice가 true이면 main의 MaterialApp이 PracticePage를 화면에 연결해요.
//
// [문제의 예상 결과]
// 저장 실패 / 보관된 메모: 기존 메모 / 입력창: 새 메모
//
// [입력 / 조작을 바꿔 다시 확인]
// succeed를 true로 바꾸고 R로 다시 시작한 뒤 저장하면 보관된 메모는 새 메모예요.
//
// [내 말로 설명]
// 입력값, 저장값, 화면 문구 세 가지를 각각 가리켜 보세요.

import 'package:flutter/material.dart';

bool showPractice = false; // 예제 확인 후 true로 바꾸세요.

void main() {
  runApp(
    MaterialApp(
      home: showPractice ? const PracticePage() : const ExamplePage(),
    ),
  );
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

// [직접 풀 문제 — 작성 공간]
class PracticePage extends StatefulWidget {
  const PracticePage({super.key});
  @override
  State<PracticePage> createState() => _PracticePageState();
}

class _PracticePageState extends State<PracticePage> {
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
