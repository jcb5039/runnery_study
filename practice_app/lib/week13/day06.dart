// 13주차 6일 — 앱 생명주기와 백그라운드
// 실행 위치: ~/src/runnery-study/practice_app
// 실행: flutter run -d chrome -t lib/week13/day06.dart
// 정답은 answers/day06.dart에 있어요.
// 오늘의 강의: week13/README.md의 "4. 앱 생명주기 — 6일 (Flutter 화면)" 섹션이에요. 그 섹션만 읽고 풀 수 있어요.
// 처음에는 stage = 0으로 예제를 봐요. 1단계를 풀면 stage = 1로 바꾸고 저장한 뒤 터미널에서 R(대문자)을 눌러요.
// 2단계, 3단계도 stage 숫자만 바꿔 확인해요. 단계마다 [문제] 바로 아래에 그 단계의 화면 클래스가 있어요.
// 다른 날짜를 열 때는 q로 종료하고 그 날짜의 -t 경로로 실행하세요.
//
// [예제 화면 / 관찰할 결과]
// 탭 전환 시 inactive 또는 hidden, 복귀 시 resumed 등 실제 전달 상태를 관찰해요.
//
// [한 줄씩 읽기]
// 1. with WidgetsBindingObserver로 앱 상태 알림을 받는 역할을 더해요.
// 2. initState에서 observer를 등록해요.
// 3. didChangeAppLifecycleState가 상태 변화를 받아요.
// 4. resumed는 활성 상호작용, inactive는 포커스 상실 등, hidden은 보이지 않음이에요.
// 5. paused는 모바일에서 백그라운드에 있는 상태예요. 웹에서는 같은 순서로 모두 오지 않아요.
// 6. dispose에서 observer를 제거해요. 위젯의 dispose와 앱의 paused는 다른 사건이에요.

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

class _ExamplePageState extends State<ExamplePage> with WidgetsBindingObserver {
  String status = '상태 변화 대기';
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    debugPrint('앱 상태: ${state.name}');
    if (!mounted) return;
    setState(() {
      status = state.name;
    });
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('달리기 연습')),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [const Text('다른 브라우저 탭으로 이동했다 돌아와 보세요.'), Text(status)],
        ),
      ),
    );
  }
}

// ━━━━━━━━━━ 1단계: 예제 따라 하기 ━━━━━━━━━━
// [문제] _Step1PageState에 with WidgetsBindingObserver를 붙이고 int changes = 0을 두세요.
//        initState에서 WidgetsBinding.instance.addObserver(this), dispose에서 removeObserver(this)를 하세요.
//        didChangeAppLifecycleState에서는 setState로 changes를 1 늘려요. body는 Center(child: Text('변화 $changes번'))예요.
// [예상 화면]
// 처음 변화 0번 → 다른 탭에 갔다 오면 숫자가 늘어요

class Step1Page extends StatefulWidget {
  const Step1Page({super.key});

  @override
  State<Step1Page> createState() => _Step1PageState();
}

class _Step1PageState extends State<Step1Page> {
  // TODO ①: class 줄에 with WidgetsBindingObserver를 붙이고, changes, initState, dispose, didChangeAppLifecycleState를 만드세요.

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('1단계')),
      body: const Center(child: Text('TODO: 1단계 화면을 만드세요.')),
    );
  }
}

// ━━━━━━━━━━ 2단계: 직접 작성 ━━━━━━━━━━
// [문제] Step2Page의 State에 with WidgetsBindingObserver를 붙이세요.
//        status = 상태 변화 대기로 시작하고 initState에서 등록, dispose에서 제거하세요.
//        didChangeAppLifecycleState에서 state.name을 로그와 화면에 표시하세요.
//        화면에는 앱 상태 관찰이라는 고정 문구도 넣으세요.
// [예상 화면]
// 처음: 상태 변화 대기 / 탭 전환·복귀 뒤: 플랫폼이 전달한 상태 이름. 모든 상태나 고정 순서를 보장하지 않아요.
// [조작을 바꿔 다시 확인] 브라우저 다른 탭과 다른 앱으로 각각 이동해 비교하세요. 앱 강제 종료 때 마지막 알림을 반드시 받을 수는 없어요.

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

// ━━━━━━━━━━ 3단계: Runnery 코드 읽기 — 앱으로 돌아오면 다시 불러오기 ━━━━━━━━━━
// Runnery 홈 화면(home/home_page.dart)의 앱 상태 처리예요.
//
//   /// 날짜가 바뀐 뒤 앱으로 돌아와도 오늘 기준으로 다시 계산합니다.
//   @override
//   void didChangeAppLifecycleState(AppLifecycleState state) {
//     if (state == AppLifecycleState.resumed) _reload();
//   }
//
// 읽는 법: 앱 상태 소식은 여러 가지가 오지만, 다시 보이고 입력을 받는 resumed일 때만 _reload를 불러요.
// 바로 아래 [주어진 코드] TodayLite는 _reload가 불린 횟수를 화면에 보여줘요.
// [문제]
// (1) Step3Page의 build에서 Scaffold 대신 return const TodayLite(); 한 줄만 남기세요.
// (2) 실행 전에, 다른 탭으로 갔다가(inactive·hidden 등) 돌아오면(resumed) 숫자가 어떻게 바뀔지 [내 예측]에 적으세요.
// (3) 브라우저 탭을 바꿔 보며 비교하세요. inactive 소식에서는 왜 숫자가 늘지 않나요?
// [내 예측]
//
// [예상 화면]
// 처음 새로고침 0번 → 다른 탭에 갔다 돌아오면 새로고침 1번 (나갈 때는 그대로)

// [주어진 코드 — 수정하지 말고 읽기만 하세요]
class TodayLite extends StatefulWidget {
  const TodayLite({super.key});

  @override
  State<TodayLite> createState() => _TodayLiteState();
}

class _TodayLiteState extends State<TodayLite> with WidgetsBindingObserver {
  int reloads = 0;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) _reload();
  }

  void _reload() {
    setState(() {
      reloads++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('3단계')),
      body: Center(child: Text('새로고침 $reloads번')),
    );
  }
}

class Step3Page extends StatelessWidget {
  const Step3Page({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO ①: 아래 Scaffold 대신 const TodayLite()를 반환하세요.
    return Scaffold(
      appBar: AppBar(title: const Text('3단계')),
      body: const Center(child: Text('TODO: 3단계 화면을 만드세요.')),
    );
  }
}

// [내 말로 설명]
// 앱이 inactive가 되었다고 현재 화면 State가 반드시 dispose되나요?
