// 4주차 1일 해설 — 거리 목록 합산
// 문제의 결과만 출력해요. 먼저 단계마다 직접 시도한 뒤 읽고, 닫은 다음 입력을 바꾸어 다시 풀어 보세요.
// 3단계 설명: weekday 1은 0번 칸 '월', 7은 6번 칸 '일', 3은 2번 칸 '수'예요.
//            dayName(8)은 7번 칸을 꺼내려 하는데, 칸은 0~6번뿐이라 오류(RangeError)가 나요.

void main() {
  step1();
  step2();
  step3();
}

// ━━━━━━━━━━ 1단계 ━━━━━━━━━━
void step1() {
  print('--- 1단계 ---');
  final laps = [1.5, 2.5];
  var total = 0.0;
  for (final km in laps) {
    total += km;
  }
  print(total);
}

// ━━━━━━━━━━ 2단계 ━━━━━━━━━━
void step2() {
  print('--- 2단계 ---');
  final distances = [2.0, 4.0, 6.0];
  var total = 0.0;
  for (final km in distances) {
    total += km;
  }
  print(distances[0]);
  print(total);
}

// ━━━━━━━━━━ 3단계 ━━━━━━━━━━
final dayNames = ['월', '화', '수', '목', '금', '토', '일'];

String dayName(int weekday) {
  return dayNames[weekday - 1];
}

void step3() {
  print('--- 3단계 ---');
  print(dayName(1));
  print(dayName(7));
  print(dayName(3));
  print(dayNames.length);
}
