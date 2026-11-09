// 8주차 5일 — 기다린 뒤 mounted 확인
// 실행 위치: ~/src/runnery-study/practice_app
// 실행: flutter run -d chrome -t lib/week08/day05.dart
// 처음에는 showPractice = false로 예제를 실행하세요.
// 직접 푼 뒤 true로 바꾸고 저장하세요. 터미널에서 R(대문자)로 다시 시작하세요.
// 다른 날짜를 열 때는 q로 종료하고 그 날짜의 -t 경로로 실행하세요.
// 예제와 문제 작성 공간을 구분했어요. 해설은 answers/day05.dart에 있어요.
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
//
// [직접 풀 문제]
// PracticePage에서 '기록 불러오기 화면' 버튼으로 PracticeLoader를 여세요.
// PracticeLoader는 message = '대기', loading = false로 시작하세요.
// load()는 로딩 표시 → 1초 기다리기 → mounted 확인 → '3km' 표시 순서예요.
// loading 중에는 불러오기 버튼을 비활성화하세요. 뒤로 간 뒤에도 오류가 없어야 해요.
//
// [작성 위치와 호출 위치]
// 입력값은 아래 PracticePage 또는 _PracticePageState의 필드에 선언하세요.
// 새 메서드는 같은 클래스의 build 바깥에 정의하고, build 안 버튼의 onPressed에서 호출하거나 전달하세요.
// build는 화면을 만드는 메서드예요. 직접 반복 호출하지 않고 Flutter가 호출하게 둡니다.
// 화면 구조를 바꾸는 문제는 PracticePage의 build 안 TODO를 작성하세요.
// showPractice가 true이면 main의 MaterialApp이 PracticePage를 화면에 연결해요.
//
// [문제의 예상 결과]
// 불러오기: 대기 → 불러오는 중 → 3km. 기다리는 동안 뒤로 가도 setState 오류 없음.
//
// [입력 / 조작을 바꿔 다시 확인]
// 지연을 3초로 늘리고 화면에서 빠르게 나가 보세요.
//
// [내 말로 설명]
// await 전에 mounted가 true였어도 기다린 뒤 다시 검사해야 하는 이유는 무엇인가요?

import 'package:flutter/material.dart';

bool showPractice = false; // 예제 확인 후 true로 바꾸세요.

void main() {
  runApp(
    MaterialApp(
      home: showPractice ? const PracticePage() : const ExamplePage(),
    ),
  );
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

// [직접 풀 문제 — 작성 공간]
class PracticePage extends StatelessWidget {
  const PracticePage({super.key});
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
