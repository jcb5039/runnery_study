// 3주차 7일 해설 — 복습: 계산을 함수로 나누기
// 문제의 결과만 출력해요. 먼저 단계마다 직접 시도한 뒤 읽고, 닫은 다음 입력을 바꾸어 다시 풀어 보세요.
// 3단계 추적 (clock(125)):
//   clock 정의 위치: 파일 아래 String clock(int totalSeconds)   clock 호출 위치: main의 print(clock(125))
//   clock에 들어간 값: totalSeconds = 125                      minutes와 seconds: 125 ~/ 60 = 2, 125 % 60 = 5
//   two에 들어간 값: n = 5                                     two가 돌려준 값: 10보다 작아서 '05'
//   clock이 돌려준 값: '2:05'

void main() {
  step1();
  step2();
  step3();
}

// ━━━━━━━━━━ 1단계 ━━━━━━━━━━
void step1() {
  print('--- 1단계 ---');
  print(totalMeters(1200, 800));
}

int totalMeters(int first, int second) {
  return first + second;
}

// ━━━━━━━━━━ 2단계 ━━━━━━━━━━
void step2() {
  print('--- 2단계 ---');
  final meters = 3200;
  final target = 3.0;
  final km = metersToKm(meters);
  print(km);
  print(reached(km, target));
}

double metersToKm(int meters) {
  return meters / 1000;
}

bool reached(double km, double target) {
  return km >= target;
}

// ━━━━━━━━━━ 3단계 ━━━━━━━━━━
String two(int n) {
  if (n < 10) return '0$n';
  return '$n';
}

String clock(int totalSeconds) {
  final minutes = totalSeconds ~/ 60;
  final seconds = totalSeconds % 60;
  return '$minutes:${two(seconds)}';
}

void step3() {
  print('--- 3단계 ---');
  print(clock(125));
  print(clock(600));
  print(clock(59));
}
