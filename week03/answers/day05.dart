// 3주차 5일 해설 — 이름 있는 매개변수
// 문제의 결과만 출력해요. 먼저 단계마다 직접 시도한 뒤 읽고, 닫은 다음 입력을 바꾸어 다시 풀어 보세요.
// 3단계 설명: 150m/분은 134보다 빨라서 0.2 → 0.2 × 1000 × 65 ÷ 1000 × 5 = 65.0
//            100m/분은 134보다 느려서 0.1 → 32.5. 거리가 0이면 계산 전에 0을 반환해요.
//            이름 있는 입력은 이름으로 연결되므로 두 번째 호출처럼 순서가 달라도 같은 자리에 들어가요.

void main() {
  step1();
  step2();
  step3();
}

// ━━━━━━━━━━ 1단계 ━━━━━━━━━━
void step1() {
  print('--- 1단계 ---');
  print(shoeLabel(brand: '가벼운신발', size: 270));
}

String shoeLabel({required String brand, required int size}) {
  return '$brand ${size}mm';
}

// ━━━━━━━━━━ 2단계 ━━━━━━━━━━
void step2() {
  print('--- 2단계 ---');
  print(describeRun(name: '민수', km: 3));
}

String describeRun({required String name, required int km}) {
  return '$name: ${km}km';
}

// ━━━━━━━━━━ 3단계 ━━━━━━━━━━
void step3() {
  print('--- 3단계 ---');
  print(segmentCalories(weightKg: 65, meters: 1000, metersPerMinute: 150));
  print(segmentCalories(meters: 1000, metersPerMinute: 100, weightKg: 65));
  print(segmentCalories(weightKg: 65, meters: 0, metersPerMinute: 150));
}

double segmentCalories({
  required double weightKg,
  required double meters,
  required double metersPerMinute,
}) {
  if (meters <= 0) return 0;
  var oxygen = 0.2;
  if (metersPerMinute < 134) {
    oxygen = 0.1;
  }
  return oxygen * meters * weightKg / 1000 * 5;
}
