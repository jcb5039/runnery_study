// 9주차 7일 — 복습: 목록과 상세 이동
// 실행 위치: ~/src/runnery-study/practice_app
// 실행: flutter run -d chrome -t lib/week09/day07.dart
// 정답은 answers/day07.dart에 있어요.
// 오늘의 강의: week09/README.md의 "1~4번 섹션 전체" 섹션이에요. 그 섹션만 읽고 풀 수 있어요.
// 처음에는 stage = 0으로 예제를 봐요. 1단계를 풀면 stage = 1로 바꾸고 저장한 뒤 터미널에서 R(대문자)을 눌러요.
// 2단계, 3단계도 stage 숫자만 바꿔 확인해요. 단계마다 [문제] 바로 아래에 그 단계의 화면 클래스가 있어요.
// 다른 날짜를 열 때는 q로 종료하고 그 날짜의 -t 경로로 실행하세요.
//
// [예제 화면 / 관찰할 결과]
// 아래 ExamplePage의 입력값과 버튼 동작을 먼저 확인하세요.
//
// [한 줄씩 읽기]
// 1. main에서 시작해 선택 콜백, 상세 생성자, Text까지 연결해요.

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
      body: Center(child: const Text('선택한 기록의 값이 전달되는 경로를 직접 만드세요.')),
    );
  }
}

// ━━━━━━━━━━ 1단계: 복습 ━━━━━━━━━━
// [문제] Step1Page에 final List<String> items = const [];를 선언하세요.
//        body는 Center(child: Text(items.isEmpty ? '비어 있음' : '${items.length}개'))예요.
// [예상 화면]
// 화면 가운데: 비어 있음

class Step1Page extends StatelessWidget {
  const Step1Page({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO ①: build 위에 items 필드를 선언하고, body를 문제의 Text로 바꾸세요.
    return Scaffold(
      appBar: AppBar(title: const Text('1단계')),
      body: const Center(child: Text('TODO: 1단계 화면을 만드세요.')),
    );
  }
}

// ━━━━━━━━━━ 2단계: 직접 작성 ━━━━━━━━━━
// [문제] Step2Page에 distances = const [3, 5] 필드를 선언하세요.
//        목록이 비어 있으면 '기록 없음', 있으면 각 항목을 ListTile로 표시하세요.
//        누르면 해당 값을 RunDetail에 전달해 push하고 상세 화면의 '목록으로' 버튼은 pop하세요.
//        RunDetail은 required int km 필드와 생성자를 정의하세요.
// [예상 화면]
// 3km, 5km 목록 → 5km 선택 → 상세 5km → 목록으로 → 두 항목 유지
// [조작을 바꿔 다시 확인] 목록을 const <int>[]로 바꾸면 기록 없음이에요.

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

// ━━━━━━━━━━ 3단계: Runnery 코드 읽기 — 로그인 여부로 첫 화면 고르기 ━━━━━━━━━━
// Runnery의 AuthGate(login/login.dart)는 로그인했는지에 따라 다른 화면을 돌려줘요. 일부예요.
//
//   if (_store.isLoggedIn) return const MainTabs();
//   if (_store.needsVerification) return VerifyEmailPage(store: _store);
//   return LoginPageV2(store: _store);
//
// 읽는 법: 화면을 push하지 않고, build가 상황에 맞는 화면 위젯 하나를 골라 돌려줘요.
// 바로 아래 [주어진 코드] AuthGateLite는 loggedIn 값 하나로 두 화면 중 하나를 골라요.
// [문제]
// (1) Step3Page의 build에서 Scaffold 대신 return const AuthGateLite(loggedIn: true); 한 줄만 남기세요.
// (2) 실행 전에 보일 화면을 [내 예측]에 적고 비교하세요.
// (3) loggedIn을 false로 바꾸면 무엇이 보일까요? 바꿔서 확인한 뒤 되돌려요.
// [내 예측]
//
// [예상 화면]
// loggedIn: true → 메인 탭 / false → 로그인 화면

// [주어진 코드 — 수정하지 말고 읽기만 하세요]
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
    // TODO ①: 아래 Scaffold 대신 const AuthGateLite(loggedIn: true)를 반환하세요.
    return Scaffold(
      appBar: AppBar(title: const Text('3단계')),
      body: const Center(child: Text('TODO: 3단계 화면을 만드세요.')),
    );
  }
}

// [내 말로 설명]
// Runnery의 시작 화면에서 로그인 여부에 따른 분기를 찾아 간단히 그려보세요.
