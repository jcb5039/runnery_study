// 13주차 2일 — listen으로 구독하기
// 실행 위치: ~/src/runnery-study
// 실행: dart run week13/day02.dart
// 정답은 answers/day02.dart에 있어요.
// 오늘의 강의: week13/README.md의 "2. listen과 구독 취소 — 2일, 4일" 섹션이에요. 그 섹션만 읽고 풀 수 있어요.
// 예제를 실행해 본 뒤 아래로 내려가며 1단계 → 2단계 → 3단계 순서로 풀어요.
// 단계마다 [문제] 바로 아래에 코드를 쓰는 자리(①)와, 필요하면 함수를 만드는 자리(②)가 붙어 있어요.
// 한 단계를 저장·실행해서 예상 출력과 같으면 다음 단계로 넘어가요.

Future<void> main() async {
  // [짧은 실행 예제]
  final subscription = Stream<int>.fromIterable([1, 2]).listen((value) {
    print(value);
  });
  await subscription.asFuture<void>();

  // [한 줄씩 읽기]
  // 1. listen에 전달한 함수는 이벤트가 도착할 때 호출돼요.
  // 2. listen은 구독 객체를 즉시 반환해요.
  // 3. asFuture는 이 예제에서 스트림 종료까지 기다리기 위해 사용해요.
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
// [문제] step1 안에서 Stream<String>.fromIterable(['딩', '동'])에 listen을 연결해 값을 출력하세요.
//        반환된 구독의 asFuture<void>()를 await하세요.
// [예상 출력]
// --- 1단계 ---
// 딩
// 동

Future<void> step1() async {
  print('--- 1단계 ---');
  // TODO ①: 여기에 listen과 asFuture 기다리기를 작성하세요.
}

// ━━━━━━━━━━ 2단계: 직접 작성 ━━━━━━━━━━
// [문제] step2 안에서 Stream<int>.fromIterable([3, 5])에 listen을 연결하세요.
//        콜백은 값을 출력하게 하고 반환된 subscription의 asFuture<void>()를 await하세요.
//        그 뒤 '완료'를 출력하세요. 이번 문제에는 수동 cancel을 넣지 않아요.
// [예상 출력]
// --- 2단계 ---
// 3
// 5
// 완료
// [값을 바꾸어 다시 실행] [7]이면 7, 완료예요.

Future<void> step2() async {
  print('--- 2단계 ---');
  // TODO ①: 여기에 listen, asFuture 기다리기, 완료 출력을 작성하세요.
}

// ━━━━━━━━━━ 3단계: Runnery 코드 읽기 — 위치 Stream 구독 연결 ━━━━━━━━━━
// RunningSession.start에서 GPS 위치 Stream을 구독하는 부분이에요(home/running/running_start_page.dart).
//
//   _subscription =
//       Geolocator.getPositionStream(...).listen(
//         _onPosition,
//         onError: _onError,
//         onDone: () => diagnostics.event('streamClosed'),
//       );
//
// 읽는 법: listen에 이름 없는 함수 대신 함수 이름 _onPosition을 넘겨요. 위치가 올 때마다 그 함수가 불려요.
//   onDone에는 Stream이 끝났을 때 부를 함수를 넘겨요(onError는 이번에는 빼요).
// 바로 아래 [주어진 코드]는 위치 대신 미터 숫자를 받는 두 함수예요.
// [문제]
// (1) step3 안에서 Stream<int>.fromIterable([5, 9])에 listen(onPosition, onDone: onDone)을 연결하세요.
// (2) 그 아래에 await Future<void>.delayed(const Duration(milliseconds: 50)); 로 잠깐 기다리세요.
// (3) 실행 전에 출력 세 줄을 [내 예측]에 적고 비교하세요.
// (4) 우리 코드에는 onPosition(5)처럼 직접 부르는 줄이 없어요. 누가 부르나요?
// [내 예측]
//
// [예상 출력]
// --- 3단계 ---
// 위치: 5m
// 위치: 9m
// 위치 스트림 끝

// [주어진 코드 — 수정하지 말고 읽기만 하세요]
void onPosition(int meters) {
  print('위치: ${meters}m');
}

void onDone() {
  print('위치 스트림 끝');
}

Future<void> step3() async {
  print('--- 3단계 ---');
  // TODO ①: 여기에 listen 연결과 기다리기를 작성하세요.
}

// [내 말로 설명]
// listen 호출 시점과 콜백이 실행되는 시점은 같은가요?
