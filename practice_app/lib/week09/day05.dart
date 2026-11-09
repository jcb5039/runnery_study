// 9주차 5일 — pushReplacement로 현재 화면 교체
// 실행 위치: ~/src/runnery-study/practice_app
// 실행: flutter run -d chrome -t lib/week09/day05.dart
// 정답은 answers/day05.dart에 있어요.
// 오늘의 강의: week09/README.md의 "4. 맨 위 화면 바꾸기: pushReplacement — 5일" 섹션이에요. 그 섹션만 읽고 풀 수 있어요.
// 처음에는 stage = 0으로 예제를 봐요. 1단계를 풀면 stage = 1로 바꾸고 저장한 뒤 터미널에서 R(대문자)을 눌러요.
// 2단계, 3단계도 stage 숫자만 바꿔 확인해요. 단계마다 [문제] 바로 아래에 그 단계의 화면 클래스가 있어요.
// 다른 날짜를 열 때는 q로 종료하고 그 날짜의 -t 경로로 실행하세요.
//
// [예제 화면 / 관찰할 결과]
// 시작 완료 → 홈으로 현재 경로 교체
//
// [한 줄씩 읽기]
// 1. push는 기존 화면 위에 새 화면을 쌓아요.
// 2. pushReplacement는 현재 경로를 새 경로로 교체해요.
// 3. 이 예제의 첫 화면을 교체하면 앱 내부 뒤로 가기로 그 화면에 돌아오지 않아요.

import 'package:flutter/material.dart';

int stage = 0; // 0 예제, 1·2·3 단계. 숫자를 바꾸고 저장한 뒤 R을 눌러요.

void main() {
  const pages = <Widget>[ExamplePage(), Step1Page(), Step2Page(), Step3Page()];
  runApp(MaterialApp(home: pages[stage]));
}

// [짧은 실행 예제]
class ExamplePage extends StatelessWidget {
  const ExamplePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('달리기 연습')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute<void>(
                builder: (context) => const ExampleHome(),
              ),
            );
          },
          child: const Text('시작 완료'),
        ),
      ),
    );
  }
}

class ExampleHome extends StatelessWidget {
  const ExampleHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('달리기 연습')),
      body: Center(child: const Text('홈')),
    );
  }
}

// ━━━━━━━━━━ 1단계: 예제 따라 하기 ━━━━━━━━━━
// [문제] Step1Page의 body에 Center로 감싼 '다음' 버튼을 놓고, 누르면 DonePage로 pushReplacement하세요.
//        파일 아래 DonePage는 Scaffold 가운데에 '완료!'를 표시하세요.
// [예상 화면]
// 다음 → 완료! (뒤로 가기 버튼 없음)

class Step1Page extends StatelessWidget {
  const Step1Page({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO ①: body를 다음 버튼으로 바꾸세요.
    return Scaffold(
      appBar: AppBar(title: const Text('1단계')),
      body: const Center(child: Text('TODO: 1단계 화면을 만드세요.')),
    );
  }
}

// TODO ②: 여기에 DonePage 클래스를 정의하세요.

// ━━━━━━━━━━ 2단계: 직접 작성 ━━━━━━━━━━
// [문제] Step2Page에 '안내 완료' 버튼을 만들고 HomePage로 pushReplacement하세요.
//        HomePage는 '러닝 홈'을 표시하세요. HomePage 클래스는 파일 아래에 정의하세요.
// [예상 화면]
// 안내 완료 → 러닝 홈. 이 예제에서는 AppBar에 이전 안내로 가는 뒤로 가기 버튼이 없어요.
// [조작을 바꿔 다시 확인] pushReplacement를 push로 바꾸어 앱 내부 뒤로 가기 차이를 확인한 뒤 되돌리세요.

class Step2Page extends StatelessWidget {
  const Step2Page({super.key});
  // TODO: 문제의 입력 필드나 메서드 정의 위치
  @override
  Widget build(BuildContext context) {
    // TODO: 아래 예제용 안내 화면을 문제에서 요구한 위젯으로 바꾸세요.
    return Scaffold(
      appBar: AppBar(title: const Text('달리기 연습')),
      body: Center(child: const Text('TODO: 여기에 문제 화면을 만드세요.')),
    );
  }
}

// TODO ②: 문제에서 새 클래스를 요구하면 여기에 정의하세요.

// ━━━━━━━━━━ 3단계: Runnery 코드 읽기 — 시작 화면에서 다음 화면으로 교체 ━━━━━━━━━━
// Runnery 시작 화면(app_start.dart)은 준비가 끝나면 다음 화면으로 교체해요. 일부예요.
//
//   Future<void> _openNextPage() async {
//     ...
//     if (!mounted) return;
//     Navigator.of(context).pushReplacement<void, void>(
//       PageRouteBuilder<void>(pageBuilder: ... => const AuthGate(), ...),
//     );
//   }
//
// 읽는 법: 기다린 뒤 화면이 아직 있으면 pushReplacement로 시작 화면을 다음 화면으로 바꿔요.
//   시작 화면은 사라져서 뒤로 가기로 돌아올 수 없어요. PageRouteBuilder는 애니메이션 없는 화면 넘김이에요.
// 바로 아래 [주어진 코드] SplashLite는 0.3초 뒤 MainLite로 교체해요.
// [문제]
// (1) Step3Page의 build에서 Scaffold 대신 return const SplashLite(); 한 줄만 남기세요.
// (2) 실행 전에 처음 화면과 0.3초 뒤 화면을 [내 예측]에 적고 비교하세요.
// (3) push로 바꾸면 메인 탭 화면에 무엇이 새로 생길까요?
// [내 예측]
//
// [예상 화면]
// 처음: 러너리 → 0.3초 뒤: 메인 탭 (뒤로 가기 없음)

// [주어진 코드 — 수정하지 말고 읽기만 하세요]
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
    // TODO ①: 아래 Scaffold 대신 const SplashLite()를 반환하세요.
    return Scaffold(
      appBar: AppBar(title: const Text('3단계')),
      body: const Center(child: Text('TODO: 3단계 화면을 만드세요.')),
    );
  }
}

// [내 말로 설명]
// 로그인 완료 뒤 이전 로그인 화면을 다시 보여줄 필요가 있는지 생각해 보세요.
