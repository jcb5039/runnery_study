// 16주차 7일 — 최종 복습: 기록 목록 새로고침
// 실행 위치: ~/src/runnery-study/practice_app
// 실행: flutter run -d chrome -t lib/week16/day07.dart
// 정답은 answers/day07.dart에 있어요.
// 오늘의 강의: week16/README.md의 "3. 기능 하나를 끝까지 따라가기 — 2~7일(최종 복습)" 섹션이에요. 그 섹션만 읽고 풀 수 있어요.
// 처음에는 stage = 0으로 예제를 봐요. 1단계를 풀면 stage = 1로 바꾸고 저장한 뒤 터미널에서 R(대문자)을 눌러요.
// 2단계, 3단계도 stage 숫자만 바꿔 확인해요. 단계마다 [문제] 바로 아래에 그 단계의 화면 클래스가 있어요.
// 다른 날짜를 열 때는 q로 종료하고 그 날짜의 -t 경로로 실행하세요.
//
// [예제 화면 / 관찰할 결과]
// 아래 ExamplePage의 입력값과 버튼 동작을 먼저 확인하세요.
//
// [한 줄씩 읽기]
// 1. 함수 입력과 성공·실패 결과를 먼저 정해요.
// 2. 화면은 대기, 결과, 오류를 구분해 보여줘요.
// 3. 실제 Runnery 코드는 읽기만 하고 흐름을 project-map과 비교해요.

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
      body: Center(child: const Text('가짜 목록을 불러오는 한 기능을 끝까지 구현하세요.')),
    );
  }
}

// ━━━━━━━━━━ 1단계: 복습 ━━━━━━━━━━
// [문제] _Step1PageState에 List<String> names = []를 두세요. load()는 loadNames()를 기다린 뒤 mounted 확인, setState로 names를 넣어요.
//        파일 아래 Future<List<String>> loadNames() async는 200밀리초 뒤 ['민수', '지우']를 돌려줘요.
//        body에는 Text(names.isEmpty ? '이름 없음' : names.join(', '))와 '불러오기' 버튼을 Column으로 놓아요.
// [예상 화면]
// 이름 없음 → 불러오기 → 0.2초 뒤 민수, 지우

class Step1Page extends StatefulWidget {
  const Step1Page({super.key});

  @override
  State<Step1Page> createState() => _Step1PageState();
}

class _Step1PageState extends State<Step1Page> {
  // TODO ①: names와 load()를 만들고 body를 Column으로 바꾸세요.

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('1단계')),
      body: const Center(child: Text('TODO: 1단계 화면을 만드세요.')),
    );
  }
}

// TODO ②: 여기에 Future<List<String>> loadNames() async를 정의하세요.

// ━━━━━━━━━━ 2단계: 직접 작성 ━━━━━━━━━━
// [문제] 파일 아래 Future<List<double>> loadRecords({required bool succeed})를 정의하세요.
//        300밀리초 뒤 성공이면 [3.0, 5.0], 실패이면 StateError를 던지세요.
//        Step2Page는 records = <double>[], loading = false, message = 기록 없음, succeed = true로 시작하세요.
//        새로고침 버튼은 로딩 표시 → 함수 대기 → mounted 확인 → 목록·문구 갱신 순서로 동작하게 하세요.
//        실패하면 기존 records를 유지하고 읽기 실패를 표시하세요. finally에서 loading을 해제하세요.
//        notes.md에 함수 이름과 입력·반환·화면 반영·정리 책임을 적고 예제 없이 설명하세요.
// [예상 화면]
// 새로고침 → 불러오는 중 → 2개 기록, [3.0, 5.0]
// [조작을 바꿔 다시 확인] 반환값 []이면 기록 없음, succeed = false이면 읽기 실패예요. 기다리는 동안 화면을 제거하는 사례도 설명하세요.

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

// ━━━━━━━━━━ 3단계: Runnery 코드 읽기 — 오늘 기록만 골라 합계 내기 ━━━━━━━━━━
// Runnery 홈 화면은 전체 기록에서 오늘 기록만 골라(_today) 거리 합계를 보여줘요(home/home_page.dart).
//
//   List<RunningRecord> get _today => ... 오늘 날짜인 기록만 ...
//   final distanceKm = today.fold<double>(0, (sum, r) => sum + r.distanceKm);
//
// 읽는 법: 4주차 where, 4·5주차 fold, 10주차 DateTime을 한 번에 써요. 지금까지 배운 것으로 다 읽을 수 있어요.
// 바로 아래 [주어진 코드]는 오늘 날짜(now)를 입력으로 받아, 같은 연·월·일인 기록만 골라요.
// [문제]
// (1) Step3Page의 build에서 Scaffold 대신 아래를 반환하세요.
//       TodayStatsLite(now: DateTime(2026, 11, 9))
// (2) 실행 전에 화면 글자를 [내 예측]에 적고 비교하세요. 세 기록 중 어느 것이 빠지나요?
// (3) now를 DateTime(2026, 11, 8)로 바꾸면 무엇이 보일까요?
// [내 예측]
//
// [예상 화면]
// 오늘 2회 · 8.2km

// [주어진 코드 — 수정하지 말고 읽기만 하세요]
class DayRun {
  const DayRun(this.startedAt, this.distanceKm);

  final DateTime startedAt;
  final double distanceKm;
}

final allRuns = [
  DayRun(DateTime(2026, 11, 9, 7), 5.0),
  DayRun(DateTime(2026, 11, 8, 19), 3.0),
  DayRun(DateTime(2026, 11, 9, 20), 3.2),
];

class TodayStatsLite extends StatelessWidget {
  const TodayStatsLite({super.key, required this.now});

  final DateTime now;

  List<DayRun> get _today => allRuns
      .where((r) =>
          r.startedAt.year == now.year &&
          r.startedAt.month == now.month &&
          r.startedAt.day == now.day)
      .toList();

  @override
  Widget build(BuildContext context) {
    final today = _today;
    final distanceKm = today.fold<double>(0, (sum, r) => sum + r.distanceKm);
    return Scaffold(
      appBar: AppBar(title: const Text('3단계')),
      body: Center(child: Text('오늘 ${today.length}회 · ${distanceKm}km')),
    );
  }
}

class Step3Page extends StatelessWidget {
  const Step3Page({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO ①: 아래 Scaffold 대신 TodayStatsLite(now: DateTime(2026, 11, 9))를 반환하세요.
    return Scaffold(
      appBar: AppBar(title: const Text('3단계')),
      body: const Center(child: Text('TODO: 3단계 화면을 만드세요.')),
    );
  }
}

// [내 말로 설명]
// Runnery의 같은 기능에서 사용자 행동 → 함수 → 데이터 → 화면을 5분 안에 설명할 수 있나요?
