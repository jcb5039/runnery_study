// 5주차 2일 — 생성자와 this
// 실행 위치: ~/src/runnery-study
// 실행: dart run week05/day02.dart
// 정답은 answers/day02.dart에 있어요.
// 오늘의 강의: week05/README.md의 "2. 생성자와 this — 2일, 7일" 섹션이에요. 그 섹션만 읽고 풀 수 있어요.
// 예제를 실행해 본 뒤 아래로 내려가며 1단계 → 2단계 → 3단계 순서로 풀어요.
// 단계마다 [문제] 바로 아래에 코드를 쓰는 자리(①)와, 필요하면 함수를 만드는 자리(②)가 붙어 있어요.
// 한 단계를 저장·실행해서 예상 출력과 같으면 다음 단계로 넘어가요.

void main() {
  // [짧은 실행 예제]
  final example = ExampleRun(2.0);
  print(example.km);

  // [한 줄씩 읽기]
  // 1. 생성자 ExampleRun(this.km)가 입력을 필드에 넣어요.
  // 2. 호출의 2.0이 이 객체의 km가 돼요.
  // 3. final 필드는 생성한 뒤 다시 대입하지 않아요.
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
  final double km;
  ExampleRun(this.km);
}

// ━━━━━━━━━━ 1단계: 예제 따라 하기 ━━━━━━━━━━
// [문제] Shoe 클래스를 정의하세요. 필드는 final String brand, final int size예요.
//        생성자는 Shoe(this.brand, this.size)로 쓰세요.
//        step1 안에서 Shoe('가벼운신발', 270)을 shoe에 담고 brand와 size를 차례로 출력하세요.
// [예상 출력]
// --- 1단계 ---
// 가벼운신발
// 270

void step1() {
  print('--- 1단계 ---');
  // TODO ①: 여기서 Shoe 객체를 만들고 두 필드를 출력하세요.
}

// TODO ②: 여기에 Shoe 클래스를 정의하세요.

// ━━━━━━━━━━ 2단계: 직접 작성 ━━━━━━━━━━
// [문제] PracticeRun을 정의하세요. final double distanceKm, final int seconds를 필드로 두세요.
//        생성자는 PracticeRun(this.distanceKm, this.seconds)로 쓰세요.
//        step2 안에서 PracticeRun(2.0, 1200), PracticeRun(5.0, 1800)을 각각 first, second에 담고 각 거리를 출력하세요.
// [예상 출력]
// --- 2단계 ---
// 2.0
// 5.0
// [값을 바꾸어 다시 실행] 두 번째 객체의 거리만 6.0으로 바꾸면 두 번째 출력만 바뀌어요.

void step2() {
  print('--- 2단계 ---');
  // TODO ①: 여기서 first, second를 만들고 각 거리를 출력하세요.
}

// TODO ②: 여기에 PracticeRun 클래스를 정의하세요.

// ━━━━━━━━━━ 3단계: Runnery 코드 읽기 — 이름 있는 생성자와 기본값 ━━━━━━━━━━
// Runnery의 RunningRecord 생성자 일부예요(record/models/running_record.dart).
//
//   const RunningRecord({
//     required this.id,
//     required this.distanceKm,
//     ...
//     this.memo = '',
//   });
//
// 읽는 법: { } 안이라서 이름으로 받는 생성자예요. required가 붙은 값은 꼭 넣어야 해요.
//   this.memo = ''는 memo를 안 주면 빈 글자('')를 넣는다는 뜻이에요(기본값). const는 지금은 무시해요.
// 바로 아래 [주어진 코드]는 필드 세 개만 남긴 거예요. 원본처럼 필드를 생성자 아래에 적었어요.
// [문제]
// (1) step3 안에서 RecordLite(id: 'r1', distanceKm: 5.0)을 first에,
//     RecordLite(id: 'r2', distanceKm: 3.2, memo: '비 옴')을 second에 담으세요.
// (2) 실행 전에 first.distanceKm, '[${first.memo}]', second.memo의 결과를 [내 예측]에 적으세요.
// (3) 세 값을 차례로 출력하고 비교하세요. memo가 빈 글자인지 보이도록 [ ]로 감싸요.
// (4) RecordLite(distanceKm: 1.0)처럼 id를 빼면 어떤 빨간 줄이 생기는지 잠깐 써 보고 지우세요.
// [내 예측]
//
// [예상 출력]
// --- 3단계 ---
// 5.0
// []
// 비 옴

// [주어진 코드 — 수정하지 말고 읽기만 하세요]
class RecordLite {
  RecordLite({required this.id, required this.distanceKm, this.memo = ''});

  final String id;
  final double distanceKm;
  final String memo;
}

void step3() {
  print('--- 3단계 ---');
  // TODO ①: 여기서 first, second를 만들고 세 값을 출력하세요.
}

// [내 말로 설명]
// this.distanceKm의 this는 어느 객체를 뜻하나요?
