// 14주차 6일 — 요청 중 화면에서 나가기
// 실행 위치: ~/src/runnery-study/practice_app
// 실행: flutter run -d chrome -t lib/week14/day06.dart
// 처음에는 showPractice = false로 예제를 실행하세요.
// 직접 푼 뒤 true로 바꾸고 저장하세요. 터미널에서 R(대문자)로 다시 시작하세요.
// 다른 날짜를 열 때는 q로 종료하고 그 날짜의 -t 경로로 실행하세요.
// 예제와 문제 작성 공간을 구분했어요. 해설은 answers/day06.dart에 있어요.
//
// [예제 화면 / 관찰할 결과]
// 로그인 요청 후 즉시 뒤로 가도 setState 오류 없음
//
// [한 줄씩 읽기]
// 1. 로그인 화면을 push해 뒤로 가기를 할 수 있게 해요.
// 2. 요청 중 뒤로 가면 State가 제거될 수 있어요.
// 3. 성공·실패·finally 모두 mounted를 확인해야 해요.
// 4. mounted는 요청 취소 기능이 아니라 화면 사용 가능 여부예요.
//
// [직접 풀 문제]
// PracticePage는 LoginPanel을 push하는 버튼을 만드세요.
// LoginPanel은 FakeAccount.login을 1.5초 기다리고 결과를 표시하게 만드세요.
// await 뒤, catch, finally에서 mounted를 확인하세요.
// 성공 입력 true와 실패 입력 false를 각각 확인하세요.
//
// [작성 위치와 호출 위치]
// 입력값은 아래 PracticePage 또는 _PracticePageState의 필드에 선언하세요.
// 새 메서드는 같은 클래스의 build 바깥에 정의하고, build 안 버튼의 onPressed에서 호출하거나 전달하세요.
// build는 화면을 만드는 메서드예요. 직접 반복 호출하지 않고 Flutter가 호출하게 둡니다.
// 화면 구조를 바꾸는 문제는 PracticePage의 build 안 TODO를 작성하세요.
// showPractice가 true이면 main의 MaterialApp이 PracticePage를 화면에 연결해요.
//
// [문제의 예상 결과]
// 요청 중 뒤로 가도 제거된 화면에 setState하지 않아요. 화면에 남아 있으면 결과가 표시돼요.
//
// [입력 / 조작을 바꿔 다시 확인]
// 실패 설정에서도 요청 중 뒤로 가기를 해보세요.
//
// [내 말로 설명]
// mounted 확인이 실제 네트워크 요청을 멈추는 것은 아닌 이유를 설명하세요.

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
                builder: (context) => const ExampleLogin(),
              ),
            );
          },
          child: const Text('로그인 화면 열기'),
        ),
      ),
    );
  }
}

class ExampleLogin extends StatefulWidget {
  const ExampleLogin({super.key});
  @override
  State<ExampleLogin> createState() => _ExampleLoginState();
}

class _ExampleLoginState extends State<ExampleLogin> {
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
    await Future<void>.delayed(const Duration(milliseconds: 1500));
    if (!succeed) throw StateError('로그인 실패');
    return 'user-1';
  }
}

// [직접 풀 문제 — 작성 공간]
class PracticePage extends StatelessWidget {
  const PracticePage({super.key});
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
