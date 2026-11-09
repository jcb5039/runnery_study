// 13주차 1일 — Stream과 await for
// 실행 위치: ~/src/runnery-study
// 실행: dart run week13/day01.dart
// 정답은 answers/day01.dart에 있어요.
// 오늘의 강의: week13/README.md의 "1. Stream과 await for — 1일, 3일" 섹션이에요. 그 섹션만 읽고 풀 수 있어요.
// 예제를 실행해 본 뒤 아래로 내려가며 1단계 → 2단계 → 3단계 순서로 풀어요.
// 단계마다 [문제] 바로 아래에 코드를 쓰는 자리(①)와, 필요하면 함수를 만드는 자리(②)가 붙어 있어요.
// 한 단계를 저장·실행해서 예상 출력과 같으면 다음 단계로 넘어가요.

Future<void> main() async {
  // [짧은 실행 예제]
  final example = Stream<int>.fromIterable([1, 2]);
  await for (final value in example) {
    print(value);
  }

  // [한 줄씩 읽기]
  // 1. Stream은 여러 이벤트를 시간에 따라 전달해요.
  // 2. await for는 다음 값이 올 때까지 기다려요.
  // 3. 스트림이 끝나면 반복 다음 줄로 이동해요.
  // [예제 예상 출력]
  // 1
  // 2

  // [단계 문제 실행]
  // 아래 세 줄은 이 파일 아래쪽의 step1, step2, step3 함수를 차례로 호출해요.
  // 각 단계의 문제와 풀 자리는 그 함수 바로 위아래에 있어요.
  await step1();
  await step2();
  await step3();
}

// ━━━━━━━━━━ 1단계: 예제 따라 하기 ━━━━━━━━━━
// [문제] step1 안에서 Stream<String>.fromIterable(['출발', '도착'])을 signs에 담으세요.
//        await for로 각 값을 출력하세요.
// [예상 출력]
// --- 1단계 ---
// 출발
// 도착

Future<void> step1() async {
  print('--- 1단계 ---');
  // TODO ①: 여기에 signs 선언과 await for를 작성하세요.
}

// ━━━━━━━━━━ 2단계: 직접 작성 ━━━━━━━━━━
// [문제] step2 안에서 Stream<int>.fromIterable([2, 4, 6])을 distances에 담으세요.
//        await for로 각 거리를 출력하고 끝난 뒤 '완료'를 출력하세요.
// [예상 출력]
// --- 2단계 ---
// 2
// 4
// 6
// 완료
// [값을 바꾸어 다시 실행] 입력이 빈 목록이면 완료만 출력돼요.

Future<void> step2() async {
  print('--- 2단계 ---');
  // TODO ①: 여기에 distances 선언, await for, 완료 출력을 작성하세요.
}

// ━━━━━━━━━━ 3단계: Runnery 코드 읽기 — GPS 흔들림은 거리에서 빼기 ━━━━━━━━━━
// Runnery는 GPS 위치가 올 때마다 거리를 더해요. 제자리에서 GPS가 흔들려 생긴 아주 짧은 이동은 빼요.
//
//   /// 이보다 짧은 이동은 제자리 GPS 흔들림으로 보고 누적을 미룹니다.
//   static const minSegmentMeters = 3.0;
//
// 읽는 법: 위치가 들어올 때마다 이전 위치와의 거리를 계산하고, 3m보다 짧으면 이번에는 더하지 않아요.
// 바로 아래 [주어진 코드]는 "구간 거리"가 Stream으로 들어온다고 보고 합계를 돌려주는 함수예요.
// [문제]
// (1) 실행 전에 아래 두 값을 [내 예측]에 적으세요.
//       await totalMeters(Stream<double>.fromIterable([12.0, 1.5, 8.0]))
//       await totalMeters(Stream<double>.fromIterable([]))
// (2) step3 안에서 두 값을 각각 출력하고 비교하세요.
// (3) 1.5는 어느 줄에서 빠지나요? 빈 Stream에서는 await for 안이 몇 번 실행되나요?
// [내 예측]
//
// [예상 출력]
// --- 3단계 ---
// 20.0
// 0.0

// [주어진 코드 — 수정하지 말고 읽기만 하세요]
Future<double> totalMeters(Stream<double> segments) async {
  var meters = 0.0;
  await for (final m in segments) {
    if (m < 3.0) continue;
    meters += m;
  }
  return meters;
}

Future<void> step3() async {
  print('--- 3단계 ---');
  // TODO ①: 여기서 두 값을 각각 출력하세요.
}

// [내 말로 설명]
// Future 하나와 Stream 하나가 전달하는 값의 횟수는 어떻게 다른가요?
