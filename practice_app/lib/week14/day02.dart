// 14주차 2일 — 서비스 함수에서 가짜 로그인 결과 받기
// 실행 위치: ~/src/runnery-study/practice_app
// 실행: flutter run -d chrome -t lib/week14/day02.dart
// 처음에는 showPractice = false로 예제를 실행하세요.
// 직접 푼 뒤 true로 바꾸고 저장하세요. 터미널에서 R(대문자)로 다시 시작하세요.
// 다른 날짜를 열 때는 q로 종료하고 그 날짜의 -t 경로로 실행하세요.
// 예제와 문제 작성 공간을 구분했어요. 해설은 answers/day02.dart에 있어요.
//
// [예제 화면 / 관찰할 결과]
// 로그인 버튼 클릭 → 300밀리초 뒤 로그인: user-1
//
// [한 줄씩 읽기]
// 1. 화면은 Account 객체의 login을 호출해요.
// 2. 서비스는 기다린 뒤 사용자 ID를 반환해요.
// 3. 화면은 반환값을 문자열로 표시해요.
// 4. UI 위젯 생성과 요청 처리의 역할을 나누어 읽어요.
//
// [직접 풀 문제]
// FakeAccount 클래스에 Future<String> login({required bool succeed})를 정의하세요.
// 300밀리초 뒤 성공이면 user-1, 실패이면 StateError를 던지세요.
// PracticePage는 succeed = true로 호출하고 loading, message 상태로 대기·성공·실패를 표시하세요.
// try/catch/finally와 mounted 확인은 예제를 참고해도 돼요.
//
// [작성 위치와 호출 위치]
// 입력값은 아래 PracticePage 또는 _PracticePageState의 필드에 선언하세요.
// 새 메서드는 같은 클래스의 build 바깥에 정의하고, build 안 버튼의 onPressed에서 호출하거나 전달하세요.
// build는 화면을 만드는 메서드예요. 직접 반복 호출하지 않고 Flutter가 호출하게 둡니다.
// 화면 구조를 바꾸는 문제는 PracticePage의 build 안 TODO를 작성하세요.
// showPractice가 true이면 main의 MaterialApp이 PracticePage를 화면에 연결해요.
//
// [문제의 예상 결과]
// 로그아웃 → 로그인 중 → 로그인: user-1
//
// [입력 / 조작을 바꿔 다시 확인]
// 서비스가 반환하는 ID를 user-2로 바꿔 화면까지 전달되는지 보세요.
//
// [내 말로 설명]
// 버튼 처리와 사용자 ID를 만드는 함수는 각각 어디에 있나요?

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
  final account = ExampleAccount();
  final bool succeed = true;
  bool loading = false;
  String message = '로그아웃';

  Future<void> login() async {
    setState(() {
      loading = true;
      message = '로그인 중';
    });
    try {
      final userId = await account.login(succeed: succeed);
      if (!mounted) return;
      setState(() {
        message = '로그인: $userId';
      });
    } catch (error) {
      if (!mounted) return;
      setState(() {
        message = '로그인 실패';
      });
    } finally {
      if (mounted) {
        setState(() {
          loading = false;
        });
      }
    }
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
            ElevatedButton(
              onPressed: loading ? null : login,
              child: const Text('로그인'),
            ),
          ],
        ),
      ),
    );
  }
}

class ExampleAccount {
  Future<String> login({required bool succeed}) async {
    await Future<void>.delayed(const Duration(milliseconds: 300));
    if (!succeed) throw StateError('로그인 실패');
    return 'user-1';
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
