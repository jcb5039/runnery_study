// 5주차 7일 — 복습: 두 기록의 평균 속도
// 실행 위치: ~/src/runnery-study
// 실행: dart run week05/day07.dart
// 정답은 answers/day07.dart에 있어요.
// 오늘의 강의: week05/README.md의 "1~4번 섹션 전체(7일은 2. 생성자와 this — 2일, 7일의 7일 부분)" 섹션이에요. 그 섹션만 읽고 풀 수 있어요.
// 예제를 실행해 본 뒤 아래로 내려가며 1단계 → 2단계 → 3단계 순서로 풀어요.
// 단계마다 [문제] 바로 아래에 코드를 쓰는 자리(①)와, 필요하면 함수를 만드는 자리(②)가 붙어 있어요.
// 한 단계를 저장·실행해서 예상 출력과 같으면 다음 단계로 넘어가요.

void main() {
  // [짧은 실행 예제]
  print('객체마다 거리와 시간을 따로 저장해 보세요.');

  // [한 줄씩 읽기]
  // 1. 오늘 예제는 안내만 출력해요.
  // 2. 생성자, 필드, getter를 직접 조합해요.
  // [예제 예상 출력]
  // 객체마다 거리와 시간을 따로 저장해 보세요.

  // [단계 문제 실행]
  // 아래 세 줄은 이 파일 아래쪽의 step1, step2, step3 함수를 차례로 호출해요.
  // 각 단계의 문제와 풀 자리는 그 함수 바로 위아래에 있어요.
  step1();
  step2();
  step3();
}

// ━━━━━━━━━━ 1단계: 복습 ━━━━━━━━━━
// [문제] Shoe 클래스(final String brand, 생성자 Shoe(this.brand))를 정의하세요.
//        step1 안에서 shoes = [Shoe('빠른신발'), Shoe('가벼운신발')]을 만들고 for-in으로 각 brand를 출력하세요.
// [예상 출력]
// --- 1단계 ---
// 빠른신발
// 가벼운신발

void step1() {
  print('--- 1단계 ---');
  // TODO ①: 여기서 shoes 목록을 만들고 for-in으로 brand를 출력하세요.
}

// TODO ②: 여기에 Shoe 클래스를 정의하세요.

// ━━━━━━━━━━ 2단계: 직접 작성 ━━━━━━━━━━
// [문제] PracticeRun 클래스를 정의하고 이름 있는 필수 입력 distanceKm(double), seconds(int)를 받으세요.
//        필드는 final로, averageSpeed getter는 시간이 0 이하이면 0을 반환하도록 만드세요.
//        step2 안에서 거리 2.0/시간 1200, 거리 5.0/시간 1800인 두 객체를 List에 담으세요.
//        for-in으로 각 객체의 averageSpeed를 출력하세요.
// [예상 출력]
// --- 2단계 ---
// 6.0
// 10.0
// [값을 바꾸어 다시 실행] 두 번째 시간만 0으로 바꾸면 6.0, 0.0이에요.

void step2() {
  print('--- 2단계 ---');
  // TODO ①: 여기서 두 객체를 List에 담고 for-in으로 averageSpeed를 출력하세요.
}

// TODO ②: 여기에 PracticeRun 클래스를 정의하세요.

// ━━━━━━━━━━ 3단계: Runnery 코드 읽기 — 객체 목록의 합계 ━━━━━━━━━━
// 4주차 5일에 본 홈 화면 합계를 이제 원본 그대로 읽을 수 있어요(home/home_page.dart).
//
//   final distanceKm = today.fold<double>(0, (sum, r) => sum + r.distanceKm);
//   final movingSeconds = today.fold<int>(0, (sum, r) => sum + r.movingSeconds);
//
// 읽는 법: today는 RunningRecord 객체의 목록이에요. r은 객체 하나라서 r.distanceKm로 그 객체의 필드를 읽어요.
// 바로 아래 [주어진 코드]는 필드 두 개짜리 클래스와 오늘 기록 두 개예요.
// [문제]
// (1) 원본 두 줄을 그대로 step3 안에 쓰고 distanceKm, movingSeconds를 차례로 출력하세요.
// (2) 실행 전에 두 결과를 [내 예측]에 적고 비교하세요.
// (3) 첫 번째 줄의 r에는 무엇이 차례로 들어오나요? 숫자인가요, 객체인가요?
// [내 예측]
//
// [예상 출력]
// --- 3단계 ---
// 5.0
// 1860

// [주어진 코드 — 수정하지 말고 읽기만 하세요]
class RecordLite {
  final double distanceKm;
  final int movingSeconds;
  RecordLite({required this.distanceKm, required this.movingSeconds});
}

final today = [
  RecordLite(distanceKm: 3.2, movingSeconds: 1200),
  RecordLite(distanceKm: 1.8, movingSeconds: 660),
];

void step3() {
  print('--- 3단계 ---');
  // TODO ①: 여기에 원본 두 줄을 쓰고, 두 값을 출력하세요.
}

// [내 말로 설명]
// 같은 getter가 서로 다른 값을 반환하는 이유를 객체의 필드로 설명하세요.
