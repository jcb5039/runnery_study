// 14주차 5일 해설 — 성공한 뒤 홈으로 이동
// 실행: flutter run -d chrome -t lib/week14/answers/day05.dart
// 예상 결과:
// 로그인 클릭 → 대기 → 홈에 환영합니다: user-1. 앱 내부 뒤로 가기로 이전 로그인 화면에 돌아가지 않아요.
// 확인 질문: 서비스 함수가 직접 Navigator를 호출하지 않게 나눈 이유를 말해보세요.

import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(home: PracticePage()));
}

class PracticePage extends StatefulWidget {
  const PracticePage({super.key});
  @override
  State<PracticePage> createState() => _PracticePageState();
}

class _PracticePageState extends State<PracticePage> {
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
