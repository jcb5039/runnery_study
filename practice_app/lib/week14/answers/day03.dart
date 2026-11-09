// 14주차 3일 해설 — 로딩 중 중복 요청 막기
// 실행: flutter run -d chrome -t lib/week14/answers/day03.dart
// 예상 결과:
// 클릭 직후 로그인 중 + 진행 표시 + 비활성 버튼 / 1초 뒤 로그인: user-1 + 활성 버튼
// 확인 질문: loading을 await 뒤에서야 true로 바꾸면 어떤 문제가 있나요?

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
            if (loading) const CircularProgressIndicator(),
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
    await Future<void>.delayed(const Duration(milliseconds: 1000));
    if (!succeed) throw StateError('로그인 실패');
    return 'user-1';
  }
}
