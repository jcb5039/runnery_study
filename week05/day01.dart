// 5주차 1일 — 클래스와 객체
// 실행 위치: ~/src/runnery-study
// 실행: dart run week05/day01.dart
// 정답은 answers/day01.dart에 있어요.
// 오늘의 강의: week05/README.md의 "1. 클래스, 객체, 필드 — 1일" 섹션이에요. 그 섹션만 읽고 풀 수 있어요.
// 예제를 실행해 본 뒤 아래로 내려가며 1단계 → 2단계 → 3단계 순서로 풀어요.
// 단계마다 [문제] 바로 아래에 코드를 쓰는 자리(①)와, 필요하면 함수를 만드는 자리(②)가 붙어 있어요.
// 한 단계를 저장·실행해서 예상 출력과 같으면 다음 단계로 넘어가요.

void main() {
  // [짧은 실행 예제]
  final example = ExampleRun();
  print(example.km);

  // [한 줄씩 읽기]
  // 1. main 아래 class가 객체의 모양을 정해요.
  // 2. ExampleRun()이 객체를 만들어요.
  // 3. .km가 객체 안의 필드를 읽어요.
  // [예제 예상 출력]
  // 2.0

  // [단계 문제 실행]
  // 아래 세 줄은 이 파일 아래쪽의 step1, step2, step3 함수를 차례로 호출해요.
  // 각 단계의 문제와 풀 자리는 그 함수 바로 위아래에 있어요.
  step1();
  step2();
  step3();
}

class ExampleRun {
  double km = 2.0;
}

// ━━━━━━━━━━ 1단계: 예제 따라 하기 ━━━━━━━━━━
// [문제] Shoe 클래스를 정의하고 String brand = '빠른신발' 필드를 넣으세요.
//        step1 안에서 final shoe = Shoe();로 객체를 만들고 shoe.brand를 출력하세요.
// [예상 출력]
// --- 1단계 ---
// 빠른신발

void step1() {
  print('--- 1단계 ---');
  // TODO ①: 여기서 Shoe 객체를 만들고 brand를 출력하세요.
}

// TODO ②: 여기에 Shoe 클래스를 정의하세요.

// ━━━━━━━━━━ 2단계: 직접 작성 ━━━━━━━━━━
// [문제] PracticeRun 클래스를 정의하고 double distanceKm = 3.0 필드를 넣으세요.
//        step2 안에서 final record = PracticeRun();으로 객체를 만들고 거리를 출력하세요.
// [예상 출력]
// --- 2단계 ---
// 3.0
// [값을 바꾸어 다시 실행] 필드 초기값을 5.0으로 바꾸면 5.0이에요.

void step2() {
  print('--- 2단계 ---');
  // TODO ①: 여기서 PracticeRun 객체를 만들고 distanceKm를 출력하세요.
}

// TODO ②: 여기에 PracticeRun 클래스를 정의하세요.

// ━━━━━━━━━━ 3단계: Runnery 코드 읽기 — 장소의 기본값 ━━━━━━━━━━
// Runnery 기록 모델(record/models/running_record.dart)에는 장소를 아직 모를 때 쓰는 기본 문구가 있어요.
//
//   const unknownPlace = '위치 정보 없음';
//   ...
//   this.place = unknownPlace,
//
// 읽는 법: 기록 객체를 만들 때 장소를 따로 안 주면 place 필드에 '위치 정보 없음'이 들어가요.
// 바로 아래 [주어진 코드]는 같은 기본값을 오늘 배운 필드 초기값으로 쓴 클래스예요.
// [문제]
// (1) step3 안에서 PlaceInfo 객체를 두 개 만들어 first, second에 담으세요.
// (2) second.place에만 '한강공원'을 넣으세요.
// (3) 실행 전에 first.place와 second.place가 각각 무엇일지 [내 예측]에 적은 뒤, 차례로 출력해 비교하세요.
// (4) second를 바꿨는데 first는 왜 그대로인가요?
// [내 예측]
//
// [예상 출력]
// --- 3단계 ---
// 위치 정보 없음
// 한강공원

// [주어진 코드 — 수정하지 말고 읽기만 하세요]
class PlaceInfo {
  String place = '위치 정보 없음';
}

void step3() {
  print('--- 3단계 ---');
  // TODO ①: 여기서 first, second를 만들고, second.place를 바꾼 뒤 두 place를 출력하세요.
}

// [내 말로 설명]
// 클래스를 정의한 줄과 객체를 만든 줄을 구분해 보세요.
