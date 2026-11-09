// 14주차 6일 해설 — 요청 중 화면에서 나가기
// 실행: flutter run -d chrome -t lib/week14/answers/day06.dart
// 예상 결과:
// 요청 중 뒤로 가도 제거된 화면에 setState하지 않아요. 화면에 남아 있으면 결과가 표시돼요.
// 확인 질문: mounted 확인이 실제 네트워크 요청을 멈추는 것은 아닌 이유를 설명하세요.

import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(home: PracticePage()));
}

class PracticePage extends StatelessWidget {
  const PracticePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('달리기 연습')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute<void>(builder: (context) => const LoginPanel()),
            );
          },
          child: const Text('로그인 화면 열기'),
        ),
      ),
    );
  }
}

class LoginPanel extends StatefulWidget {
  const LoginPanel({super.key});
  @override
  State<LoginPanel> createState() => _LoginPanelState();
}

class _LoginPanelState extends State<LoginPanel> {
  final account = FakeAccount();
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

class FakeAccount {
  Future<String> login({required bool succeed}) async {
    await Future<void>.delayed(const Duration(milliseconds: 1500));
    if (!succeed) throw StateError('로그인 실패');
    return 'user-1';
  }
}
