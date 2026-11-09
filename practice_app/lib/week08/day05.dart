// 8주차 5일 — 기다린 뒤 mounted 확인
// 실행 위치: ~/src/runnery-study/practice_app
// 실행: flutter run -d chrome -t lib/week08/day05.dart
// 정답은 answers/day05.dart에 있어요.
// 오늘의 강의: week08/README.md의 "4. 기다린 뒤 mounted 확인하기 — 5일" 섹션이에요. 그 섹션만 읽고 풀 수 있어요.
// 처음에는 stage = 0으로 예제를 봐요. 1단계를 풀면 stage = 1로 바꾸고 저장한 뒤 터미널에서 R(대문자)을 눌러요.
// 2단계, 3단계도 stage 숫자만 바꿔 확인해요. 단계마다 [문제] 바로 아래에 그 단계의 화면 클래스가 있어요.
// 다른 날짜를 열 때는 q로 종료하고 그 날짜의 -t 경로로 실행하세요.
//
// [예제 화면 / 관찰할 결과]
// 불러오기 화면에서 누르면 1초 뒤 2km
//
// [한 줄씩 읽기]
// 1. 버튼에서 비동기 load를 호출해요.
// 2. 기다리는 중에는 버튼의 onPressed가 null이 되어 중복 클릭을 막아요.
// 3. await 중 사용자가 화면을 나가면 State가 제거될 수 있어요.
// 4. mounted가 false이면 setState 전에 return해요.
// 5. setState 콜백 자체를 async로 만들지 않아요. 기다리는 작업은 바깥에서 해요.

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
                builder: (context) => const ExampleLoader(),
              ),
            );
          },
          child: const Text('불러오기 화면'),
        ),
      ),
    );
  }
}

class ExampleLoader extends StatefulWidget {
  const ExampleLoader({super.key});
  @override
  State<ExampleLoader> createState() => _ExampleLoaderState();
}

class _ExampleLoaderState extends State<ExampleLoader> {
  String message = '대기';
  bool loading = false;

  Future<void> load() async {
    setState(() {
      loading = true;
      message = '불러오는 중';
    });
    await Future<void>.delayed(const Duration(milliseconds: 1000));
    if (!mounted) return;
    setState(() {
      loading = false;
      message = '2km';
    });
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
              onPressed: loading ? null : load,
              child: const Text('불러오기'),
            ),
          ],
        ),
      ),
    );
  }
}

// ━━━━━━━━━━ 1단계: 예제 따라 하기 ━━━━━━━━━━
// [문제] _Step1PageState에 String text = '기다리기 전'을 선언하세요.
//        Future<void> wait() async에서 500밀리초를 기다린 뒤 if (!mounted) return; 다음에 setState로 text를 '다 기다림'으로 바꾸세요.
//        body에는 text를 보여주는 Text와 '기다리기' 버튼(onPressed: wait)을 Column으로 놓아요.
// [예상 화면]
// 기다리기 전 → 버튼 누르고 0.5초 뒤 다 기다림

class Step1Page extends StatefulWidget {
  const Step1Page({super.key});

  @override
  State<Step1Page> createState() => _Step1PageState();
}

class _Step1PageState extends State<Step1Page> {
  // TODO ①: text 필드와 wait()를 만들고 body를 Column으로 바꾸세요.

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('1단계')),
      body: const Center(child: Text('TODO: 1단계 화면을 만드세요.')),
    );
  }
}

// ━━━━━━━━━━ 2단계: 직접 작성 ━━━━━━━━━━
// [문제] Step2Page에서 '기록 불러오기 화면' 버튼으로 PracticeLoader를 여세요.
//        PracticeLoader는 message = '대기', loading = false로 시작하세요.
//        load()는 로딩 표시 → 1초 기다리기 → mounted 확인 → '3km' 표시 순서예요.
//        loading 중에는 불러오기 버튼을 비활성화하세요. 뒤로 간 뒤에도 오류가 없어야 해요.
// [예상 화면]
// 불러오기: 대기 → 불러오는 중 → 3km. 기다리는 동안 뒤로 가도 setState 오류 없음.
// [조작을 바꿔 다시 확인] 지연을 3초로 늘리고 화면에서 빠르게 나가 보세요.

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

// ━━━━━━━━━━ 3단계: Runnery 코드 읽기 — 불러온 뒤 화면이 아직 있으면 ━━━━━━━━━━
// Runnery 홈 화면의 _reload예요(home/home_page.dart). 6주차 6일에 Dart로 읽었던 그 함수예요.
//
//   Future<void> _reload() async {
//     final loaded = ... await _store.load();
//     if (mounted) {
//       setState(() {
//         _records = loaded;
//       });
//     }
//   }
//
// 읽는 법: 기다리는 동안 사용자가 화면을 나갔을 수 있어요. 화면이 아직 있을 때(mounted)만 setState해요.
// 바로 아래 [주어진 코드] HomeLoadLite는 initState에서 _reload를 부르고, 0.3초 뒤 기록 두 개를 받아요.
// [문제]
// (1) Step3Page의 build에서 Scaffold 대신 return const HomeLoadLite(); 한 줄만 남기세요.
// (2) 실행 전에 처음 보이는 글자와 0.3초 뒤 글자를 [내 예측]에 적고 비교하세요.
// (3) if (mounted)를 지우면 기다리는 사이 화면을 나갔을 때 무슨 문제가 생길 수 있나요?
// [내 예측]
//
// [예상 화면]
// 처음: 불러오는 중 → 0.3초 뒤: 기록 2개

// [주어진 코드 — 수정하지 말고 읽기만 하세요]
class HomeLoadLite extends StatefulWidget {
  const HomeLoadLite({super.key});

  @override
  State<HomeLoadLite> createState() => _HomeLoadLiteState();
}

class _HomeLoadLiteState extends State<HomeLoadLite> {
  List<double> _records = [];

  @override
  void initState() {
    super.initState();
    _reload();
  }

  Future<List<double>> load() async {
    await Future<void>.delayed(const Duration(milliseconds: 300));
    return [3.0, 5.0];
  }

  Future<void> _reload() async {
    final loaded = await load();
    if (mounted) {
      setState(() {
        _records = loaded;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('3단계')),
      body: Center(
        child: Text(_records.isEmpty ? '불러오는 중' : '기록 ${_records.length}개'),
      ),
    );
  }
}

class Step3Page extends StatelessWidget {
  const Step3Page({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO ①: 아래 Scaffold 대신 const HomeLoadLite()를 반환하세요.
    return Scaffold(
      appBar: AppBar(title: const Text('3단계')),
      body: const Center(child: Text('TODO: 3단계 화면을 만드세요.')),
    );
  }
}

// [내 말로 설명]
// await 전에 mounted가 true였어도 기다린 뒤 다시 검사해야 하는 이유는 무엇인가요?
