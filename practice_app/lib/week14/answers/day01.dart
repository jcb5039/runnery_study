// 14주차 1일 해설 — 사용자 ID와 로그인 상태
// 실행: flutter run -d chrome -t lib/week14/answers/day01.dart
// 아래 stage 숫자(1·2·3)로 볼 단계를 골라요. 먼저 직접 시도한 뒤 읽고, 닫은 다음 다시 풀어 보세요.
// 1단계 예상 화면: 이름 없음 → 이름 정하기 → 번개 → 지우기 → 이름 없음
// 2단계 예상 결과:
// 처음 로그아웃 → 로그인 클릭 user-1 → 로그아웃 클릭 로그아웃
// 확인 질문: 화면에 ID를 넣는 것과 서버가 인증하는 것은 왜 다른가요?
// 3단계 예상 화면: 로그인 화면 → 로그인 → 메인 탭: user-7 → 로그아웃 → 로그인 화면

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
  String? nickname;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('1단계')),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(nickname ?? '이름 없음'),
            ElevatedButton(
              onPressed: () => setState(() => nickname = '번개'),
              child: const Text('이름 정하기'),
            ),
            TextButton(
              onPressed: () => setState(() => nickname = null),
              child: const Text('지우기'),
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
  String? userId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('달리기 연습')),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(userId ?? '로그아웃'),
            ElevatedButton(
              onPressed: () => setState(() {
                userId = 'user-1';
              }),
              child: const Text('로그인'),
            ),
            TextButton(
              onPressed: () => setState(() {
                userId = null;
              }),
              child: const Text('로그아웃'),
            ),
          ],
        ),
      ),
    );
  }
}

// ━━━━━━━━━━ 3단계 ━━━━━━━━━━
class AccountLite {
  String? userId;

  bool get isLoggedIn => userId != null;
}

class GateLite extends StatefulWidget {
  const GateLite({super.key});

  @override
  State<GateLite> createState() => _GateLiteState();
}

class _GateLiteState extends State<GateLite> {
  final account = AccountLite();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('3단계')),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(account.isLoggedIn ? '메인 탭: ${account.userId}' : '로그인 화면'),
            ElevatedButton(
              onPressed: () => setState(() => account.userId = 'user-7'),
              child: const Text('로그인'),
            ),
            TextButton(
              onPressed: () => setState(() => account.userId = null),
              child: const Text('로그아웃'),
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
    return const GateLite();
  }
}
