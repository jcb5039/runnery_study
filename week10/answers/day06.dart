// 10주차 6일 해설 — 값이 없을 때의 대체 값
// 문제의 결과만 출력해요. 먼저 단계마다 직접 시도한 뒤 읽고, 닫은 다음 입력을 바꾸어 다시 풀어 보세요.
// 3단계 설명: 첫 객체는 밀리초가 null이라 1800 × 1000 ÷ 1000 = 1800초로 계산해 10.0이에요.
//            두 번째는 밀리초 1440000이 있어서 1440초를 써요. 5 ÷ 1440 × 3600 = 12.5예요.

void main() {
  step1();
  step2();
  step3();
}

// ━━━━━━━━━━ 1단계 ━━━━━━━━━━
void step1() {
  print('--- 1단계 ---');
  print(total(100, 20));
  print(total(100, null));
}

int total(int base, int? bonus) => bonus != null ? base + bonus : base;

// ━━━━━━━━━━ 2단계 ━━━━━━━━━━
void step2() {
  print('--- 2단계 ---');
  print(effectiveSeconds(1, 1500));
  print(effectiveSeconds(1, null));
}

double effectiveSeconds(int seconds, int? milliseconds) {
  if (milliseconds != null) return milliseconds / 1000;
  return seconds.toDouble();
}

// ━━━━━━━━━━ 3단계 ━━━━━━━━━━
class RecordLite {
  RecordLite(this.distanceKm, this.movingSeconds, {this.movingMilliseconds});

  final double distanceKm;
  final int movingSeconds;
  final int? movingMilliseconds;

  double get _movingSeconds =>
      (movingMilliseconds ?? movingSeconds * 1000) / 1000;
  double get averageSpeed =>
      _movingSeconds > 0 ? distanceKm / _movingSeconds * 3600 : 0;
}

void step3() {
  print('--- 3단계 ---');
  print(RecordLite(5.0, 1800).averageSpeed);
  print(RecordLite(5.0, 1800, movingMilliseconds: 1440000).averageSpeed);
  print(RecordLite(0.0, 0).averageSpeed);
}
