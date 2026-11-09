// 14주차 5일 — 성공한 뒤 홈으로 이동
// 실행 위치: ~/src/runnery-study/practice_app
// 실행: flutter run -d chrome -t lib/week14/day05.dart
// 처음에는 showPractice = false로 예제를 실행하세요.
// 직접 푼 뒤 true로 바꾸고 저장하세요. 터미널에서 R(대문자)로 다시 시작하세요.
// 다른 날짜를 열 때는 q로 종료하고 그 날짜의 -t 경로로 실행하세요.
// 예제와 문제 작성 공간을 구분했어요. 해설은 answers/day05.dart에 있어요.
//
// [예제 화면 / 관찰할 결과]
// 성공하면 홈으로 이동하며 ID가 표시돼요.
//
// [한 줄씩 읽기]
// 1. 서비스의 사용자 ID를 기다려 받아요.
// 2. mounted를 확인한 뒤 Navigator를 사용해요.
// 3. pushReplacement로 로그인 화면을 홈으로 바꿔요.
// 4. 홈의 생성자로 사용자 ID를 전달해요.
//
// [직접 풀 문제]
// FakeAccount.login, PracticePage의 login(), HomePage(userId)를 각각 정의하세요.
// 성공하면 user-1을 HomePage로 전달해 화면을 교체하세요.
// 실패이면 로그인 화면에 로그인 실패를 표시하고 다시 누를 수 있게 하세요.
// 처음 입력 succeed는 true로 설정하세요.
//
// [작성 위치와 호출 위치]
// 입력값은 아래 PracticePage 또는 _PracticePageState의 필드에 선언하세요.
// 새 메서드는 같은 클래스의 build 바깥에 정의하고, build 안 버튼의 onPressed에서 호출하거나 전달하세요.
// build는 화면을 만드는 메서드예요. 직접 반복 호출하지 않고 Flutter가 호출하게 둡니다.
// 화면 구조를 바꾸는 문제는 PracticePage의 build 안 TODO를 작성하세요.
// showPractice가 true이면 main의 MaterialApp이 PracticePage를 화면에 연결해요.
//
// [문제의 예상 결과]
// 로그인 클릭 → 대기 → 홈에 환영합니다: user-1. 앱 내부 뒤로 가기로 이전 로그인 화면에 돌아가지 않아요.
//
// [입력 / 조작을 바꿔 다시 확인]
// succeed = false이면 이동하지 않고 로그인 실패가 보여야 해요.
//
// [내 말로 설명]
// 서비스 함수가 직접 Navigator를 호출하지 않게 나눈 이유를 말해보세요.

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
  bool loading = false;
  String message = '로그아웃';
  final bool succeed = true;

  Future<void> login() async {
    setState(() {
      loading = true;
      message = '로그인 중';
    });
    try {
      final id = await account.login(succeed: succeed);
      if (!mounted) return;
      Navigator.of(context).pushReplacement(
        MaterialPageRoute<void>(builder: (context) => ExampleHome(userId: id)),
      );
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

class ExampleHome extends StatelessWidget {
  final String userId;
  const ExampleHome({super.key, required this.userId});
  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: const Text('홈')),
    body: Center(child: Text('환영합니다: $userId')),
  );
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
