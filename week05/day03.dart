// 5주차 3일 — 객체 안의 함수: 메서드
// 실행 위치: ~/src/runnery-study
// 실행: dart run week05/day03.dart
// 정답은 answers/day03.dart에 있어요.
// 오늘의 강의: week05/README.md의 "3. 메서드와 getter — 3~4일" 섹션이에요. 그 섹션만 읽고 풀 수 있어요.
// 예제를 실행해 본 뒤 아래로 내려가며 1단계 → 2단계 → 3단계 순서로 풀어요.
// 단계마다 [문제] 바로 아래에 코드를 쓰는 자리(①)와, 필요하면 함수를 만드는 자리(②)가 붙어 있어요.
// 한 단계를 저장·실행해서 예상 출력과 같으면 다음 단계로 넘어가요.

void main() {
  // [짧은 실행 예제]
  final example = ExampleRun(2.0);
  print(example.meters());

  // [한 줄씩 읽기]
  // 1. 객체를 만들며 km를 저장해요.
  // 2. example.meters()가 이 객체의 메서드를 호출해요.
  // 3. 메서드는 자기 객체의 km를 읽어요.
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
  double meters() => km * 1000;
}

// ━━━━━━━━━━ 1단계: 예제 따라 하기 ━━━━━━━━━━
// [문제] Lap 클래스를 정의하세요. 필드 final int seconds와 생성자 Lap(this.seconds)를 두세요.
//        int minutes() 메서드는 seconds를 60으로 나눈 몫(~/)을 반환해요.
//        step1 안에서 Lap(150).minutes()를 출력하세요.
// [예상 출력]
// --- 1단계 ---
// 2

void step1() {
  print('--- 1단계 ---');
  // TODO ①: 여기서 Lap(150).minutes()를 print 안에 넣으세요.
}

// TODO ②: 여기에 Lap 클래스를 정의하세요.

// ━━━━━━━━━━ 2단계: 직접 작성 ━━━━━━━━━━
// [문제] PracticeRun(double distanceKm)을 받는 클래스를 정의하세요. 필드는 final double distanceKm예요.
//        String label() 메서드는 거리 뒤에 km를 붙여 반환하세요.
//        step2 안에서 PracticeRun(3.0)을 record에 저장하고 record.label()을 출력하세요.
// [예상 출력]
// --- 2단계 ---
// 3.0km
// [값을 바꾸어 다시 실행] 입력 0.0이면 0.0km예요.

void step2() {
  print('--- 2단계 ---');
  // TODO ①: 여기서 record를 만들고 record.label()을 출력하세요.
}

// TODO ②: 여기에 PracticeRun 클래스를 정의하세요.

// ━━━━━━━━━━ 3단계: Runnery 코드 읽기 — 객체를 Map으로 바꾸는 메서드 ━━━━━━━━━━
// 4주차 3일에 본 toJson은 사실 RunningRecord 클래스 안의 메서드예요.
//
//   Map<String, dynamic> toJson() => {
//     'id': id,
//     'distanceKm': distanceKm,
//     ...
//   };
//
// 읽는 법: 입력이 없는 메서드예요. 자기 객체의 id, distanceKm 필드를 읽어서 Map에 담아 돌려줘요.
// 바로 아래 [주어진 코드]는 필드 두 개만 남긴 거예요.
// [문제]
// (1) step3 안에서 final record = RecordLite('r7', 4.5);로 객체를 만드세요.
// (2) 실행 전에 record.toJson()과 record.toJson()['distanceKm']의 결과를 [내 예측]에 적으세요.
// (3) 두 값을 차례로 출력하고 비교하세요.
// (4) toJson()에는 입력이 없는데 'r7'과 4.5는 어디서 왔나요?
// [내 예측]
//
// [예상 출력]
// --- 3단계 ---
// {id: r7, distanceKm: 4.5}
// 4.5

// [주어진 코드 — 수정하지 말고 읽기만 하세요]
class RecordLite {
  final String id;
  final double distanceKm;
  RecordLite(this.id, this.distanceKm);

  Map<String, Object> toJson() => {'id': id, 'distanceKm': distanceKm};
}

void step3() {
  print('--- 3단계 ---');
  // TODO ①: 여기서 record를 만들고 두 값을 출력하세요.
}

// [내 말로 설명]
// label()은 별도 입력 없이 어떤 값을 읽나요?
