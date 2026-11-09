// 14주차 4일 해설 — 로그인 실패를 화면에 표시
// 실행: flutter run -d chrome -t lib/week14/answers/day04.dart
// 아래 stage 숫자(1·2·3)로 볼 단계를 골라요. 먼저 직접 시도한 뒤 읽고, 닫은 다음 다시 풀어 보세요.
// 1단계 예상 화면: 대기 → 시도 → 0.1초 뒤 실패했어요
// 2단계 예상 결과:
// 로그인 중 → 로그인 실패, 버튼을 다시 누를 수 있어요.
// 확인 질문: 실패했는데 성공 화면으로 이동하지 않도록 어느 분기에서 구분하나요?
// 3단계 예상 화면: 비밀번호 틀림 → 비밀번호가 달라요 / 없는 계정 → 가입하지 않은 이메일이에요 / 기타 → 로그인하지 못했어요

import 'package:flutter/material.dart';

int stage = 1; // 1·2·3 중 보고 싶은 단계

void main() {
  const pages = <Widget>[Step1Page(), Step2Page(), Step3Page()];
  runApp(MaterialApp(home: pages[stage - 1]));
}

// ━━━━━━━━━━ 1단계 ━━━━━━━━━━
class Step1Page extends StatefulWidget {
  const Step1Page({super.key});

  @override
  State<Step1Page> createState() => _Step1PageState();
}

class _Step1PageState extends State<Step1Page> {
  String text = '대기';

  Future<void> tryLoad() async {
    try {
      await failLater();
    } catch (error) {
      if (!mounted) return;
      setState(() => text = '실패했어요');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('1단계')),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(text),
            ElevatedButton(onPressed: tryLoad, child: const Text('시도')),
          ],
        ),
      ),
    );
  }
}

Future<void> failLater() async {
  await Future<void>.delayed(const Duration(milliseconds: 100));
  throw StateError('끊김');
}

// ━━━━━━━━━━ 2단계 ━━━━━━━━━━
class Step2Page extends StatefulWidget {
  const Step2Page({super.key});
  @override
  State<Step2Page> createState() => _Step2PageState();
}

class _Step2PageState extends State<Step2Page> {
  final account = FakeAccount();
  final bool succeed = false;
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

class FakeAccount {
  Future<String> login({required bool succeed}) async {
    await Future<void>.delayed(const Duration(milliseconds: 300));
    if (!succeed) throw StateError('로그인 실패');
    return 'user-1';
  }
}

// ━━━━━━━━━━ 3단계 ━━━━━━━━━━
String loginMessage(String code) {
  if (code == 'wrong-password') return '비밀번호가 달라요';
  if (code == 'user-not-found') return '가입하지 않은 이메일이에요';
  return '로그인하지 못했어요';
}

class LoginErrorLite extends StatefulWidget {
  const LoginErrorLite({super.key});

  @override
  State<LoginErrorLite> createState() => _LoginErrorLiteState();
}

class _LoginErrorLiteState extends State<LoginErrorLite> {
  String message = '';

  void fail(String code) {
    setState(() => message = loginMessage(code));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('3단계')),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(message),
            ElevatedButton(onPressed: () => fail('wrong-password'), child: const Text('비밀번호 틀림')),
            ElevatedButton(onPressed: () => fail('user-not-found'), child: const Text('없는 계정')),
            ElevatedButton(onPressed: () => fail('network'), child: const Text('기타')),
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
    return const LoginErrorLite();
  }
}
