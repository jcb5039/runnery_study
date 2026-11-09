// 14주차 3일 — 로딩 중 중복 요청 막기
// 실행 위치: ~/src/runnery-study/practice_app
// 실행: flutter run -d chrome -t lib/week14/day03.dart
// 정답은 answers/day03.dart에 있어요.
// 오늘의 강의: week14/README.md의 "3. Flutter 화면에서는 단계마다 화면을 갱신해요 — 3~6일" 섹션이에요. 그 섹션만 읽고 풀 수 있어요.
// 처음에는 stage = 0으로 예제를 봐요. 1단계를 풀면 stage = 1로 바꾸고 저장한 뒤 터미널에서 R(대문자)을 눌러요.
// 2단계, 3단계도 stage 숫자만 바꿔 확인해요. 단계마다 [문제] 바로 아래에 그 단계의 화면 클래스가 있어요.
// 다른 날짜를 열 때는 q로 종료하고 그 날짜의 -t 경로로 실행하세요.
//
// [예제 화면 / 관찰할 결과]
// 요청 중 버튼이 비활성화돼요.
//
// [한 줄씩 읽기]
// 1. loading은 요청이 진행 중인지 나타내요.
// 2. onPressed가 null이면 버튼을 누를 수 없어요.
// 3. finally에서 성공·실패 모두 loading을 해제해요.
// 4. 기다리는 작업은 setState 콜백 바깥에서 해요.

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
// [문제] _Step1PageState에 bool loading = false를 두세요. work()는 setState로 loading = true → 300밀리초 기다리기
//        → mounted 확인 → setState로 loading = false 순서예요.
//        body에는 Text(loading ? '기다리는 중' : '준비')와 '일하기' 버튼(onPressed: loading ? null : work)을 Column으로 놓아요.
// [예상 화면]
// 준비 → 일하기 누르면 기다리는 중(버튼 꺼짐) → 0.3초 뒤 준비

class Step1Page extends StatefulWidget {
  const Step1Page({super.key});

  @override
  State<Step1Page> createState() => _Step1PageState();
}

class _Step1PageState extends State<Step1Page> {
  // TODO ①: loading 필드와 work()를 만들고 body를 Column으로 바꾸세요.

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('1단계')),
      body: const Center(child: Text('TODO: 1단계 화면을 만드세요.')),
    );
  }
}

// ━━━━━━━━━━ 2단계: 직접 작성 ━━━━━━━━━━
// [문제] FakeAccount.login은 성공 시 user-1을 반환하도록 만들고 지연을 1초로 설정하세요.
//        Step2Page는 로그인 중 문구와 CircularProgressIndicator를 함께 표시하세요.
//        loading일 때 버튼을 비활성화하고 완료 후 다시 활성화하세요. mounted 확인도 넣으세요.
// [예상 화면]
// 클릭 직후 로그인 중 + 진행 표시 + 비활성 버튼 / 1초 뒤 로그인: user-1 + 활성 버튼
// [조작을 바꿔 다시 확인] 빠르게 두 번 눌러도 요청 중에는 두 번째 클릭이 처리되지 않아야 해요.

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

// ━━━━━━━━━━ 3단계: Runnery 코드 읽기 — 버튼 안에서 도는 로딩 표시 ━━━━━━━━━━
// Runnery 로그인 버튼은 요청 중에 글자 대신 작은 로딩 표시를 보여주고, 버튼을 꺼서 두 번 누르지 못하게 해요.
// 바로 아래 [주어진 코드] LoginButtonLite가 그 모양이에요.
//
// 읽는 법: child: loading ? SizedBox(..., CircularProgressIndicator) : Text('로그인')
//   → 요청 중이면 도는 표시, 아니면 글자. onPressed: loading ? null : login → 요청 중이면 버튼 꺼짐.
// [문제]
// (1) Step3Page의 build에서 Scaffold 대신 return const LoginButtonLite(); 한 줄만 남기세요.
// (2) 실행 전에 '로그인'을 누른 직후와 0.5초 뒤 화면을 [내 예측]에 적고 비교하세요.
// (3) 요청 중에 버튼을 여러 번 눌러도 완료 횟수가 1만 느는 이유는 무엇인가요?
// [내 예측]
//
// [예상 화면]
// 완료 0번 + 로그인 버튼 → 누르면 도는 표시(글자 없음) → 0.5초 뒤 완료 1번 + 로그인 버튼

// [주어진 코드 — 수정하지 말고 읽기만 하세요]
class LoginButtonLite extends StatefulWidget {
  const LoginButtonLite({super.key});

  @override
  State<LoginButtonLite> createState() => _LoginButtonLiteState();
}

class _LoginButtonLiteState extends State<LoginButtonLite> {
  bool loading = false;
  int done = 0;

  Future<void> login() async {
    setState(() => loading = true);
    await Future<void>.delayed(const Duration(milliseconds: 400));
    if (!mounted) return;
    setState(() {
      loading = false;
      done++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('3단계')),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('완료 $done번'),
            ElevatedButton(
              onPressed: loading ? null : login,
              child: loading
                  ? const SizedBox(
                      width: 16,
                      height: 16,
                      child: CircularProgressIndicator(strokeWidth: 2),
                    )
                  : const Text('로그인'),
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
    // TODO ①: 아래 Scaffold 대신 const LoginButtonLite()를 반환하세요.
    return Scaffold(
      appBar: AppBar(title: const Text('3단계')),
      body: const Center(child: Text('TODO: 3단계 화면을 만드세요.')),
    );
  }
}

// [내 말로 설명]
// loading을 await 뒤에서야 true로 바꾸면 어떤 문제가 있나요?
