// 13주차 5일 — Timer
// 실행 위치: ~/src/runnery-study
// 실행: dart run week13/day05.dart
// 정답은 answers/day05.dart에 있어요.
// 오늘의 강의: week13/README.md의 "3. Timer — 5일" 섹션이에요. 그 섹션만 읽고 풀 수 있어요.
// 예제를 실행해 본 뒤 아래로 내려가며 1단계 → 2단계 → 3단계 순서로 풀어요.
// 단계마다 [문제] 바로 아래에 코드를 쓰는 자리(①)와, 필요하면 함수를 만드는 자리(②)가 붙어 있어요.
// 한 단계를 저장·실행해서 예상 출력과 같으면 다음 단계로 넘어가요.

import 'dart:async';

Future<void> main() async {
  // [짧은 실행 예제]
  final done = Completer<void>();
  Timer(const Duration(milliseconds: 50), () {
    print('한 번 실행');
    done.complete();
  });
  await done.future;

  // [한 줄씩 읽기]
  // 1. Timer는 시간이 지나면 콜백을 한 번 실행해요.
  // 2. Timer.periodic은 취소할 때까지 반복해요.
  // 3. Completer는 콜백의 완료를 기다릴 Future를 제공해요.
  // [예제 예상 출력]
  // 한 번 실행

  // [단계 문제 실행]
  // 아래 세 줄은 이 파일 아래쪽의 step1, step2, step3 함수를 차례로 호출해요.
  // 각 단계의 문제와 풀 자리는 그 함수 바로 위아래에 있어요.
  await step1();
  await step2();
  await step3();
}

// ━━━━━━━━━━ 1단계: 예제 따라 하기 ━━━━━━━━━━
// [문제] step1 안에서 예제처럼 done = Completer<void>()를 만들고,
//        100밀리초 뒤 '라면 완성'을 출력하고 done.complete()를 부르는 Timer를 만드세요. 그다음 done.future를 기다려요.
// [예상 출력]
// --- 1단계 ---
// 라면 완성

Future<void> step1() async {
  print('--- 1단계 ---');
  // TODO ①: 여기에 Completer, Timer, 기다리기를 작성하세요.
}

// ━━━━━━━━━━ 2단계: 직접 작성 ━━━━━━━━━━
// [문제] step2 안에서 done = Completer<void>()를 선언하세요.
//        50밀리초 간격 Timer.periodic을 만들고 콜백의 timer.tick을 출력하세요.
//        tick이 3이면 timer.cancel()과 done.complete()를 호출하세요.
//        done.future를 기다린 뒤 '타이머 종료'를 출력하세요.
// [예상 출력]
// --- 2단계 ---
// 1
// 2
// 3
// 타이머 종료
// [값을 바꾸어 다시 실행] 종료 기준을 2로 바꾸면 1, 2, 타이머 종료예요. 시스템이 바쁘면 tick이 건너뛸 수 있어요.

Future<void> step2() async {
  print('--- 2단계 ---');
  // TODO ①: 여기에 Completer, Timer.periodic, 기다리기, 출력을 작성하세요.
}

// ━━━━━━━━━━ 3단계: Runnery 코드 읽기 — 화면을 다시 그리는 타이머 ━━━━━━━━━━
// RunningSession.start와 _stop의 타이머 부분이에요(home/running/running_start_page.dart).
//
//   Timer? _ticker;
//   ...
//   // 초 단위 표시가 건너뛰지 않도록 1초보다 짧게 갱신합니다.
//   _ticker = Timer.periodic(const Duration(milliseconds: 500), (_) {
//     _checkAutoPause();
//     notifyListeners();
//   });
//   ...
//   _ticker?.cancel();
//   _ticker = null;
//
// 읽는 법: 0.5초마다 "화면을 다시 그려"라고 알려요(notifyListeners는 12주차). (_)는 받은 타이머를 안 쓴다는 표시예요.
//   끝낼 때는 4일의 구독처럼 ?.cancel()로 멈추고 null을 넣어요.
// 바로 아래 [주어진 코드]는 다시 그린 횟수(redraws)를 세는 타이머예요. 간격은 50밀리초예요.
// [문제]
// (1) step3 안에 아래 순서로 쓰세요.
//       startTicker();  await Future<void>.delayed(const Duration(milliseconds: 175));
//       stopTicker();  print(redraws);
//       await Future<void>.delayed(const Duration(milliseconds: 100));
//       print(redraws);  print(ticker);
// (2) 실행 전에 출력 세 줄을 [내 예측]에 적고 비교하세요. (컴퓨터가 바쁘면 횟수가 하나 다를 수 있어요)
// (3) stopTicker를 빼먹으면 두 번째 redraws는 어떻게 될까요?
// [내 예측]
//
// [예상 출력]
// --- 3단계 ---
// 3
// 3
// null

// [주어진 코드 — 수정하지 말고 읽기만 하세요]
Timer? ticker;
var redraws = 0;

void startTicker() {
  ticker = Timer.periodic(const Duration(milliseconds: 50), (_) {
    redraws++;
  });
}

void stopTicker() {
  ticker?.cancel();
  ticker = null;
}

Future<void> step3() async {
  print('--- 3단계 ---');
  // TODO ①: 여기에 문제 (1)의 코드를 쓰세요.
}

// [내 말로 설명]
// Timer의 tick을 정확한 GPS 이동 시간으로 단정하면 안 되는 이유는 무엇인가요?
