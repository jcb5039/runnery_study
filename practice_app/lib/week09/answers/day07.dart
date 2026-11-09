// 9주차 7일 해설 — 복습: 목록과 상세 이동
// 실행: flutter run -d chrome -t lib/week09/answers/day07.dart
// 아래 stage 숫자(1·2·3)로 볼 단계를 골라요. 먼저 직접 시도한 뒤 읽고, 닫은 다음 다시 풀어 보세요.
// 1단계 예상 화면: 화면 가운데: 비어 있음
// 2단계 예상 결과:
// 3km, 5km 목록 → 5km 선택 → 상세 5km → 목록으로 → 두 항목 유지
// 확인 질문: Runnery의 시작 화면에서 로그인 여부에 따른 분기를 찾아 간단히 그려보세요.
// 3단계 예상 화면: loggedIn: true → 메인 탭 / false → 로그인 화면

import 'package:flutter/material.dart';

int stage = 1; // 1·2·3 중 보고 싶은 단계

void main() {
  const pages = <Widget>[Step1Page(), Step2Page(), Step3Page()];
  runApp(MaterialApp(home: pages[stage - 1]));
}

// ━━━━━━━━━━ 1단계 ━━━━━━━━━━
class Step1Page extends StatelessWidget {
  const Step1Page({super.key});

  final List<String> items = const [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('1단계')),
      body: Center(
        child: Text(items.isEmpty ? '비어 있음' : '${items.length}개'),
      ),
    );
  }
}

// ━━━━━━━━━━ 2단계 ━━━━━━━━━━
class Step2Page extends StatelessWidget {
  const Step2Page({super.key});
  final List<int> distances = const [3, 5];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('달리기 연습')),
      body: Center(
        child: distances.isEmpty
            ? const Text('기록 없음')
            : Column(
                mainAxisSize: MainAxisSize.min,
                children: distances
                    .map(
                      (km) => ListTile(
                        title: Text('${km}km'),
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute<void>(
                              builder: (context) => RunDetail(km: km),
                            ),
                          );
                        },
                      ),
                    )
                    .toList(),
              ),
      ),
    );
  }
}

class RunDetail extends StatelessWidget {
  final int km;
  const RunDetail({super.key, required this.km});
  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: const Text('상세')),
    body: Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('${km}km'),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('목록으로'),
          ),
        ],
      ),
    ),
  );
}

// ━━━━━━━━━━ 3단계 ━━━━━━━━━━
class AuthGateLite extends StatelessWidget {
  const AuthGateLite({super.key, required this.loggedIn});

  final bool loggedIn;

  @override
  Widget build(BuildContext context) {
    if (loggedIn) {
      return const Scaffold(body: Center(child: Text('메인 탭')));
    }
    return const Scaffold(body: Center(child: Text('로그인 화면')));
  }
}

class Step3Page extends StatelessWidget {
  const Step3Page({super.key});

  @override
  Widget build(BuildContext context) {
    return const AuthGateLite(loggedIn: true);
  }
}
