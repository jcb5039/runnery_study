// 4주차 6일 — 조건과 변환을 연결하기
// 실행 위치: ~/src/runnery-study
// 실행: dart run week04/day06.dart
// 정답은 answers/day06.dart에 있어요.
// 오늘의 강의: week04/README.md의 "4. 바꾸기 map, 하나로 모으기 fold — 5~6일" 섹션이에요. 그 섹션만 읽고 풀 수 있어요.
// 예제를 실행해 본 뒤 아래로 내려가며 1단계 → 2단계 → 3단계 순서로 풀어요.
// 단계마다 [문제] 바로 아래에 코드를 쓰는 자리(①)와, 필요하면 함수를 만드는 자리(②)가 붙어 있어요.
// 한 단계를 저장·실행해서 예상 출력과 같으면 다음 단계로 넘어가요.

void main() {
  // [짧은 실행 예제]
  final examples = [1, 2, 3];
  final result = examples.where((n) => n > 1).map((n) => n * 10).toList();
  print(result);

  // [한 줄씩 읽기]
  // 1. where가 2와 3을 남겨요.
  // 2. map이 남은 값을 20과 30으로 바꿔요.
  // 3. toList가 마지막 결과를 목록으로 만들어요.
  // [예제 예상 출력]
  // [20, 30]

  // [단계 문제 실행]
  // 아래 세 줄은 이 파일 아래쪽의 step1, step2, step3 함수를 차례로 호출해요.
  // 각 단계의 문제와 풀 자리는 그 함수 바로 위아래에 있어요.
  step1();
  step2();
  step3();
}

// ━━━━━━━━━━ 1단계: 예제 따라 하기 ━━━━━━━━━━
// [문제] step1 안에서 numbers = [5, 15, 25]를 선언하세요.
//        where로 10보다 큰 값만 남기고, map으로 두 배로 바꾼 뒤 toList() 결과를 출력하세요.
// [예상 출력]
// --- 1단계 ---
// [30, 50]

void step1() {
  print('--- 1단계 ---');
  // TODO ①: 여기에 numbers 선언과 where → map → toList 결과 출력을 작성하세요.
}

// ━━━━━━━━━━ 2단계: 직접 작성 ━━━━━━━━━━
// [문제] List<double> selectedMeters(List<double> distances)를 정의하세요.
//        4km 이상을 남긴 다음 미터로 바꾸어 List로 반환하세요.
//        step2 안에서 selectedMeters([2.0, 4.0, 6.0])를 출력하세요.
// [예상 출력]
// --- 2단계 ---
// [4000.0, 6000.0]
// [값을 바꾸어 다시 실행] 입력이 [1.0, 3.0]이면 []예요.

void step2() {
  print('--- 2단계 ---');
  // TODO ①: 여기서 selectedMeters([2.0, 4.0, 6.0])를 print 안에 넣으세요.
}

// TODO ②: 여기에 List<double> selectedMeters(List<double> distances)를 정의하세요.

// ━━━━━━━━━━ 3단계: Runnery 코드 읽기 — 완주한 구간의 페이스 ━━━━━━━━━━
// Runnery 결과 화면(home/running/running_result_page.dart)은 1km를 다 채운 구간만 골라 페이스를 보여줘요.
//
//   final full = splits.where((s) => s.isFull).toList();
//   final paces = full.map((s) => s.paceSecondsPerKm);
//
// 읽는 법: splits는 1km 구간 목록이에요. 첫 줄은 다 채운 구간(isFull)만 남기고,
//   둘째 줄은 남은 구간을 페이스(1km에 걸린 초)로 바꿔요. where 다음에 map이에요.
// 바로 아래 [주어진 코드]는 구간 대신 초 목록을 써요. 0은 "다 채우지 못한 구간"이라고 정했어요.
// [문제]
// (1) 실행 전에 paceLabels([330, 0, 365])와 paceLabels([0, 0])의 결과를 [내 예측]에 적으세요.
// (2) step3 안에서 두 호출을 각각 print 안에 넣어 실행하고 비교하세요.
// (3) where와 map의 순서를 바꾸면(map 먼저) 0은 어떤 글자가 되어 남을까요?
// [내 예측]
//
// [예상 출력]
// --- 3단계 ---
// [5분, 6분]
// []

// [주어진 코드 — 수정하지 말고 읽기만 하세요]
List<String> paceLabels(List<int> paces) {
  return paces.where((p) => p > 0).map((p) => '${p ~/ 60}분').toList();
}

void step3() {
  print('--- 3단계 ---');
  // TODO ①: 여기서 두 호출을 각각 print 안에 넣으세요.
}

// [내 말로 설명]
// 거르는 기준 4의 단위는 무엇인가요? 변환을 먼저 하면 기준도 바꿔야 하나요?
