// 8주차 5일 해설 — 기다린 뒤 mounted 확인
// 실행: flutter run -d chrome -t lib/week08/answers/day05.dart
// 아래 stage 숫자(1·2·3)로 볼 단계를 골라요. 먼저 직접 시도한 뒤 읽고, 닫은 다음 다시 풀어 보세요.
// 1단계 예상 화면: 기다리기 전 → 버튼 누르고 0.5초 뒤 다 기다림
// 2단계 예상 결과:
// 불러오기: 대기 → 불러오는 중 → 3km. 기다리는 동안 뒤로 가도 setState 오류 없음.
// 확인 질문: await 전에 mounted가 true였어도 기다린 뒤 다시 검사해야 하는 이유는 무엇인가요?
// 3단계 예상 화면: 처음: 불러오는 중 → 0.3초 뒤: 기록 2개

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
  String text = '기다리기 전';

  Future<void> wait() async {
    await Future<void>.delayed(const Duration(milliseconds: 500));
    if (!mounted) return;
    setState(() {
      text = '다 기다림';
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
            ElevatedButton(onPressed: wait, child: const Text('기다리기')),
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
              MaterialPageRoute<void>(
                builder: (context) => const PracticeLoader(),
              ),
            );
          },
          child: const Text('기록 불러오기 화면'),
        ),
      ),
    );
  }
}

class PracticeLoader extends StatefulWidget {
  const PracticeLoader({super.key});
  @override
  State<PracticeLoader> createState() => _PracticeLoaderState();
}

class _PracticeLoaderState extends State<PracticeLoader> {
  String message = '대기';
  bool loading = false;

  Future<void> load() async {
    setState(() {
      loading = true;
      message = '불러오는 중';
    });
    await Future<void>.delayed(const Duration(milliseconds: 1000));
    if (!mounted) return;
    setState(() {
      loading = false;
      message = '3km';
    });
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
              onPressed: loading ? null : load,
              child: const Text('불러오기'),
            ),
          ],
        ),
      ),
    );
  }
}

// ━━━━━━━━━━ 3단계 ━━━━━━━━━━
class HomeLoadLite extends StatefulWidget {
  const HomeLoadLite({super.key});

  @override
  State<HomeLoadLite> createState() => _HomeLoadLiteState();
}

class _HomeLoadLiteState extends State<HomeLoadLite> {
  List<double> _records = [];

  @override
  void initState() {
    super.initState();
    _reload();
  }

  Future<List<double>> load() async {
    await Future<void>.delayed(const Duration(milliseconds: 300));
    return [3.0, 5.0];
  }

  Future<void> _reload() async {
    final loaded = await load();
    if (mounted) {
      setState(() {
        _records = loaded;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('3단계')),
      body: Center(
        child: Text(_records.isEmpty ? '불러오는 중' : '기록 ${_records.length}개'),
      ),
    );
  }
}

class Step3Page extends StatelessWidget {
  const Step3Page({super.key});

  @override
  Widget build(BuildContext context) {
    return const HomeLoadLite();
  }
}
