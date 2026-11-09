// 10주차 2일 해설 — 시간의 길이
// 문제의 결과만 출력해요. 먼저 단계마다 직접 시도한 뒤 읽고, 닫은 다음 입력을 바꾸어 다시 풀어 보세요.
// 3단계 설명: 1935초는 0시간 32분 15초라 if를 지나 아래 return이 쓰여요.
//            3735초의 inMinutes는 62인데 remainder(60)으로 시간을 뺀 나머지 2분만 남겨요.

void main() {
  step1();
  step2();
  step3();
}

// ━━━━━━━━━━ 1단계 ━━━━━━━━━━
void step1() {
  print('--- 1단계 ---');
  final movie = Duration(minutes: 90);
  print(movie.inHours);
  print(movie.inMinutes % 60);
}

// ━━━━━━━━━━ 2단계 ━━━━━━━━━━
void step2() {
  print('--- 2단계 ---');
  final duration = Duration(seconds: 185);
  final minutes = duration.inMinutes;
  final seconds = duration.inSeconds % 60;
  print('${minutes}분 ${seconds}초');
}

// ━━━━━━━━━━ 3단계 ━━━━━━━━━━
String koreanDuration(Duration d) {
  final h = d.inHours;
  final m = d.inMinutes.remainder(60);
  final s = d.inSeconds.remainder(60);
  if (h > 0) return '$h시간 $m분 $s초';
  return '$m분 $s초';
}

void step3() {
  print('--- 3단계 ---');
  print(koreanDuration(Duration(seconds: 1935)));
  print(koreanDuration(Duration(seconds: 3735)));
}
