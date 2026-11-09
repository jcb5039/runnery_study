// 6주차 1일 — null과 기본값
// 실행 위치: ~/src/runnery-study
// 실행: dart run week06/day01.dart
// 정답은 answers/day01.dart에 있어요.
// 오늘의 강의: week06/README.md의 "1. null, `?`, `??` — 1일" 섹션이에요. 그 섹션만 읽고 풀 수 있어요.
// 예제를 실행해 본 뒤 아래로 내려가며 1단계 → 2단계 → 3단계 순서로 풀어요.
// 단계마다 [문제] 바로 아래에 코드를 쓰는 자리(①)와, 필요하면 함수를 만드는 자리(②)가 붙어 있어요.
// 한 단계를 저장·실행해서 예상 출력과 같으면 다음 단계로 넘어가요.

void main() {
  // [짧은 실행 예제]
  String? exampleMemo;
  print(exampleMemo);
  print(exampleMemo ?? '메모 없음');

  // [한 줄씩 읽기]
  // 1. String?에는 문자열 또는 null을 담아요. 지역 nullable 변수는 값을 넣기 전 null이에요.
  // 2. null은 값이 없다는 뜻이에요.
  // 3. ?? 오른쪽은 왼쪽이 null일 때만 사용해요.
  // [예제 예상 출력]
  // null
  // 메모 없음

  // [단계 문제 실행]
  // 아래 세 줄은 이 파일 아래쪽의 step1, step2, step3 함수를 차례로 호출해요.
  // 각 단계의 문제와 풀 자리는 그 함수 바로 위아래에 있어요.
  step1();
  step2();
  step3();
}

// ━━━━━━━━━━ 1단계: 예제 따라 하기 ━━━━━━━━━━
// [문제] step1 안에서 int? steps;를 선언하세요(처음 값 없음).
//        steps와 steps ?? 0을 차례로 출력하세요.
// [예상 출력]
// --- 1단계 ---
// null
// 0

void step1() {
  print('--- 1단계 ---');
  // TODO ①: 여기에 steps 선언과 두 줄 출력을 작성하세요.
}

// ━━━━━━━━━━ 2단계: 직접 작성 ━━━━━━━━━━
// [문제] step2 안에서 String? memo = null;을 선언하고 memo ?? '기록만 저장'을 출력하세요.
//        그다음 memo에 '천천히 달림'을 넣고 memo를 출력하세요.
// [예상 출력]
// --- 2단계 ---
// 기록만 저장
// 천천히 달림
// [값을 바꾸어 다시 실행] 처음 값을 ''로 바꾸면 첫 줄은 빈 줄이에요. 빈 문자열은 null이 아니에요.

void step2() {
  print('--- 2단계 ---');
  // TODO ①: 여기에 memo 선언, ?? 출력, 값 넣기, 다시 출력을 작성하세요.
}

// ━━━━━━━━━━ 3단계: Runnery 코드 읽기 — 칼로리 값이 없을 때 ━━━━━━━━━━
// RunningRecord의 칼로리 getter예요(record/models/running_record.dart).
//
//   final double? caloriesKcal;
//   final int calories;
//   double get energyKcal => caloriesKcal ?? calories.toDouble();
//
// 읽는 법: 예전 기록에는 정밀한 소수 칼로리(caloriesKcal)가 없을 수 있어서 double?예요.
//   있으면 그 값을, 없으면(null) 정수 칼로리 calories를 소수로 바꿔(toDouble) 써요.
// 바로 아래 [주어진 코드]는 필드 두 개만 남긴 거예요.
// [문제]
// (1) 실행 전에 아래 두 값을 [내 예측]에 적으세요.
//       RecordLite(caloriesKcal: 312.5, calories: 300).energyKcal
//       RecordLite(calories: 300).energyKcal
// (2) step3 안에서 두 값을 차례로 출력하고 비교하세요.
// (3) 두 번째 객체의 caloriesKcal에는 무엇이 들어 있나요? 왜 그런가요?
// [내 예측]
//
// [예상 출력]
// --- 3단계 ---
// 312.5
// 300.0

// [주어진 코드 — 수정하지 말고 읽기만 하세요]
class RecordLite {
  RecordLite({this.caloriesKcal, required this.calories});

  final double? caloriesKcal;
  final int calories;

  double get energyKcal => caloriesKcal ?? calories.toDouble();
}

void step3() {
  print('--- 3단계 ---');
  // TODO ①: 여기서 두 energyKcal을 각각 print 안에 넣으세요.
}

// [내 말로 설명]
// null과 빈 문자열은 어떻게 다른가요?
