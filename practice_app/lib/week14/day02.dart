// 14주차 2일 — 서비스 함수에서 가짜 로그인 결과 받기
// 실행 위치: ~/src/runnery-study/practice_app
// 실행: flutter run -d chrome -t lib/week14/day02.dart
// 정답은 answers/day02.dart에 있어요.
// 오늘의 강의: week14/README.md의 "2. 화면과 요청을 나누기: 서비스 클래스 — 2일" 섹션이에요. 그 섹션만 읽고 풀 수 있어요.
// 처음에는 stage = 0으로 예제를 봐요. 1단계를 풀면 stage = 1로 바꾸고 저장한 뒤 터미널에서 R(대문자)을 눌러요.
// 2단계, 3단계도 stage 숫자만 바꿔 확인해요. 단계마다 [문제] 바로 아래에 그 단계의 화면 클래스가 있어요.
// 다른 날짜를 열 때는 q로 종료하고 그 날짜의 -t 경로로 실행하세요.
//
// [예제 화면 / 관찰할 결과]
// 로그인 버튼 클릭 → 300밀리초 뒤 로그인: user-1
//
// [한 줄씩 읽기]
// 1. 화면은 Account 객체의 login을 호출해요.
// 2. 서비스는 기다린 뒤 사용자 ID를 반환해요.
// 3. 화면은 반환값을 문자열로 표시해요.
// 4. UI 위젯 생성과 요청 처리의 역할을 나누어 읽어요.

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
  final account = ExampleAccount();
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

class ExampleAccount {
  Future<String> login({required bool succeed}) async {
    await Future<void>.delayed(const Duration(milliseconds: 300));
    if (!succeed) throw StateError('로그인 실패');
    return 'user-1';
  }
}

// ━━━━━━━━━━ 1단계: 예제 따라 하기 ━━━━━━━━━━
// [문제] 파일 아래 FakeWeatherOne 클래스를 정의하세요. Future<String> fetch() async는 200밀리초 뒤 '맑음'을 돌려줘요.
//        _Step1PageState에 String text = '날씨 모름'을 두고, load()는 await FakeWeatherOne().fetch() 결과로
//        mounted 확인 뒤 setState(text = '날씨: 결과')를 해요. body에는 text와 '불러오기' 버튼을 Column으로 놓아요.
// [예상 화면]
// 날씨 모름 → 불러오기 → 0.2초 뒤 날씨: 맑음

class Step1Page extends StatefulWidget {
  const Step1Page({super.key});

  @override
  State<Step1Page> createState() => _Step1PageState();
}

class _Step1PageState extends State<Step1Page> {
  // TODO ①: text 필드와 load()를 만들고 body를 Column으로 바꾸세요.

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('1단계')),
      body: const Center(child: Text('TODO: 1단계 화면을 만드세요.')),
    );
  }
}

// TODO ②: 여기에 FakeWeatherOne 클래스를 정의하세요.

// ━━━━━━━━━━ 2단계: 직접 작성 ━━━━━━━━━━
// [문제] FakeAccount 클래스에 Future<String> login({required bool succeed})를 정의하세요.
//        300밀리초 뒤 성공이면 user-1, 실패이면 StateError를 던지세요.
//        Step2Page는 succeed = true로 호출하고 loading, message 상태로 대기·성공·실패를 표시하세요.
//        try/catch/finally와 mounted 확인은 예제를 참고해도 돼요.
// [예상 화면]
// 로그아웃 → 로그인 중 → 로그인: user-1
// [조작을 바꿔 다시 확인] 서비스가 반환하는 ID를 user-2로 바꿔 화면까지 전달되는지 보세요.

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

// ━━━━━━━━━━ 3단계: Runnery 코드 읽기 — 서비스가 입력을 검사하고 실패를 던지기 ━━━━━━━━━━
// Runnery의 AccountStore.login은 서버에 묻기 전에 입력을 검사하고, 문제가 있으면 throw해요.
// 화면은 그 실패를 catch해서 문구로 보여줘요. 바로 아래 [주어진 코드]는 그 흐름을 줄인 거예요.
//
// 읽는 법: AccountServiceLite.login은 비밀번호가 6글자보다 짧으면 StateError를 던져요. 아니면 0.2초 뒤 user-7이에요.
//   LoginFormLite는 버튼마다 다른 비밀번호로 login을 부르고, try/catch로 결과 문구를 정해요.
// [문제]
// (1) Step3Page의 build에서 Scaffold 대신 return const LoginFormLite(); 한 줄만 남기세요.
// (2) 실행 전에 '짧은 비밀번호'와 '올바른 비밀번호'를 차례로 누른 뒤 문구를 [내 예측]에 적고 비교하세요.
// (3) 화면을 바꾸는 코드(setState)는 서비스와 화면 중 어디에 있나요?
// [내 예측]
//
// [예상 화면]
// 짧은 비밀번호 → 로그인 실패 / 올바른 비밀번호 → 로그인: user-7

// [주어진 코드 — 수정하지 말고 읽기만 하세요]
class AccountServiceLite {
  Future<String> login(String password) async {
    if (password.length < 6) throw StateError('비밀번호가 짧아요');
    await Future<void>.delayed(const Duration(milliseconds: 200));
    return 'user-7';
  }
}

class LoginFormLite extends StatefulWidget {
  const LoginFormLite({super.key});

  @override
  State<LoginFormLite> createState() => _LoginFormLiteState();
}

class _LoginFormLiteState extends State<LoginFormLite> {
  final service = AccountServiceLite();
  String message = '로그아웃';

  Future<void> login(String password) async {
    try {
      final id = await service.login(password);
      if (!mounted) return;
      setState(() => message = '로그인: $id');
    } catch (error) {
      if (!mounted) return;
      setState(() => message = '로그인 실패');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('3단계')),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(message),
            ElevatedButton(onPressed: () => login('123'), child: const Text('짧은 비밀번호')),
            ElevatedButton(onPressed: () => login('runner77'), child: const Text('올바른 비밀번호')),
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
    // TODO ①: 아래 Scaffold 대신 const LoginFormLite()를 반환하세요.
    return Scaffold(
      appBar: AppBar(title: const Text('3단계')),
      body: const Center(child: Text('TODO: 3단계 화면을 만드세요.')),
    );
  }
}

// [내 말로 설명]
// 버튼 처리와 사용자 ID를 만드는 함수는 각각 어디에 있나요?
