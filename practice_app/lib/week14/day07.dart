// 14주차 7일 — 복습: 로그인·로그아웃 상태
// 실행 위치: ~/src/runnery-study/practice_app
// 실행: flutter run -d chrome -t lib/week14/day07.dart
// 정답은 answers/day07.dart에 있어요.
// 오늘의 강의: week14/README.md의 "1~3번 섹션 전체" 섹션이에요. 그 섹션만 읽고 풀 수 있어요.
// 처음에는 stage = 0으로 예제를 봐요. 1단계를 풀면 stage = 1로 바꾸고 저장한 뒤 터미널에서 R(대문자)을 눌러요.
// 2단계, 3단계도 stage 숫자만 바꿔 확인해요. 단계마다 [문제] 바로 아래에 그 단계의 화면 클래스가 있어요.
// 다른 날짜를 열 때는 q로 종료하고 그 날짜의 -t 경로로 실행하세요.
//
// [예제 화면 / 관찰할 결과]
// 아래 ExamplePage의 입력값과 버튼 동작을 먼저 확인하세요.
//
// [한 줄씩 읽기]
// 1. 실제 계정 대신 명시적인 succeed 입력으로 두 결과를 비교해요.

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
      body: Center(child: const Text('성공, 실패, 대기 상태를 직접 연결하세요.')),
    );
  }
}

// ━━━━━━━━━━ 1단계: 복습 ━━━━━━━━━━
// [문제] _Step1PageState에 String? userId = 'user-1'을 두세요. '로그아웃' 버튼은 setState로 null을 넣어요.
//        Text는 userId == null ? '로그아웃됨' : '로그인: $userId'를 보여줘요. 두 위젯을 Column으로 놓아요.
// [예상 화면]
// 로그인: user-1 → 로그아웃 → 로그아웃됨

class Step1Page extends StatefulWidget {
  const Step1Page({super.key});

  @override
  State<Step1Page> createState() => _Step1PageState();
}

class _Step1PageState extends State<Step1Page> {
  // TODO ①: userId 필드를 만들고 body를 Column으로 바꾸세요.

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('1단계')),
      body: const Center(child: Text('TODO: 1단계 화면을 만드세요.')),
    );
  }
}

// ━━━━━━━━━━ 2단계: 직접 작성 ━━━━━━━━━━
// [문제] FakeAccount.login을 정의하고 Step2Page에서 호출하세요. loading과 message를 상태로 두세요.
//        로딩 중에는 로그인과 로그아웃 버튼을 모두 비활성화하세요.
//        로그아웃은 message를 로그아웃으로 바꾸세요. 성공은 로그인: user-1, 실패는 로그인 실패예요.
//        await 뒤의 mounted와 finally의 로딩 해제를 빠뜨리지 마세요.
// [예상 화면]
// 로그아웃 → 로그인 중 → 로그인: user-1 → 로그아웃 버튼 → 로그아웃
// [조작을 바꿔 다시 확인] succeed를 false로 바꾸면 로그인 실패 후 재시도가 가능해야 해요.

class Step2Page extends StatefulWidget {
  const Step2Page({super.key});
  @override
  State<Step2Page> createState() => _Step2PageState();
}

class _Step2PageState extends State<Step2Page> {
  // TODO: 문제의 상태 변수 선언 위치

  // TODO: 버튼 동작과 필요한 생명주기 메서드 정의 위치

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

// ━━━━━━━━━━ 3단계: Runnery 코드 읽기 — 계정 저장소를 듣는 문지기 ━━━━━━━━━━
// Runnery의 AccountStore는 ChangeNotifier라서 로그인·로그아웃하면 알려요. 듣는 화면은 알림마다 다시 골라 그려요.
// 12주차(ChangeNotifier)와 14주차(로그인)를 합친 모양이 바로 아래 [주어진 코드]예요.
//
// 읽는 법: login은 0.2초 기다린 뒤 userId를 넣고 알려요. logout은 바로 null을 넣고 알려요.
//   GateListenLite는 ListenableBuilder로 isLoggedIn을 보고 문구를 골라요.
// [문제]
// (1) Step3Page의 build에서 Scaffold 대신 return const GateListenLite(); 한 줄만 남기세요.
// (2) 실행 전에 '로그인' → 0.3초 뒤 → '로그아웃' 순서의 화면을 [내 예측]에 적고 비교하세요.
// (3) 화면 쪽 코드에 setState가 없는데 화면이 바뀌는 이유는 무엇인가요?
// [내 예측]
//
// [예상 화면]
// 로그인 화면 → 로그인 → 0.2초 뒤 메인 탭 → 로그아웃 → 로그인 화면

// [주어진 코드 — 수정하지 말고 읽기만 하세요]
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
    // TODO ①: 아래 Scaffold 대신 const GateListenLite()를 반환하세요.
    return Scaffold(
      appBar: AppBar(title: const Text('3단계')),
      body: const Center(child: Text('TODO: 3단계 화면을 만드세요.')),
    );
  }
}

// [내 말로 설명]
// Runnery에서 버튼 처리, AccountStore.login, backend, 다음 화면 결정을 각각 찾아보세요.
