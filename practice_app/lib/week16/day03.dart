// 16주차 3일 — 화면과 저장 함수 나누기
// 실행 위치: ~/src/runnery-study/practice_app
// 실행: flutter run -d chrome -t lib/week16/day03.dart
// 처음에는 showPractice = false로 예제를 실행하세요.
// 직접 푼 뒤 true로 바꾸고 저장하세요. 터미널에서 R(대문자)로 다시 시작하세요.
// 다른 날짜를 열 때는 q로 종료하고 그 날짜의 -t 경로로 실행하세요.
// 예제와 문제 작성 공간을 구분했어요. 해설은 answers/day03.dart에 있어요.
//
// [예제 화면 / 관찰할 결과]
// 아침 저장 뒤 저장 완료와 보관된 메모: 아침
//
// [한 줄씩 읽기]
// 1. 화면 save가 입력을 검사해요.
// 2. 저장소 save가 입력을 기다린 뒤 memo 필드에 보관해요.
// 3. 화면은 완료를 기다려 결과를 표시해요.
// 4. 예제 저장소는 메모리이며, 디스크 영구 저장과 구분하세요.
//
// [직접 풀 문제]
// MemoStore에 memo 필드와 Future<void> save(String value, {required bool succeed})를 정의하세요.
// PracticePage는 초기 입력 '저녁 달리기', succeed = true로 저장소를 호출하세요.
// 빈 입력을 막고 저장 중 버튼을 비활성화하세요. 결과 문구와 보관된 메모를 표시하세요.
// 컨트롤러 정리, mounted 확인, finally를 포함하세요.
//
// [작성 위치와 호출 위치]
// 입력값은 아래 PracticePage 또는 _PracticePageState의 필드에 선언하세요.
// 새 메서드는 같은 클래스의 build 바깥에 정의하고, build 안 버튼의 onPressed에서 호출하거나 전달하세요.
// build는 화면을 만드는 메서드예요. 직접 반복 호출하지 않고 Flutter가 호출하게 둡니다.
// 화면 구조를 바꾸는 문제는 PracticePage의 build 안 TODO를 작성하세요.
// showPractice가 true이면 main의 MaterialApp이 PracticePage를 화면에 연결해요.
//
// [문제의 예상 결과]
// 저장 중 → 저장 완료 / 보관된 메모: 저녁 달리기
//
// [입력 / 조작을 바꿔 다시 확인]
// 입력을 바꿔 다시 저장하면 보관된 메모도 새 값으로 바뀌어요.
//
// [내 말로 설명]
// 파일 저장으로 확장할 때 어느 함수 안에 11주차 코드를 넣을 수 있나요?

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
