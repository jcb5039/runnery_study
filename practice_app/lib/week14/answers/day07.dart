// 14주차 7일 해설 — 복습: 로그인·로그아웃 상태
// 실행: flutter run -d chrome -t lib/week14/answers/day07.dart
// 아래 stage 숫자(1·2·3)로 볼 단계를 골라요. 먼저 직접 시도한 뒤 읽고, 닫은 다음 다시 풀어 보세요.
// 1단계 예상 화면: 로그인: user-1 → 로그아웃 → 로그아웃됨
// 2단계 예상 결과:
// 로그아웃 → 로그인 중 → 로그인: user-1 → 로그아웃 버튼 → 로그아웃
// 확인 질문: Runnery에서 버튼 처리, AccountStore.login, backend, 다음 화면 결정을 각각 찾아보세요.
// 3단계 예상 화면: 로그인 화면 → 로그인 → 0.2초 뒤 메인 탭 → 로그아웃 → 로그인 화면

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
  String? userId = 'user-1';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('1단계')),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(userId == null ? '로그아웃됨' : '로그인: $userId'),
            ElevatedButton(
              onPressed: () => setState(() => userId = null),
              child: const Text('로그아웃'),
            ),
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

// ━━━━━━━━━━ 3단계 ━━━━━━━━━━
class AccountNotifierLite extends ChangeNotifier {
  String? userId;

  bool get isLoggedIn => userId != null;

  Future<void> login() async {
    await Future<void>.delayed(const Duration(milliseconds: 200));
    userId = 'user-7';
    notifyListeners();
  }

  void logout() {
    userId = null;
    notifyListeners();
  }
}

class GateListenLite extends StatefulWidget {
  const GateListenLite({super.key});

  @override
  State<GateListenLite> createState() => _GateListenLiteState();
}

class _GateListenLiteState extends State<GateListenLite> {
  final store = AccountNotifierLite();

  @override
  void dispose() {
    store.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('3단계')),
      body: Center(
        child: ListenableBuilder(
          listenable: store,
          builder: (context, child) => Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(store.isLoggedIn ? '메인 탭' : '로그인 화면'),
              ElevatedButton(onPressed: store.login, child: const Text('로그인')),
              TextButton(onPressed: store.logout, child: const Text('로그아웃')),
            ],
          ),
        ),
      ),
    );
  }
}

class Step3Page extends StatelessWidget {
  const Step3Page({super.key});

  @override
  Widget build(BuildContext context) {
    return const GateListenLite();
  }
}
