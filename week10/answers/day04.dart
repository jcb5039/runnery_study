// 10주차 4일 해설 — 페이스 계산
// 문제의 결과만 출력해요. 먼저 단계마다 직접 시도한 뒤 읽고, 닫은 다음 입력을 바꾸어 다시 풀어 보세요.
// 3단계 설명: 1800초 ÷ 5km = 360.0, 8m는 10m보다 짧아서 null, 700초 ÷ 2km = 350.0이에요.
//            null이면 "아직 계산 전"을, 0이면 "0초"를 뜻하게 되어 화면에서 다르게 표시할 수 있어요.

void main() {
  step1();
  step2();
  step3();
}

// ━━━━━━━━━━ 1단계 ━━━━━━━━━━
void step1() {
  print('--- 1단계 ---');
  print((1000 / 6).round());
  print((7 / 2).round());
}

// ━━━━━━━━━━ 2단계 ━━━━━━━━━━
void step2() {
  print('--- 2단계 ---');
  print(paceSeconds(5.0, 1800));
  print(paceSeconds(0.0, 1800));
}

int paceSeconds(double km, int seconds) {
  if (km <= 0 || seconds <= 0) return 0;
  return (seconds / km).round();
}

// ━━━━━━━━━━ 3단계 ━━━━━━━━━━
const minDistanceForPaceMeters = 10.0;

double? paceSecondsPerKm(double meters, Duration duration) {
  if (meters < minDistanceForPaceMeters) return null;
  return duration.inMilliseconds / 1000 / (meters / 1000);
}

void step3() {
  print('--- 3단계 ---');
  print(paceSecondsPerKm(5000, Duration(minutes: 30)));
  print(paceSecondsPerKm(8, Duration(seconds: 20)));
  print(paceSecondsPerKm(2000, Duration(seconds: 700)));
}
