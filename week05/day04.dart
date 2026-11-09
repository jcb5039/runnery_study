// 5주차 4일 — getter로 계산한 값 읽기
// 실행 위치: ~/src/runnery-study
// 실행: dart run week05/day04.dart
// 정답은 answers/day04.dart에 있어요.
// 오늘의 강의: week05/README.md의 "3. 메서드와 getter — 3~4일" 섹션이에요. 그 섹션만 읽고 풀 수 있어요.
// 예제를 실행해 본 뒤 아래로 내려가며 1단계 → 2단계 → 3단계 순서로 풀어요.
// 단계마다 [문제] 바로 아래에 코드를 쓰는 자리(①)와, 필요하면 함수를 만드는 자리(②)가 붙어 있어요.
// 한 단계를 저장·실행해서 예상 출력과 같으면 다음 단계로 넘어가요.

void main() {
  // [짧은 실행 예제]
  final example = ExampleRun(2.0);
  print(example.meters);

  // [한 줄씩 읽기]
  // 1. get meters는 getter를 정의해요.
  // 2. 읽을 때 () 없이 .meters로 써요.
  // 3. 값을 읽는 순간 식을 계산해요.
  // [예제 예상 출력]
  // 2000.0

  // [단계 문제 실행]
  // 아래 세 줄은 이 파일 아래쪽의 step1, step2, step3 함수를 차례로 호출해요.
  // 각 단계의 문제와 풀 자리는 그 함수 바로 위아래에 있어요.
  step1();
  step2();
  step3();
}

class ExampleRun {
  final double km;
  ExampleRun(this.km);
  double get meters => km * 1000;
}

// ━━━━━━━━━━ 1단계: 예제 따라 하기 ━━━━━━━━━━
// [문제] Water 클래스를 정의하세요. 필드 final int cups와 생성자 Water(this.cups)를 두세요.
//        int get ml => cups * 200; getter를 만드세요.
//        step1 안에서 Water(3).ml을 출력하세요.
// [예상 출력]
// --- 1단계 ---
// 600

void step1() {
  print('--- 1단계 ---');
  // TODO ①: 여기서 Water(3).ml을 print 안에 넣으세요.
}

// TODO ②: 여기에 Water 클래스를 정의하세요.

// ━━━━━━━━━━ 2단계: 직접 작성 ━━━━━━━━━━
// [문제] 거리(double distanceKm), 시간(int seconds)을 받는 PracticeRun을 정의하세요.
//        double get averageSpeed를 만들고 seconds <= 0이면 0, 아니면 distanceKm / (seconds / 3600)을 반환하세요.
//        step2 안에서 PracticeRun(2.0, 1200).averageSpeed와 PracticeRun(2.0, 0).averageSpeed를 출력하세요.
// [예상 출력]
// --- 2단계 ---
// 6.0
// 0.0
// [값을 바꾸어 다시 실행] PracticeRun(5.0, 1800)은 10.0km/h예요.

void step2() {
  print('--- 2단계 ---');
  // TODO ①: 여기서 두 averageSpeed를 각각 print 안에 넣으세요.
}

// TODO ②: 여기에 PracticeRun 클래스를 정의하세요.

// ━━━━━━━━━━ 3단계: Runnery 코드 읽기 — 페이스 getter ━━━━━━━━━━
// RunningRecord에는 1km에 몇 초 걸렸는지(페이스)를 계산하는 getter가 있어요.
//
//   int get paceSeconds =>
//       distanceKm > 0 ? (_movingSeconds / distanceKm).round() : 0;
//
// 읽는 법: 거리가 0보다 크면 (움직인 초 ÷ 거리)를 반올림하고, 아니면 0이에요.
//   ? :는 10주차에 배워요. 바로 아래 [주어진 코드]는 같은 일을 if와 return으로 쓴 거예요.
// [문제]
// (1) 실행 전에 아래 세 값을 [내 예측]에 적으세요.
//       RecordLite(5.0, 1800).paceSeconds
//       RecordLite(0, 0).paceSeconds
//       RecordLite(4.2, 1500).paceSeconds   (1500 ÷ 4.2 = 357.14...)
// (2) step3 안에서 세 값을 차례로 출력하고 비교하세요.
// (3) paceSeconds 뒤에 ()를 붙이지 않는 이유는 무엇인가요?
// [내 예측]
//
// [예상 출력]
// --- 3단계 ---
// 360
// 0
// 357

// [주어진 코드 — 수정하지 말고 읽기만 하세요]
class RecordLite {
  final double distanceKm;
  final int movingSeconds;
  RecordLite(this.distanceKm, this.movingSeconds);

  int get paceSeconds {
    if (distanceKm <= 0) return 0;
    return (movingSeconds / distanceKm).round();
  }
}

void step3() {
  print('--- 3단계 ---');
  // TODO ①: 여기서 세 paceSeconds를 각각 print 안에 넣으세요.
}

// [내 말로 설명]
// 초를 시간으로 바꾸는 3600은 왜 필요한가요?
