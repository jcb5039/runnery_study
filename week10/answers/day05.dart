// 10주차 5일 해설 — 삼항 연산자와 두 자리 표시
// 문제의 결과만 출력해요. 먼저 단계마다 직접 시도한 뒤 읽고, 닫은 다음 입력을 바꾸어 다시 풀어 보세요.
// 3단계 설명: 365초는 6분 5초라 6'05"예요. 0.005km는 .01(0.01)보다 작아서 조건이 참이 되고
//            ? 바로 뒤의 '—'가 골라져요. 그래서 quotePace는 아예 호출되지 않아요.

void main() {
  step1();
  step2();
  step3();
}

// ━━━━━━━━━━ 1단계 ━━━━━━━━━━
void step1() {
  print('--- 1단계 ---');
  final n = 3;
  print(n.toString().padLeft(2, '0'));
  print(n >= 5 ? '많음' : '적음');
}

// ━━━━━━━━━━ 2단계 ━━━━━━━━━━
void step2() {
  print('--- 2단계 ---');
  print(paceText(365));
  print(paceText(0));
}

String paceText(int seconds) {
  return seconds <= 0
      ? '--:--'
      : '${seconds ~/ 60}:${(seconds % 60).toString().padLeft(2, '0')}';
}

// ━━━━━━━━━━ 3단계 ━━━━━━━━━━
String quotePace(int seconds) =>
    "${seconds ~/ 60}'${(seconds % 60).toString().padLeft(2, '0')}\"";

String paceLabel(double distanceKm, int movingSeconds, int paceSeconds) =>
    distanceKm < .01 || movingSeconds == 0 ? '—' : quotePace(paceSeconds);

void step3() {
  print('--- 3단계 ---');
  print(quotePace(365));
  print(paceLabel(5.0, 1800, 360));
  print(paceLabel(0.005, 30, 6000));
}
