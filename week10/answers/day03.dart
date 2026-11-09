// 10주차 3일 해설 — 속도 계산과 0 검사
// 문제의 결과만 출력해요. 먼저 단계마다 직접 시도한 뒤 읽고, 닫은 다음 입력을 바꾸어 다시 풀어 보세요.
// 3단계 설명: 30분은 1,800,000밀리초 ÷ 3,600,000 = 0.5시간이에요. 5000m는 5km라서 5 ÷ 0.5 = 10.0이에요.
//            Duration.zero는 0초짜리 길이라 hours가 0이 되어 0을 돌려줘요.

void main() {
  step1();
  step2();
  step3();
}

// ━━━━━━━━━━ 1단계 ━━━━━━━━━━
void step1() {
  print('--- 1단계 ---');
  print(metersPerMinute(1500, 600));
  print(metersPerMinute(1500, 0));
}

double metersPerMinute(double meters, int seconds) {
  if (seconds <= 0) return 0;
  return meters / (seconds / 60);
}

// ━━━━━━━━━━ 2단계 ━━━━━━━━━━
void step2() {
  print('--- 2단계 ---');
  print(averageSpeed(5.0, 1800));
  print(averageSpeed(0.0, 1800));
  print(averageSpeed(5.0, 0));
}

double averageSpeed(double km, int seconds) {
  if (km <= 0 || seconds <= 0) return 0;
  return km / (seconds / 3600);
}

// ━━━━━━━━━━ 3단계 ━━━━━━━━━━
double averageSpeedKmh(double distanceMeters, Duration moving) {
  final hours = moving.inMilliseconds / Duration.millisecondsPerHour;
  if (hours == 0) return 0;
  return distanceMeters / 1000 / hours;
}

void step3() {
  print('--- 3단계 ---');
  print(Duration.millisecondsPerHour);
  print(averageSpeedKmh(5000, Duration(minutes: 30)));
  print(averageSpeedKmh(3000, Duration.zero));
}
