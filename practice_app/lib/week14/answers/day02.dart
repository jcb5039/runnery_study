// 14주차 2일 해설 — 서비스 함수에서 가짜 로그인 결과 받기
// 실행: flutter run -d chrome -t lib/week14/answers/day02.dart
// 아래 stage 숫자(1·2·3)로 볼 단계를 골라요. 먼저 직접 시도한 뒤 읽고, 닫은 다음 다시 풀어 보세요.
// 1단계 예상 화면: 날씨 모름 → 불러오기 → 0.2초 뒤 날씨: 맑음
// 2단계 예상 결과:
// 로그아웃 → 로그인 중 → 로그인: user-1
// 확인 질문: 버튼 처리와 사용자 ID를 만드는 함수는 각각 어디에 있나요?
// 3단계 예상 화면: 짧은 비밀번호 → 로그인 실패 / 올바른 비밀번호 → 로그인: user-7

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
  String text = '날씨 모름';

  Future<void> load() async {
    final result = await FakeWeatherOne().fetch();
    if (!mounted) return;
    setState(() {
      text = '날씨: $result';
    });
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
            ElevatedButton(onPressed: load, child: const Text('불러오기')),
          ],
        ),
      ),
    );
  }
}

class FakeWeatherOne {
  Future<String> fetch() async {
    await Future<void>.delayed(const Duration(milliseconds: 200));
    return '맑음';
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
class AccountServiceLite {
  Future<String> login(String password) async {
    if (password.length < 6) throw StateError('비밀번호가 짧아요');
    await Future<void>.delayed(const Duration(milliseconds: 200));
    return 'user-7';
  }
}

class LoginFormLite extends StatefulWidget {
  const LoginFormLite({super.key});

  @override
  State<LoginFormLite> createState() => _LoginFormLiteState();
}

class _LoginFormLiteState extends State<LoginFormLite> {
  final service = AccountServiceLite();
  String message = '로그아웃';

  Future<void> login(String password) async {
    try {
      final id = await service.login(password);
      if (!mounted) return;
      setState(() => message = '로그인: $id');
    } catch (error) {
      if (!mounted) return;
      setState(() => message = '로그인 실패');
    }
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
            ElevatedButton(onPressed: () => login('123'), child: const Text('짧은 비밀번호')),
            ElevatedButton(onPressed: () => login('runner77'), child: const Text('올바른 비밀번호')),
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
    return const LoginFormLite();
  }
}
