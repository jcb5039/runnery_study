// 14주차 5일 해설 — 성공한 뒤 홈으로 이동
// 실행: flutter run -d chrome -t lib/week14/answers/day05.dart
// 아래 stage 숫자(1·2·3)로 볼 단계를 골라요. 먼저 직접 시도한 뒤 읽고, 닫은 다음 다시 풀어 보세요.
// 1단계 예상 화면: 시작하기 → 환영해요 (뒤로 가기 없음)
// 2단계 예상 결과:
// 로그인 클릭 → 대기 → 홈에 환영합니다: user-1. 앱 내부 뒤로 가기로 이전 로그인 화면에 돌아가지 않아요.
// 확인 질문: 서비스 함수가 직접 Navigator를 호출하지 않게 나눈 이유를 말해보세요.
// 3단계 예상 화면: 로그인 → 0.3초 뒤 이메일 인증 화면 (verified: true면 메인 탭)

import 'package:flutter/material.dart';

int stage = 1; // 1·2·3 중 보고 싶은 단계

void main() {
  const pages = <Widget>[Step1Page(), Step2Page(), Step3Page()];
  runApp(MaterialApp(home: pages[stage - 1]));
}

// ━━━━━━━━━━ 1단계 ━━━━━━━━━━
class Step1Page extends StatelessWidget {
  const Step1Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('1단계')),
      body: Center(
        child: ElevatedButton(
          onPressed: () => Navigator.of(context).pushReplacement(
            MaterialPageRoute<void>(builder: (context) => const WelcomePage()),
          ),
          child: const Text('시작하기'),
        ),
      ),
    );
  }
}

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('환영')),
      body: const Center(child: Text('환영해요')),
    );
  }
}

// ━━━━━━━━━━ 2단계 ━━━━━━━━━━
class Step2Page extends StatefulWidget {
  const Step2Page({super.key});
  @override
  State<Step2Page> createState() => _Step2PageState();
}

class _Step2PageState extends State<Step2Page> {
  final account = FakeAccount();
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
        MaterialPageRoute<void>(builder: (context) => HomePage(userId: id)),
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

class FakeAccount {
  Future<String> login({required bool succeed}) async {
    await Future<void>.delayed(const Duration(milliseconds: 300));
    if (!succeed) throw StateError('로그인 실패');
    return 'user-1';
  }
}

class HomePage extends StatelessWidget {
  final String userId;
  const HomePage({super.key, required this.userId});
  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: const Text('홈')),
    body: Center(child: Text('환영합니다: $userId')),
  );
}

// ━━━━━━━━━━ 3단계 ━━━━━━━━━━
class NextLite extends StatefulWidget {
  const NextLite({super.key, required this.verified});

  final bool verified;

  @override
  State<NextLite> createState() => _NextLiteState();
}

class _NextLiteState extends State<NextLite> {
  Future<void> _login() async {
    await Future<void>.delayed(const Duration(milliseconds: 200));
    if (!mounted) return;
    _next();
  }

  void _next() {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute<void>(
        builder: (_) => Scaffold(
          body: Center(child: Text(widget.verified ? '메인 탭' : '이메일 인증 화면')),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('3단계')),
      body: Center(
        child: ElevatedButton(onPressed: _login, child: const Text('로그인')),
      ),
    );
  }
}

class Step3Page extends StatelessWidget {
  const Step3Page({super.key});

  @override
  Widget build(BuildContext context) {
    return const NextLite(verified: false);
  }
}
