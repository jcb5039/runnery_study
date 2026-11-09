// 3주차 5일 — 이름 있는 매개변수
// 실행 위치: ~/src/runnery-study
// 실행: dart run week03/day05.dart
// 정답은 answers/day05.dart에 있어요.
// 예제를 실행해 본 뒤 아래로 내려가며 1단계 → 2단계 → 3단계 순서로 풀어요.
// 단계마다 [문제] 바로 아래에 호출하는 자리(①)와 함수를 만드는 자리(②)가 붙어 있어요. 위로 다시 올라갈 필요 없어요.
// 한 단계를 저장·실행해서 예상 출력과 같으면 다음 단계로 넘어가요.

void main() {
  // [짧은 실행 예제]
  print(exampleLabel(name: '수진', km: 2));

  // [한 줄씩 읽기]
  // 1. name:과 km:가 어떤 변수에 전달할지 알려줘요.
  // 2. 정의의 중괄호는 이름 있는 매개변수를 묶어요.
  // 3. required가 붙으면 호출할 때 반드시 전달해야 해요.
  // [예제 예상 출력]
  // 수진: 2km

  // [단계 문제 실행]
  // 아래 세 줄은 이 파일 아래쪽의 step1, step2, step3 함수를 차례로 호출해요.
  // 각 단계의 문제와 풀 자리는 그 함수 바로 위아래에 있어요.
  step1();
  step2();
  step3();
}

String exampleLabel({required String name, required int km}) {
  return '$name: ${km}km';
}

// ━━━━━━━━━━ 1단계: 예제 따라 하기 ━━━━━━━━━━
// [문제] String shoeLabel({required String brand, required int size})를 정의하세요.
//        반환 문장은 brand 뒤에 공백, size, mm를 붙인 형태예요.
//        step1 안에서 shoeLabel(brand: '가벼운신발', size: 270)을 출력하세요.
// [예상 출력]
// --- 1단계 ---
// 가벼운신발 270mm

void step1() {
  print('--- 1단계 ---');
  // TODO ①: 여기서 shoeLabel(...) 호출을 print 안에 넣으세요.
}

// TODO ②: 여기에 String shoeLabel({required String brand, required int size})를 정의하세요.

// ━━━━━━━━━━ 2단계: 직접 작성 ━━━━━━━━━━
// [문제] String describeRun({required String name, required int km})를 정의하세요.
//        반환 문장은 이름 뒤에 콜론과 공백, 거리와 km를 붙인 형태예요.
//        step2 안에서 describeRun(name: '민수', km: 3)을 출력하세요.
// [예상 출력]
// --- 2단계 ---
// 민수: 3km
// [값을 바꾸어 다시 실행] describeRun(km: 5, name: '지우')처럼 순서를 바꿔도 지우: 5km예요.

void step2() {
  print('--- 2단계 ---');
  // TODO ①: 여기서 describeRun(...) 호출을 print 안에 넣으세요.
}

// TODO ②: 여기에 String describeRun({required String name, required int km})를 정의하세요.

// ━━━━━━━━━━ 3단계: Runnery 코드 읽고 옮기기 ━━━━━━━━━━
// Runnery가 달린 구간의 칼로리를 계산하는 함수예요(home/running/running_start_page.dart).
//
//   static double segmentCalories({
//     required double weightKg,
//     required double meters,
//     required double metersPerMinute,
//   }) {
//     if (meters <= 0) return 0;
//     final oxygenMlPerKgPerMeter =
//         metersPerMinute < RunningConfig.walkRunThresholdMetersPerMinute
//         ? 0.1
//         : 0.2;
//     return oxygenMlPerKgPerMeter * meters * weightKg / 1000 * 5;
//   }
//
// 읽는 법:
//   - 입력 3개는 모두 required가 붙은 이름 있는 매개변수예요. 오늘 배운 모양과 같아요.
//   - RunningConfig.walkRunThresholdMetersPerMinute의 값은 134.0이에요(1분에 134m).
//   - 그보다 느리면 걷기로 보고 0.1, 아니면 달리기로 보고 0.2를 써요.
// [문제]
// (1) 같은 이름과 같은 입력 3개로 double segmentCalories(...)를 정의하세요. static은 빼요.
//     ? : 대신 이렇게 써도 돼요: var oxygen = 0.2; 다음 줄에 if로 134보다 느리면 oxygen = 0.1;
// (2) 실행 전에 아래 세 호출의 결과를 [내 예측]에 적으세요.
//       segmentCalories(weightKg: 65, meters: 1000, metersPerMinute: 150)
//       segmentCalories(meters: 1000, metersPerMinute: 100, weightKg: 65)
//       segmentCalories(weightKg: 65, meters: 0, metersPerMinute: 150)
// (3) step3 안에서 세 호출을 각각 print 안에 넣어 실행하고 비교하세요.
// (4) 두 번째 호출은 입력 순서가 다른데도 왜 올바르게 계산되나요?
// [내 예측]
//
// [예상 출력]
// --- 3단계 ---
// 65.0
// 32.5
// 0.0

void step3() {
  print('--- 3단계 ---');
  // TODO ①: 여기서 세 호출을 각각 print 안에 넣으세요.
}

// TODO ②: 여기에 double segmentCalories({...})를 정의하세요.

// [내 말로 설명]
// 이름 있는 입력은 순서 대신 무엇으로 연결되나요?
