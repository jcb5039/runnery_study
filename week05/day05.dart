// 5주차 5일 — static 메서드
// 실행 위치: ~/src/runnery-study
// 실행: dart run week05/day05.dart
// 정답은 answers/day05.dart에 있어요.
// 오늘의 강의: week05/README.md의 "4. static과 import — 5~6일" 섹션이에요. 그 섹션만 읽고 풀 수 있어요.
// 예제를 실행해 본 뒤 아래로 내려가며 1단계 → 2단계 → 3단계 순서로 풀어요.
// 단계마다 [문제] 바로 아래에 코드를 쓰는 자리(①)와, 필요하면 함수를 만드는 자리(②)가 붙어 있어요.
// 한 단계를 저장·실행해서 예상 출력과 같으면 다음 단계로 넘어가요.

void main() {
  // [짧은 실행 예제]
  print(ExampleCalc.doubleValue(3));

  // [한 줄씩 읽기]
  // 1. static 메서드는 클래스 이름으로 호출해요.
  // 2. ExampleCalc 객체를 만들지 않아요.
  // 3. 전달받은 n으로 계산해요.
  // [예제 예상 출력]
  // 6

  // [단계 문제 실행]
  // 아래 세 줄은 이 파일 아래쪽의 step1, step2, step3 함수를 차례로 호출해요.
  // 각 단계의 문제와 풀 자리는 그 함수 바로 위아래에 있어요.
  step1();
  step2();
  step3();
}

class ExampleCalc {
  static int doubleValue(int n) => n * 2;
}

// ━━━━━━━━━━ 1단계: 예제 따라 하기 ━━━━━━━━━━
// [문제] Unit 클래스를 정의하고 static int kmToM(int km) => km * 1000;을 만드세요.
//        step1 안에서 Unit.kmToM(3)을 출력하세요.
// [예상 출력]
// --- 1단계 ---
// 3000

void step1() {
  print('--- 1단계 ---');
  // TODO ①: 여기서 Unit.kmToM(3)을 print 안에 넣으세요.
}

// TODO ②: 여기에 Unit 클래스를 정의하세요.

// ━━━━━━━━━━ 2단계: 직접 작성 ━━━━━━━━━━
// [문제] RunCalc 클래스를 정의하고 static double metersToKm(int meters)를 만드세요.
//        step2 안에서 RunCalc.metersToKm(1500)을 출력하세요.
// [예상 출력]
// --- 2단계 ---
// 1.5
// [값을 바꾸어 다시 실행] 3200을 전달하면 3.2예요.

void step2() {
  print('--- 2단계 ---');
  // TODO ①: 여기서 RunCalc.metersToKm(1500)을 print 안에 넣으세요.
}

// TODO ②: 여기에 RunCalc 클래스를 정의하세요.

// ━━━━━━━━━━ 3단계: Runnery 코드 읽기 — 설정값과 계산 도구 ━━━━━━━━━━
// 3주차 3일에 본 hetbahnCount의 원래 모습이에요(home/running/running_start_page.dart).
//
//   abstract final class RunningConfig {
//     static const hetbahnKcal = 315.0;
//   }
//   abstract final class RunningCalc {
//     static double hetbahnCount(double kcal) => kcal / RunningConfig.hetbahnKcal;
//   }
//
// 읽는 법: static const는 객체 없이 클래스 이름으로 읽는, 바뀌지 않는 값이에요.
//   abstract final은 "이 클래스로는 객체를 만들지 않는다"는 표시예요. 지금은 빼고 읽어요.
// 바로 아래 [주어진 코드]는 abstract final만 뺀 거예요.
// [문제]
// (1) 실행 전에 RunningConfig.hetbahnKcal과 RunningCalc.hetbahnCount(630)의 결과를 [내 예측]에 적으세요.
// (2) step3 안에서 두 값을 차례로 출력하고 비교하세요.
// (3) hetbahnCount 안의 RunningConfig.hetbahnKcal은 어느 클래스의 무엇을 읽나요?
// (4) 두 줄 모두 객체를 만드는 코드(RunningCalc())가 없어요. 그런데도 되는 이유는요?
// [내 예측]
//
// [예상 출력]
// --- 3단계 ---
// 315.0
// 2.0

// [주어진 코드 — 수정하지 말고 읽기만 하세요]
class RunningConfig {
  static const hetbahnKcal = 315.0;
}

class RunningCalc {
  static double hetbahnCount(double kcal) => kcal / RunningConfig.hetbahnKcal;
}

void step3() {
  print('--- 3단계 ---');
  // TODO ①: 여기서 두 값을 차례로 출력하세요.
}

// [내 말로 설명]
// RunCalc.metersToKm과 record.label 호출의 앞부분은 무엇이 다른가요?
