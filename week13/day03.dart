// 13주차 3일 — 일정 간격으로 오는 값
// 실행 위치: ~/src/runnery-study
// 실행: dart run week13/day03.dart
// 정답은 answers/day03.dart에 있어요.
// 오늘의 강의: week13/README.md의 "1. Stream과 await for — 1일, 3일" 섹션이에요. 그 섹션만 읽고 풀 수 있어요.
// 예제를 실행해 본 뒤 아래로 내려가며 1단계 → 2단계 → 3단계 순서로 풀어요.
// 단계마다 [문제] 바로 아래에 코드를 쓰는 자리(①)와, 필요하면 함수를 만드는 자리(②)가 붙어 있어요.
// 한 단계를 저장·실행해서 예상 출력과 같으면 다음 단계로 넘어가요.

Future<void> main() async {
  // [짧은 실행 예제]
  final example = Stream<int>.periodic(
    const Duration(milliseconds: 50),
    (index) => index + 1,
  ).take(2);
  await for (final value in example) {
    print(value);
  }

  // [한 줄씩 읽기]
  // 1. periodic은 일정 간격으로 index를 전달해요. index는 0부터 시작해요.
  // 2. index + 1이 실제 전달할 값이에요.
  // 3. take(2)는 두 값을 받은 뒤 끝내요.
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
// [문제] step1 안에서 50밀리초마다 index를 그대로 보내는 Stream<int>.periodic을 만들고 take(3)을 붙이세요.
//        await for로 각 값을 출력하세요.
// [예상 출력]
// --- 1단계 ---
// 0
// 1
// 2

Future<void> step1() async {
  print('--- 1단계 ---');
  // TODO ①: 여기에 periodic Stream과 await for를 작성하세요.
}

// ━━━━━━━━━━ 2단계: 직접 작성 ━━━━━━━━━━
// [문제] step2 안에서 50밀리초마다 (index + 1) * 100을 보내는 Stream<int>.periodic을 만드세요.
//        take(3)으로 끝내고 await for로 출력하세요. 값은 가짜 누적 거리(m)예요.
// [예상 출력]
// --- 2단계 ---
// 100
// 200
// 300
// [값을 바꾸어 다시 실행] take(1)로 바꾸면 100만 출력돼요.

Future<void> step2() async {
  print('--- 2단계 ---');
  // TODO ①: 여기에 periodic Stream과 await for를 작성하세요.
}

// ━━━━━━━━━━ 3단계: Runnery 코드 읽기 — 초시계 글자 흘려보내기 ━━━━━━━━━━
// 달리는 중 화면은 일정 간격마다 초시계 글자를 새로 보여줘요(10주차 7일의 clock).
// 바로 아래 [주어진 코드]는 그 흐름을 Stream으로 흉내 낸 거예요. 진짜 1초 대신 20밀리초마다 1초가 지난다고 쳐요.
//
// 읽는 법: periodic이 1, 2, 3, 4를 보내고 take(4)로 끝나요.
//   Stream에도 List처럼 map이 있어요. 오는 값마다 '0:01' 같은 글자로 바꿔서 흘려보내요.
// [문제]
// (1) 실행 전에 await for로 clockTicks()의 값을 출력하면 무엇이 나올지 [내 예측]에 적으세요.
// (2) step3 안에서 await for로 clockTicks()의 각 값을 출력하고 비교하세요.
// (3) take(4)를 지우면 이 Stream은 언제 끝날까요?
// [내 예측]
//
// [예상 출력]
// --- 3단계 ---
// 0:01
// 0:02
// 0:03
// 0:04

// [주어진 코드 — 수정하지 말고 읽기만 하세요]
Stream<String> clockTicks() {
  return Stream<int>.periodic(const Duration(milliseconds: 20), (i) => i + 1)
      .take(4)
      .map((s) => '0:${s.toString().padLeft(2, '0')}');
}

Future<void> step3() async {
  print('--- 3단계 ---');
  // TODO ①: 여기에 clockTicks()를 await for로 출력하는 코드를 쓰세요.
}

// [내 말로 설명]
// take가 없으면 이 스트림은 스스로 끝나나요?
