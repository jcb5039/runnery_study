// 14주차 3일 해설 — 로딩 중 중복 요청 막기
// 실행: flutter run -d chrome -t lib/week14/answers/day03.dart
// 아래 stage 숫자(1·2·3)로 볼 단계를 골라요. 먼저 직접 시도한 뒤 읽고, 닫은 다음 다시 풀어 보세요.
// 1단계 예상 화면: 준비 → 일하기 누르면 기다리는 중(버튼 꺼짐) → 0.3초 뒤 준비
// 2단계 예상 결과:
// 클릭 직후 로그인 중 + 진행 표시 + 비활성 버튼 / 1초 뒤 로그인: user-1 + 활성 버튼
// 확인 질문: loading을 await 뒤에서야 true로 바꾸면 어떤 문제가 있나요?
// 3단계 예상 화면: 완료 0번 + 로그인 버튼 → 누르면 도는 표시(글자 없음) → 0.5초 뒤 완료 1번 + 로그인 버튼

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
  bool loading = false;

  Future<void> work() async {
    setState(() => loading = true);
    await Future<void>.delayed(const Duration(milliseconds: 300));
    if (!mounted) return;
    setState(() => loading = false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('1단계')),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(loading ? '기다리는 중' : '준비'),
            ElevatedButton(onPressed: loading ? null : work, child: const Text('일하기')),
          ],
        ),
      ),
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

// ━━━━━━━━━━ 3단계 ━━━━━━━━━━
class LoginButtonLite extends StatefulWidget {
  const LoginButtonLite({super.key});

  @override
  State<LoginButtonLite> createState() => _LoginButtonLiteState();
}

class _LoginButtonLiteState extends State<LoginButtonLite> {
  bool loading = false;
  int done = 0;

  Future<void> login() async {
    setState(() => loading = true);
    await Future<void>.delayed(const Duration(milliseconds: 400));
    if (!mounted) return;
    setState(() {
      loading = false;
      done++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('3단계')),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('완료 $done번'),
            ElevatedButton(
              onPressed: loading ? null : login,
              child: loading
                  ? const SizedBox(
                      width: 16,
                      height: 16,
                      child: CircularProgressIndicator(strokeWidth: 2),
                    )
                  : const Text('로그인'),
            ),
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
    return const LoginButtonLite();
  }
}
