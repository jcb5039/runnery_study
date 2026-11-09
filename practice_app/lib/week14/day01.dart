// 14주차 1일 — 사용자 ID와 로그인 상태
// 실행 위치: ~/src/runnery-study/practice_app
// 실행: flutter run -d chrome -t lib/week14/day01.dart
// 정답은 answers/day01.dart에 있어요.
// 오늘의 강의: week14/README.md의 "1. 로그인 상태를 값으로 표현하기 — 1일" 섹션이에요. 그 섹션만 읽고 풀 수 있어요.
// 처음에는 stage = 0으로 예제를 봐요. 1단계를 풀면 stage = 1로 바꾸고 저장한 뒤 터미널에서 R(대문자)을 눌러요.
// 2단계, 3단계도 stage 숫자만 바꿔 확인해요. 단계마다 [문제] 바로 아래에 그 단계의 화면 클래스가 있어요.
// 다른 날짜를 열 때는 q로 종료하고 그 날짜의 -t 경로로 실행하세요.
//
// [예제 화면 / 관찰할 결과]
// 가짜 로그인 클릭 → example-user
//
// [한 줄씩 읽기]
// 1. userId가 null이면 로그인한 사용자가 없는 상태로 표현해요.
// 2. 버튼은 연습용 ID를 상태에 넣어요.
// 3. 실제 서비스의 인증 검증과는 별개의 화면 연습이에요.

import 'package:flutter/material.dart';

int stage = 0; // 0 예제, 1·2·3 단계. 숫자를 바꾸고 저장한 뒤 R을 눌러요.

void main() {
  const pages = <Widget>[ExamplePage(), Step1Page(), Step2Page(), Step3Page()];
  runApp(MaterialApp(home: pages[stage]));
}

// [짧은 실행 예제]
class ExamplePage extends StatefulWidget {
  const ExamplePage({super.key});
  @override
  State<ExamplePage> createState() => _ExamplePageState();
}

class _ExamplePageState extends State<ExamplePage> {
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
                userId = 'example-user';
              }),
              child: const Text('가짜 로그인'),
            ),
          ],
        ),
      ),
    );
  }
}

// ━━━━━━━━━━ 1단계: 예제 따라 하기 ━━━━━━━━━━
// [문제] _Step1PageState에 String? nickname을 선언하세요(처음 값 없음).
//        '이름 정하기' 버튼은 setState로 '번개'를, '지우기' 버튼은 null을 넣어요.
//        Text는 nickname ?? '이름 없음'을 보여줘요. 세 위젯을 Column으로 놓아요.
// [예상 화면]
// 이름 없음 → 이름 정하기 → 번개 → 지우기 → 이름 없음

class Step1Page extends StatefulWidget {
  const Step1Page({super.key});

  @override
  State<Step1Page> createState() => _Step1PageState();
}

class _Step1PageState extends State<Step1Page> {
  // TODO ①: nickname 필드를 만들고 body를 Text와 버튼 두 개가 든 Column으로 바꾸세요.

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('1단계')),
      body: const Center(child: Text('TODO: 1단계 화면을 만드세요.')),
    );
  }
}

// ━━━━━━━━━━ 2단계: 직접 작성 ━━━━━━━━━━
// [문제] Step2Page의 State에 String? userId를 선언하세요.
//        로그인 버튼은 setState로 'user-1'을 넣고, 로그아웃 버튼은 null을 넣으세요.
//        Text는 userId ?? '로그아웃'을 표시하세요.
// [예상 화면]
// 처음 로그아웃 → 로그인 클릭 user-1 → 로그아웃 클릭 로그아웃
// [조작을 바꿔 다시 확인] ID를 user-2로 바꾸면 표시도 바뀌어요.

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

// ━━━━━━━━━━ 3단계: Runnery 코드 읽기 — 로그인했는지 묻는 getter ━━━━━━━━━━
// Runnery의 AuthGate(login/login.dart)는 저장소에 "로그인했나요?"를 물어 화면을 골라요.
//
//   if (_store.isLoggedIn) return const MainTabs();
//   ...
//   return LoginPageV2(store: _store);
//
// 읽는 법: isLoggedIn은 저장소의 getter예요. 바로 아래 [주어진 코드]에서는 userId가 null이 아니면 true예요.
// [문제]
// (1) Step3Page의 build에서 Scaffold 대신 return const GateLite(); 한 줄만 남기세요.
// (2) 실행 전에 처음 화면, '로그인' 누른 뒤, '로그아웃' 누른 뒤를 [내 예측]에 적고 비교하세요.
// (3) isLoggedIn은 따로 저장한 값인가요, userId로 계산하는 값인가요?
// [내 예측]
//
// [예상 화면]
// 로그인 화면 → 로그인 → 메인 탭: user-7 → 로그아웃 → 로그인 화면

// [주어진 코드 — 수정하지 말고 읽기만 하세요]
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
    // TODO ①: 아래 Scaffold 대신 const GateLite()를 반환하세요.
    return Scaffold(
      appBar: AppBar(title: const Text('3단계')),
      body: const Center(child: Text('TODO: 3단계 화면을 만드세요.')),
    );
  }
}

// [내 말로 설명]
// 화면에 ID를 넣는 것과 서버가 인증하는 것은 왜 다른가요?
