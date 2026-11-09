// 4주차 2일 해설 — 빈 목록과 평균
// 문제의 결과만 출력해요. 먼저 단계마다 직접 시도한 뒤 읽고, 닫은 다음 입력을 바꾸어 다시 풀어 보세요.
// 3단계 설명: best는 8.5에서 시작 → 8.5(같음) → 11.2(더 큼, 바꿈) → 9.0(작음, 그대로) → 11.2를 반환해요.
//            빈 목록에는 0번 칸이 없어서 speeds[0]에서 오류가 나요. 그래서 먼저 isEmpty를 확인해요.

void main() {
  step1();
  step2();
  step3();
}

// ━━━━━━━━━━ 1단계 ━━━━━━━━━━
void step1() {
  print('--- 1단계 ---');
  print(firstOrZero([3.5, 1.0]));
  print(firstOrZero([]));
}

double firstOrZero(List<double> values) {
  if (values.isEmpty) return 0;
  return values[0];
}

// ━━━━━━━━━━ 2단계 ━━━━━━━━━━
void step2() {
  print('--- 2단계 ---');
  print(averageKm([2.0, 4.0, 6.0]));
  print(averageKm([]));
}

double averageKm(List<double> distances) {
  if (distances.isEmpty) return 0;
  var total = 0.0;
  for (final km in distances) {
    total += km;
  }
  return total / distances.length;
}

// ━━━━━━━━━━ 3단계 ━━━━━━━━━━
double maxSpeed(List<double> speeds) {
  if (speeds.isEmpty) return 0;
  var best = speeds[0];
  for (final speed in speeds) {
    if (speed > best) {
      best = speed;
    }
  }
  return best;
}

void step3() {
  print('--- 3단계 ---');
  print(maxSpeed([8.5, 11.2, 9.0]));
  print(maxSpeed([]));
}
