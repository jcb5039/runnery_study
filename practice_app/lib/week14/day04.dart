// 14주차 4일 — 로그인 실패를 화면에 표시
// 실행 위치: ~/src/runnery-study/practice_app
// 실행: flutter run -d chrome -t lib/week14/day04.dart
// 정답은 answers/day04.dart에 있어요.
// 오늘의 강의: week14/README.md의 "3. Flutter 화면에서는 단계마다 화면을 갱신해요 — 3~6일" 섹션이에요. 그 섹션만 읽고 풀 수 있어요.
// 처음에는 stage = 0으로 예제를 봐요. 1단계를 풀면 stage = 1로 바꾸고 저장한 뒤 터미널에서 R(대문자)을 눌러요.
// 2단계, 3단계도 stage 숫자만 바꿔 확인해요. 단계마다 [문제] 바로 아래에 그 단계의 화면 클래스가 있어요.
// 다른 날짜를 열 때는 q로 종료하고 그 날짜의 -t 경로로 실행하세요.
//
// [예제 화면 / 관찰할 결과]
// 300밀리초 뒤 로그인 실패
//
// [한 줄씩 읽기]
// 1. succeed가 false이면 서비스가 throw해요.
// 2. catch는 화면에 실패를 표시해요.
// 3. finally가 loading을 해제해서 재시도할 수 있어요.

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
  final bool succeed = false;
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
// [문제] _Step1PageState에 String text = '대기'를 두세요. tryLoad()는 try 안에서 failLater()를 기다리고,
//        catch에서 mounted 확인 뒤 setState(text = '실패했어요')를 해요.
//        파일 아래 Future<void> failLater() async는 100밀리초 뒤 StateError('끊김')을 던져요.
//        body에는 text와 '시도' 버튼을 Column으로 놓아요.
// [예상 화면]
// 대기 → 시도 → 0.1초 뒤 실패했어요

class Step1Page extends StatefulWidget {
  const Step1Page({super.key});

  @override
  State<Step1Page> createState() => _Step1PageState();
}

class _Step1PageState extends State<Step1Page> {
  // TODO ①: text 필드와 tryLoad()를 만들고 body를 Column으로 바꾸세요.

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('1단계')),
      body: const Center(child: Text('TODO: 1단계 화면을 만드세요.')),
    );
  }
}

// TODO ②: 여기에 Future<void> failLater() async를 정의하세요.

// ━━━━━━━━━━ 2단계: 직접 작성 ━━━━━━━━━━
// [문제] FakeAccount를 정의하고 Step2Page의 succeed = false로 호출하세요.
//        처음 로그아웃, 요청 중 로그인 중, 실패 뒤 로그인 실패를 표시하세요.
//        finally에서 버튼을 다시 활성화하고 mounted가 false이면 화면 갱신을 건너뛰세요.
// [예상 화면]
// 로그인 중 → 로그인 실패, 버튼을 다시 누를 수 있어요.
// [조작을 바꿔 다시 확인] succeed를 true로 바꾸고 R로 재시작하면 로그인: user-1이에요.

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

// ━━━━━━━━━━ 3단계: Runnery 코드 읽기 — 실패 이유를 사람 말로 바꾸기 ━━━━━━━━━━
// Runnery 로그인은 서버가 주는 실패 코드(예: wrong-password)를 한국어 문구로 바꿔 보여줘요.
// 바로 아래 [주어진 코드]의 loginMessage가 그 역할이에요. 코드마다 if로 문구를 골라요.
// [문제]
// (1) Step3Page의 build에서 Scaffold 대신 return const LoginErrorLite(); 한 줄만 남기세요.
// (2) 실행 전에 세 버튼을 차례로 누를 때 보일 문구를 [내 예측]에 적고 비교하세요.
// (3) 서버가 'too-many-requests'처럼 처음 보는 코드를 주면 어떤 문구가 보이나요?
// [내 예측]
//
// [예상 화면]
// 비밀번호 틀림 → 비밀번호가 달라요 / 없는 계정 → 가입하지 않은 이메일이에요 / 기타 → 로그인하지 못했어요

// [주어진 코드 — 수정하지 말고 읽기만 하세요]
String loginMessage(String code) {
  if (code == 'wrong-password') return '비밀번호가 달라요';
  if (code == 'user-not-found') return '가입하지 않은 이메일이에요';
  return '로그인하지 못했어요';
}

class LoginErrorLite extends StatefulWidget {
  const LoginErrorLite({super.key});

  @override
  State<LoginErrorLite> createState() => _LoginErrorLiteState();
}

class _LoginErrorLiteState extends State<LoginErrorLite> {
  String message = '';

  void fail(String code) {
    setState(() => message = loginMessage(code));
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
            ElevatedButton(onPressed: () => fail('wrong-password'), child: const Text('비밀번호 틀림')),
            ElevatedButton(onPressed: () => fail('user-not-found'), child: const Text('없는 계정')),
            ElevatedButton(onPressed: () => fail('network'), child: const Text('기타')),
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
    // TODO ①: 아래 Scaffold 대신 const LoginErrorLite()를 반환하세요.
    return Scaffold(
      appBar: AppBar(title: const Text('3단계')),
      body: const Center(child: Text('TODO: 3단계 화면을 만드세요.')),
    );
  }
}

// [내 말로 설명]
// 실패했는데 성공 화면으로 이동하지 않도록 어느 분기에서 구분하나요?
