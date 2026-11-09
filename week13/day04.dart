// 13주차 4일 — 구독 취소하기
// 실행 위치: ~/src/runnery-study
// 실행: dart run week13/day04.dart
// 정답은 answers/day04.dart에 있어요.
// 오늘의 강의: week13/README.md의 "2. listen과 구독 취소 — 2일, 4일" 섹션이에요. 그 섹션만 읽고 풀 수 있어요.
// 예제를 실행해 본 뒤 아래로 내려가며 1단계 → 2단계 → 3단계 순서로 풀어요.
// 단계마다 [문제] 바로 아래에 코드를 쓰는 자리(①)와, 필요하면 함수를 만드는 자리(②)가 붙어 있어요.
// 한 단계를 저장·실행해서 예상 출력과 같으면 다음 단계로 넘어가요.

import 'dart:async';

Future<void> main() async {
  // [짧은 실행 예제]
  final example = Stream<int>.periodic(
    const Duration(milliseconds: 50),
    (index) => index + 1,
  );
  await for (final value in example) {
    print(value);
    if (value == 2) break;
  }
  print('종료');

  // [한 줄씩 읽기]
  // 1. await for의 break는 반복을 끝내고 구독을 취소해요.
  // 2. listen을 쓸 때는 반환된 구독의 cancel()로 직접 취소할 수 있어요.
  // 3. 2단계의 Completer는 취소 완료를 알려주는 도구예요.
  // [예제 예상 출력]
  // 1
  // 2
  // 종료

  // [단계 문제 실행]
  // 아래 세 줄은 이 파일 아래쪽의 step1, step2, step3 함수를 차례로 호출해요.
  // 각 단계의 문제와 풀 자리는 그 함수 바로 위아래에 있어요.
  await step1();
  await step2();
  await step3();
}

// ━━━━━━━━━━ 1단계: 예제 따라 하기 ━━━━━━━━━━
// [문제] step1 안에서 예제와 같은 periodic Stream을 await for로 출력하세요. 값이 3이면 break해요.
//        반복이 끝나면 '멈춤'을 출력하세요.
// [예상 출력]
// --- 1단계 ---
// 1
// 2
// 3
// 멈춤

Future<void> step1() async {
  print('--- 1단계 ---');
  // TODO ①: 여기에 periodic Stream, await for와 break, 멈춤 출력을 작성하세요.
}

// ━━━━━━━━━━ 2단계: 직접 작성 ━━━━━━━━━━
// [문제] step2 안에서 done = Completer<void>()와 late StreamSubscription<int> subscription을 선언하세요.
//        late는 사용 전에 값이 반드시 들어갈 변수에 써요.
//        50밀리초마다 1부터 보내는 periodic Stream을 listen하고 subscription에 담으세요.
//        콜백은 async로 만들고 값을 출력하세요. 값이 2이면 await subscription.cancel() 후 done.complete()를 호출하세요.
//        await done.future 후 '취소 완료'를 출력하세요. 다른 이벤트가 추가로 나오면 안 돼요.
// [예상 출력]
// --- 2단계 ---
// 1
// 2
// 취소 완료
// [값을 바꾸어 다시 실행] 취소 조건을 3으로 바꾸면 1, 2, 3, 취소 완료예요.

Future<void> step2() async {
  print('--- 2단계 ---');
  // TODO ①: 여기에 done, subscription 선언과 listen, 기다리기, 출력을 작성하세요.
}

// ━━━━━━━━━━ 3단계: Runnery 코드 읽기 — 달리기를 끝낼 때 구독 정리 ━━━━━━━━━━
// RunningSession의 _stop이에요(home/running/running_start_page.dart).
//
//   StreamSubscription<Position>? _subscription;
//   ...
//   void _stop() {
//     _subscription?.cancel();
//     _subscription = null;
//     ...
//   }
//
// 읽는 법: 구독은 시작 전에는 없어서 StreamSubscription?(null 가능)이에요.
//   ?.cancel()은 구독이 있을 때만 끊어요. 끊은 뒤 null을 넣어 "지금은 구독 없음"을 표시해요.
// 바로 아래 [주어진 코드]는 위치 대신 50밀리초마다 숫자를 받는 구독이에요.
// [문제]
// (1) step3 안에 아래 순서로 쓰세요.
//       stop();  print(subscription);
//       start();  await Future<void>.delayed(const Duration(milliseconds: 120));
//       stop();  print(subscription);
//       await Future<void>.delayed(const Duration(milliseconds: 120));  print('끝');
// (2) 실행 전에 출력을 [내 예측]에 적고 비교하세요. (컴퓨터가 바쁘면 틱 개수가 하나 다를 수 있어요)
// (3) 처음 stop()은 구독이 없는데 왜 오류가 나지 않나요? 두 번째 stop() 뒤에 틱이 더 나오나요?
// [내 예측]
//
// [예상 출력]
// --- 3단계 ---
// null
// 틱 1
// 틱 2
// null
// 끝

// [주어진 코드 — 수정하지 말고 읽기만 하세요]
StreamSubscription<int>? subscription;

void start() {
  subscription = Stream<int>.periodic(
    const Duration(milliseconds: 50),
    (i) => i + 1,
  ).listen((v) => print('틱 $v'));
}

void stop() {
  subscription?.cancel();
  subscription = null;
}

Future<void> step3() async {
  print('--- 3단계 ---');
  // TODO ①: 여기에 문제 (1)의 코드를 쓰세요.
}

// [내 말로 설명]
// cancel과 화면의 dispose를 연결해야 하는 이유를 말해보세요.
