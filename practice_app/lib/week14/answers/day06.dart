// 14주차 6일 해설 — 요청 중 화면에서 나가기
// 실행: flutter run -d chrome -t lib/week14/answers/day06.dart
// 아래 stage 숫자(1·2·3)로 볼 단계를 골라요. 먼저 직접 시도한 뒤 읽고, 닫은 다음 다시 풀어 보세요.
// 1단계 예상 화면: 확인 전 → 확인 → mounted: true
// 2단계 예상 결과:
// 요청 중 뒤로 가도 제거된 화면에 setState하지 않아요. 화면에 남아 있으면 결과가 표시돼요.
// 확인 질문: mounted 확인이 실제 네트워크 요청을 멈추는 것은 아닌 이유를 설명하세요.
// 3단계 예상 화면: 처음: 불러오는 중 → 0.3초 뒤: 메인 탭

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
  String text = '확인 전';

  void check() {
    setState(() => text = 'mounted: $mounted');
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
            ElevatedButton(onPressed: check, child: const Text('확인')),
          ],
        ),
      ),
    );
  }
}

// ━━━━━━━━━━ 2단계 ━━━━━━━━━━
class Step2Page extends StatelessWidget {
  const Step2Page({super.key});

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

// ━━━━━━━━━━ 3단계 ━━━━━━━━━━
class LoadGateLite extends StatefulWidget {
  const LoadGateLite({super.key});

  @override
  State<LoadGateLite> createState() => _LoadGateLiteState();
}

class _LoadGateLiteState extends State<LoadGateLite> {
  late final Future<void> _loaded = Future<void>.delayed(const Duration(milliseconds: 300));

  @override
  Widget build(BuildContext context) => FutureBuilder<void>(
    future: _loaded,
    builder: (context, snapshot) {
      if (snapshot.connectionState != ConnectionState.done) {
        return const Scaffold(body: Center(child: Text('불러오는 중')));
      }
      return const Scaffold(body: Center(child: Text('메인 탭')));
    },
  );
}

class Step3Page extends StatelessWidget {
  const Step3Page({super.key});

  @override
  Widget build(BuildContext context) {
    return const LoadGateLite();
  }
}
