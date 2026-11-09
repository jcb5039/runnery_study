// 4주차 5일 — map 변환과 fold 누적
// 실행 위치: ~/src/runnery-study
// 실행: dart run week04/day05.dart
// 정답은 answers/day05.dart에 있어요.
// 오늘의 강의: week04/README.md의 "4. 바꾸기 map, 하나로 모으기 fold — 5~6일" 섹션이에요. 그 섹션만 읽고 풀 수 있어요.
// 예제를 실행해 본 뒤 아래로 내려가며 1단계 → 2단계 → 3단계 순서로 풀어요.
// 단계마다 [문제] 바로 아래에 코드를 쓰는 자리(①)와, 필요하면 함수를 만드는 자리(②)가 붙어 있어요.
// 한 단계를 저장·실행해서 예상 출력과 같으면 다음 단계로 넘어가요.

void main() {
  // [짧은 실행 예제]
  final examples = [1.0, 2.0];
  print(examples.map((km) => km * 1000).toList());
  print(examples.fold<double>(0.0, (sum, km) => sum + km));

  // [한 줄씩 읽기]
  // 1. map은 각 값을 새 값으로 바꿔요.
  // 2. fold의 0.0은 처음 합계예요.
  // 3. sum은 직전 결과, km는 다음 항목이에요. <double>은 누적 결과 타입이에요.
  // [예제 예상 출력]
  // [1000.0, 2000.0]
  // 3.0

  // [단계 문제 실행]
  // 아래 세 줄은 이 파일 아래쪽의 step1, step2, step3 함수를 차례로 호출해요.
  // 각 단계의 문제와 풀 자리는 그 함수 바로 위아래에 있어요.
  step1();
  step2();
  step3();
}

// ━━━━━━━━━━ 1단계: 예제 따라 하기 ━━━━━━━━━━
// [문제] step1 안에서 minutes = [10, 20]을 선언하세요.
//        map으로 각 값을 초(× 60)로 바꾼 목록을 출력하고, fold<int>로 분의 합계를 출력하세요.
// [예상 출력]
// --- 1단계 ---
// [600, 1200]
// 30

void step1() {
  print('--- 1단계 ---');
  // TODO ①: 여기에 minutes 선언과 map, fold 결과 출력을 작성하세요.
}

// ━━━━━━━━━━ 2단계: 직접 작성 ━━━━━━━━━━
// [문제] step2 안에서 distances = [2.0, 4.0, 6.0]을 선언하세요.
//        map으로 각 거리를 미터로 바꿔 목록을 출력하고, fold<double>로 km 합계를 출력하세요.
// [예상 출력]
// --- 2단계 ---
// [2000.0, 4000.0, 6000.0]
// 12.0
// [값을 바꾸어 다시 실행] <double>[]로 바꾸면 []와 0.0이에요.

void step2() {
  print('--- 2단계 ---');
  // TODO ①: 여기에 distances 선언과 map, fold 결과 출력을 작성하세요.
}

// ━━━━━━━━━━ 3단계: Runnery 코드 읽기 — 오늘 기록 합계 ━━━━━━━━━━
// Runnery 홈 화면(home/home_page.dart)은 오늘 달린 기록들의 합계를 이렇게 구해요.
//
//   final distanceKm = today.fold<double>(0, (sum, r) => sum + r.distanceKm);
//   final movingSeconds = today.fold<int>(0, (sum, r) => sum + r.movingSeconds);
//   final kcal = today.fold<double>(0, (sum, r) => sum + r.energyKcal).round();
//
// 읽는 법: today는 오늘 기록 목록, r은 기록 하나예요. r.distanceKm는 그 기록의 거리예요(5주차 클래스).
//   세 줄 모두 0에서 시작해 기록마다 값을 더해요. 마지막 줄은 다 더한 뒤 .round()로 반올림해요.
// 바로 아래 [주어진 코드]는 기록 대신 값 목록 세 개로 바꾼 거예요.
// [문제]
// (1) 원본 세 줄을 todayKm, todaySeconds, todayKcal 목록에 맞게 옮겨 step3 안에 쓰세요.
//     km는 fold<double>, 초는 fold<int>, kcal은 fold<double> 뒤에 .round()를 붙여요.
// (2) 실행 전에 세 결과를 [내 예측]에 적고, 각각 출력해서 비교하세요.
// (3) fold<int>에서 처음 값 0 대신 100을 넣으면 초 합계는 얼마가 될까요?
// [내 예측]
//
// [예상 출력]
// --- 3단계 ---
// 5.0
// 1860
// 250

// [주어진 코드 — 수정하지 말고 읽기만 하세요]
final todayKm = [3.2, 1.8];
final todaySeconds = [1200, 660];
final todayKcal = [150.4, 99.8];

void step3() {
  print('--- 3단계 ---');
  // TODO ①: 여기서 세 목록의 fold 결과를 차례로 출력하세요.
}

// [내 말로 설명]
// map과 fold의 결과는 각각 목록인가요, 하나의 값인가요?
