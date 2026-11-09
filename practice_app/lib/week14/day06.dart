// 14주차 6일 — 요청 중 화면에서 나가기
// 실행 위치: ~/src/runnery-study/practice_app
// 실행: flutter run -d chrome -t lib/week14/day06.dart
// 정답은 answers/day06.dart에 있어요.
// 오늘의 강의: week14/README.md의 "3. Flutter 화면에서는 단계마다 화면을 갱신해요 — 3~6일" 섹션이에요. 그 섹션만 읽고 풀 수 있어요.
// 처음에는 stage = 0으로 예제를 봐요. 1단계를 풀면 stage = 1로 바꾸고 저장한 뒤 터미널에서 R(대문자)을 눌러요.
// 2단계, 3단계도 stage 숫자만 바꿔 확인해요. 단계마다 [문제] 바로 아래에 그 단계의 화면 클래스가 있어요.
// 다른 날짜를 열 때는 q로 종료하고 그 날짜의 -t 경로로 실행하세요.
//
// [예제 화면 / 관찰할 결과]
// 로그인 요청 후 즉시 뒤로 가도 setState 오류 없음
//
// [한 줄씩 읽기]
// 1. 로그인 화면을 push해 뒤로 가기를 할 수 있게 해요.
// 2. 요청 중 뒤로 가면 State가 제거될 수 있어요.
// 3. 성공·실패·finally 모두 mounted를 확인해야 해요.
// 4. mounted는 요청 취소 기능이 아니라 화면 사용 가능 여부예요.

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
            Navigator.of(context).push(
              MaterialPageRoute<void>(
                builder: (context) => const ExampleLogin(),
              ),
            );
          },
          child: const Text('로그인 화면 열기'),
        ),
      ),
    );
  }
}

class ExampleLogin extends StatefulWidget {
  const ExampleLogin({super.key});
  @override
  State<ExampleLogin> createState() => _ExampleLoginState();
}

class _ExampleLoginState extends State<ExampleLogin> {
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
    await Future<void>.delayed(const Duration(milliseconds: 1500));
    if (!succeed) throw StateError('로그인 실패');
    return 'user-1';
  }
}

// ━━━━━━━━━━ 1단계: 예제 따라 하기 ━━━━━━━━━━
// [문제] _Step1PageState에 String text = '확인 전'을 두세요. check()는 setState로 text = 'mounted: $mounted'를 넣어요.
//        body에는 text와 '확인' 버튼을 Column으로 놓아요.
// [예상 화면]
// 확인 전 → 확인 → mounted: true

class Step1Page extends StatefulWidget {
  const Step1Page({super.key});

  @override
  State<Step1Page> createState() => _Step1PageState();
}

class _Step1PageState extends State<Step1Page> {
  // TODO ①: text 필드와 check()를 만들고 body를 Column으로 바꾸세요.

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('1단계')),
      body: const Center(child: Text('TODO: 1단계 화면을 만드세요.')),
    );
  }
}

// ━━━━━━━━━━ 2단계: 직접 작성 ━━━━━━━━━━
// [문제] Step2Page는 LoginPanel을 push하는 버튼을 만드세요.
//        LoginPanel은 FakeAccount.login을 1.5초 기다리고 결과를 표시하게 만드세요.
//        await 뒤, catch, finally에서 mounted를 확인하세요.
//        성공 입력 true와 실패 입력 false를 각각 확인하세요.
// [예상 화면]
// 요청 중 뒤로 가도 제거된 화면에 setState하지 않아요. 화면에 남아 있으면 결과가 표시돼요.
// [조작을 바꿔 다시 확인] 실패 설정에서도 요청 중 뒤로 가기를 해보세요.

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

// ━━━━━━━━━━ 3단계: Runnery 코드 읽기 — 불러오는 동안 빈 화면 보여주기 ━━━━━━━━━━
// Runnery의 AuthGate(login/login.dart)는 계정 정보를 다 읽을 때까지 빈 화면을 보여줘요.
//
//   late final Future<void> _loaded = _store.load()...;
//   Widget build(BuildContext context) => FutureBuilder<void>(
//     future: _loaded,
//     builder: (context, snapshot) {
//       if (snapshot.connectionState != ConnectionState.done) { ... 빈 화면 ... }
//       ...
//
// 읽는 법: FutureBuilder는 Future가 끝났는지 지켜보다가, 상태가 바뀌면 builder를 다시 불러요.
//   _loaded를 late final로 한 번만 만들어서, 다시 그려도 불러오기를 또 시작하지 않아요.
// 바로 아래 [주어진 코드] LoadGateLite는 0.3초 걸리는 불러오기를 기다려요.
// [문제]
// (1) Step3Page의 build에서 Scaffold 대신 return const LoadGateLite(); 한 줄만 남기세요.
// (2) 실행 전에 처음 화면과 0.3초 뒤 화면을 [내 예측]에 적고 비교하세요.
// (3) setState를 쓰지 않았는데 화면이 바뀌는 이유는 무엇인가요?
// [내 예측]
//
// [예상 화면]
// 처음: 불러오는 중 → 0.3초 뒤: 메인 탭

// [주어진 코드 — 수정하지 말고 읽기만 하세요]
class LoadGateLite extends StatefulWidget {
  const LoadGateLite({super.key});

  @override
  State<LoadGateLite> createState() => _LoadGateLiteState();
}

class _LoadGateLiteState extends State<LoadGateLite> {
  late final Future<void> _loaded = Future<void>.delayed(const Duration(milliseconds: 300));

  @override
  Widget build(BuildContext context) => FutureBuilder<void>(
    future: _loaded,
    builder: (context, snapshot) {
      if (snapshot.connectionState != ConnectionState.done) {
        return const Scaffold(body: Center(child: Text('불러오는 중')));
      }
      return const Scaffold(body: Center(child: Text('메인 탭')));
    },
  );
}

class Step3Page extends StatelessWidget {
  const Step3Page({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO ①: 아래 Scaffold 대신 const LoadGateLite()를 반환하세요.
    return Scaffold(
      appBar: AppBar(title: const Text('3단계')),
      body: const Center(child: Text('TODO: 3단계 화면을 만드세요.')),
    );
  }
}

// [내 말로 설명]
// mounted 확인이 실제 네트워크 요청을 멈추는 것은 아닌 이유를 설명하세요.
