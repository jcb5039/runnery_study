// 5주차 5일 해설 — static 메서드
// 문제의 결과만 출력해요. 먼저 단계마다 직접 시도한 뒤 읽고, 닫은 다음 입력을 바꾸어 다시 풀어 보세요.
// 3단계 설명: 둘 다 static이라 클래스 이름으로 바로 써요. 630 ÷ 315.0 = 2.0이에요.
//            hetbahnCount는 다른 클래스 RunningConfig의 static 값 hetbahnKcal을 읽어요.

void main() {
  step1();
  step2();
  step3();
}

// ━━━━━━━━━━ 1단계 ━━━━━━━━━━
void step1() {
  print('--- 1단계 ---');
  print(Unit.kmToM(3));
}

class Unit {
  static int kmToM(int km) => km * 1000;
}

// ━━━━━━━━━━ 2단계 ━━━━━━━━━━
void step2() {
  print('--- 2단계 ---');
  print(RunCalc.metersToKm(1500));
}

class RunCalc {
  static double metersToKm(int meters) => meters / 1000;
}

// ━━━━━━━━━━ 3단계 ━━━━━━━━━━
class RunningConfig {
  static const hetbahnKcal = 315.0;
}

class RunningCalc {
  static double hetbahnCount(double kcal) => kcal / RunningConfig.hetbahnKcal;
}

void step3() {
  print('--- 3단계 ---');
  print(RunningConfig.hetbahnKcal);
  print(RunningCalc.hetbahnCount(630));
}
