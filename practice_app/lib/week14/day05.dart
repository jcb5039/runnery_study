// 14주차 5일 — 성공한 뒤 홈으로 이동
// 실행 위치: ~/src/runnery-study/practice_app
// 실행: flutter run -d chrome -t lib/week14/day05.dart
// 정답은 answers/day05.dart에 있어요.
// 오늘의 강의: week14/README.md의 "3. Flutter 화면에서는 단계마다 화면을 갱신해요 — 3~6일" 섹션이에요. 그 섹션만 읽고 풀 수 있어요.
// 처음에는 stage = 0으로 예제를 봐요. 1단계를 풀면 stage = 1로 바꾸고 저장한 뒤 터미널에서 R(대문자)을 눌러요.
// 2단계, 3단계도 stage 숫자만 바꿔 확인해요. 단계마다 [문제] 바로 아래에 그 단계의 화면 클래스가 있어요.
// 다른 날짜를 열 때는 q로 종료하고 그 날짜의 -t 경로로 실행하세요.
//
// [예제 화면 / 관찰할 결과]
// 성공하면 홈으로 이동하며 ID가 표시돼요.
//
// [한 줄씩 읽기]
// 1. 서비스의 사용자 ID를 기다려 받아요.
// 2. mounted를 확인한 뒤 Navigator를 사용해요.
// 3. pushReplacement로 로그인 화면을 홈으로 바꿔요.
// 4. 홈의 생성자로 사용자 ID를 전달해요.

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
  bool loading = false;
  String message = '로그아웃';
  final bool succeed = true;

  Future<void> login() async {
    setState(() {
      loading = true;
      message = '로그인 중';
    });
    try {
      final id = await account.login(succeed: succeed);
      if (!mounted) return;
      Navigator.of(context).pushReplacement(
        MaterialPageRoute<void>(builder: (context) => ExampleHome(userId: id)),
      );
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

class ExampleHome extends StatelessWidget {
  final String userId;
  const ExampleHome({super.key, required this.userId});
  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: const Text('홈')),
    body: Center(child: Text('환영합니다: $userId')),
  );
}

// ━━━━━━━━━━ 1단계: 예제 따라 하기 ━━━━━━━━━━
// [문제] Step1Page의 body에 Center로 감싼 '시작하기' 버튼을 놓으세요.
//        누르면 Navigator.of(context).pushReplacement로 WelcomePage를 여세요.
//        파일 아래 WelcomePage는 Scaffold 가운데에 '환영해요'를 표시해요.
// [예상 화면]
// 시작하기 → 환영해요 (뒤로 가기 없음)

class Step1Page extends StatelessWidget {
  const Step1Page({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO ①: body를 시작하기 버튼으로 바꾸세요.
    return Scaffold(
      appBar: AppBar(title: const Text('1단계')),
      body: const Center(child: Text('TODO: 1단계 화면을 만드세요.')),
    );
  }
}

// TODO ②: 여기에 WelcomePage 클래스를 정의하세요.

// ━━━━━━━━━━ 2단계: 직접 작성 ━━━━━━━━━━
// [문제] FakeAccount.login, Step2Page의 login(), HomePage(userId)를 각각 정의하세요.
//        성공하면 user-1을 HomePage로 전달해 화면을 교체하세요.
//        실패이면 로그인 화면에 로그인 실패를 표시하고 다시 누를 수 있게 하세요.
//        처음 입력 succeed는 true로 설정하세요.
// [예상 화면]
// 로그인 클릭 → 대기 → 홈에 환영합니다: user-1. 앱 내부 뒤로 가기로 이전 로그인 화면에 돌아가지 않아요.
// [조작을 바꿔 다시 확인] succeed = false이면 이동하지 않고 로그인 실패가 보여야 해요.

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

// ━━━━━━━━━━ 3단계: Runnery 코드 읽기 — 로그인 뒤 어디로 갈지 고르기 ━━━━━━━━━━
// Runnery 로그인 화면의 _next는 로그인에 성공한 뒤, 이메일 인증이 끝났는지에 따라 다른 화면으로 교체해요.
// 바로 아래 [주어진 코드] NextLite는 verified 값으로 두 화면 중 하나를 골라 pushReplacement해요.
// [문제]
// (1) Step3Page의 build에서 Scaffold 대신 return const NextLite(verified: false); 한 줄만 남기세요.
// (2) 실행 전에 '로그인'을 누르고 0.3초 뒤 보일 화면을 [내 예측]에 적고 비교하세요.
// (3) verified를 true로 바꾸면 어디로 가나요? 다음 화면을 정하는 줄은 서비스와 화면 중 어디에 있나요?
// [내 예측]
//
// [예상 화면]
// 로그인 → 0.3초 뒤 이메일 인증 화면 (verified: true면 메인 탭)

// [주어진 코드 — 수정하지 말고 읽기만 하세요]
class NextLite extends StatefulWidget {
  const NextLite({super.key, required this.verified});

  final bool verified;

  @override
  State<NextLite> createState() => _NextLiteState();
}

class _NextLiteState extends State<NextLite> {
  Future<void> _login() async {
    await Future<void>.delayed(const Duration(milliseconds: 200));
    if (!mounted) return;
    _next();
  }

  void _next() {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute<void>(
        builder: (_) => Scaffold(
          body: Center(child: Text(widget.verified ? '메인 탭' : '이메일 인증 화면')),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('3단계')),
      body: Center(
        child: ElevatedButton(onPressed: _login, child: const Text('로그인')),
      ),
    );
  }
}

class Step3Page extends StatelessWidget {
  const Step3Page({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO ①: 아래 Scaffold 대신 const NextLite(verified: false)를 반환하세요.
    return Scaffold(
      appBar: AppBar(title: const Text('3단계')),
      body: const Center(child: Text('TODO: 3단계 화면을 만드세요.')),
    );
  }
}

// [내 말로 설명]
// 서비스 함수가 직접 Navigator를 호출하지 않게 나눈 이유를 말해보세요.
