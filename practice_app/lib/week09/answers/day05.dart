// 9주차 5일 해설 — pushReplacement로 현재 화면 교체
// 실행: flutter run -d chrome -t lib/week09/answers/day05.dart
// 아래 stage 숫자(1·2·3)로 볼 단계를 골라요. 먼저 직접 시도한 뒤 읽고, 닫은 다음 다시 풀어 보세요.
// 1단계 예상 화면: 다음 → 완료! (뒤로 가기 버튼 없음)
// 2단계 예상 결과:
// 안내 완료 → 러닝 홈. 이 예제에서는 AppBar에 이전 안내로 가는 뒤로 가기 버튼이 없어요.
// 확인 질문: 로그인 완료 뒤 이전 로그인 화면을 다시 보여줄 필요가 있는지 생각해 보세요.
// 3단계 예상 화면: 처음: 러너리 → 0.3초 뒤: 메인 탭 (뒤로 가기 없음)

import 'package:flutter/material.dart';

int stage = 1; // 1·2·3 중 보고 싶은 단계

void main() {
  const pages = <Widget>[Step1Page(), Step2Page(), Step3Page()];
  runApp(MaterialApp(home: pages[stage - 1]));
}

// ━━━━━━━━━━ 1단계 ━━━━━━━━━━
class Step1Page extends StatelessWidget {
  const Step1Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('1단계')),
      body: Center(
        child: ElevatedButton(
          onPressed: () => Navigator.of(context).pushReplacement(
            MaterialPageRoute<void>(builder: (context) => const DonePage()),
          ),
          child: const Text('다음'),
        ),
      ),
    );
  }
}

class DonePage extends StatelessWidget {
  const DonePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('완료')),
      body: Center(child: Text('완료!')),
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
            Navigator.of(context).pushReplacement(
              MaterialPageRoute<void>(builder: (context) => const HomePage()),
            );
          },
          child: const Text('안내 완료'),
        ),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('달리기 연습')),
      body: Center(child: const Text('러닝 홈')),
    );
  }
}

// ━━━━━━━━━━ 3단계 ━━━━━━━━━━
class SplashLite extends StatefulWidget {
  const SplashLite({super.key});

  @override
  State<SplashLite> createState() => _SplashLiteState();
}

class _SplashLiteState extends State<SplashLite> {
  @override
  void initState() {
    super.initState();
    _openNextPage();
  }

  Future<void> _openNextPage() async {
    await Future<void>.delayed(const Duration(milliseconds: 300));
    if (!mounted) return;
    Navigator.of(context).pushReplacement(
      MaterialPageRoute<void>(builder: (_) => const MainLite()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: Center(child: Text('러너리')));
  }
}

class MainLite extends StatelessWidget {
  const MainLite({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('홈')),
      body: const Center(child: Text('메인 탭')),
    );
  }
}

class Step3Page extends StatelessWidget {
  const Step3Page({super.key});

  @override
  Widget build(BuildContext context) {
    return const SplashLite();
  }
}
