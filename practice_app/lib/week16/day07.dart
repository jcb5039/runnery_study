// 16주차 7일 — 최종 복습: 기록 목록 새로고침
// 실행 위치: ~/src/runnery-study/practice_app
// 실행: flutter run -d chrome -t lib/week16/day07.dart
// 처음에는 showPractice = false로 예제를 실행하세요.
// 직접 푼 뒤 true로 바꾸고 저장하세요. 터미널에서 R(대문자)로 다시 시작하세요.
// 다른 날짜를 열 때는 q로 종료하고 그 날짜의 -t 경로로 실행하세요.
// 예제와 문제 작성 공간을 구분했어요. 해설은 answers/day07.dart에 있어요.
//
// [예제 화면 / 관찰할 결과]
// 아래 ExamplePage의 입력값과 버튼 동작을 먼저 확인하세요.
//
// [한 줄씩 읽기]
// 1. 함수 입력과 성공·실패 결과를 먼저 정해요.
// 2. 화면은 대기, 결과, 오류를 구분해 보여줘요.
// 3. 실제 Runnery 코드는 읽기만 하고 흐름을 project-map과 비교해요.
//
// [직접 풀 문제]
// 파일 아래 Future<List<double>> loadRecords({required bool succeed})를 정의하세요.
// 300밀리초 뒤 성공이면 [3.0, 5.0], 실패이면 StateError를 던지세요.
// PracticePage는 records = <double>[], loading = false, message = 기록 없음, succeed = true로 시작하세요.
// 새로고침 버튼은 로딩 표시 → 함수 대기 → mounted 확인 → 목록·문구 갱신 순서로 동작하게 하세요.
// 실패하면 기존 records를 유지하고 읽기 실패를 표시하세요. finally에서 loading을 해제하세요.
// notes.md에 함수 이름과 입력·반환·화면 반영·정리 책임을 적고 예제 없이 설명하세요.
//
// [작성 위치와 호출 위치]
// 입력값은 아래 PracticePage 또는 _PracticePageState의 필드에 선언하세요.
// 새 메서드는 같은 클래스의 build 바깥에 정의하고, build 안 버튼의 onPressed에서 호출하거나 전달하세요.
// build는 화면을 만드는 메서드예요. 직접 반복 호출하지 않고 Flutter가 호출하게 둡니다.
// 화면 구조를 바꾸는 문제는 PracticePage의 build 안 TODO를 작성하세요.
// showPractice가 true이면 main의 MaterialApp이 PracticePage를 화면에 연결해요.
//
// [문제의 예상 결과]
// 새로고침 → 불러오는 중 → 2개 기록, [3.0, 5.0]
//
// [입력 / 조작을 바꿔 다시 확인]
// 반환값 []이면 기록 없음, succeed = false이면 읽기 실패예요. 기다리는 동안 화면을 제거하는 사례도 설명하세요.
//
// [내 말로 설명]
// Runnery의 같은 기능에서 사용자 행동 → 함수 → 데이터 → 화면을 5분 안에 설명할 수 있나요?

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
      body: Center(child: const Text('가짜 목록을 불러오는 한 기능을 끝까지 구현하세요.')),
    );
  }
}

// [직접 풀 문제 — 작성 공간]
class PracticePage extends StatefulWidget {
  const PracticePage({super.key});
  @override
  State<PracticePage> createState() => _PracticePageState();
}

class _PracticePageState extends State<PracticePage> {
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
