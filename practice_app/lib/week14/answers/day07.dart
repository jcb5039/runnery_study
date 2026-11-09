// 14주차 7일 해설 — 복습: 로그인·로그아웃 상태
// 실행: flutter run -d chrome -t lib/week14/answers/day07.dart
// 예상 결과:
// 로그아웃 → 로그인 중 → 로그인: user-1 → 로그아웃 버튼 → 로그아웃
// 확인 질문: Runnery에서 버튼 처리, AccountStore.login, backend, 다음 화면 결정을 각각 찾아보세요.

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
            TextButton(
              onPressed: loading
                  ? null
                  : () => setState(() {
                      message = '로그아웃';
                    }),
              child: const Text('로그아웃'),
            ),
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
