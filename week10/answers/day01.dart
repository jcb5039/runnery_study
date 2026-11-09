// 10주차 1일 해설 — 날짜 객체
// 문제의 결과만 출력해요. 먼저 단계마다 직접 시도한 뒤 읽고, 닫은 다음 입력을 바꾸어 다시 풀어 보세요.
// 3단계 설명: 2026년 11월 9일은 월요일이라 weekday가 1이에요. 0번 칸 '월'을 꺼내려고 1을 빼요.
//            15일은 일요일(weekday 7)이라 6번 칸 '일'이에요.

void main() {
  step1();
  step2();
  step3();
}

// ━━━━━━━━━━ 1단계 ━━━━━━━━━━
void step1() {
  print('--- 1단계 ---');
  final d = DateTime(2025, 5, 1);
  print('${d.month}/${d.day}');
}

// ━━━━━━━━━━ 2단계 ━━━━━━━━━━
void step2() {
  print('--- 2단계 ---');
  final date = DateTime(2026, 12, 3);
  print('${date.year}년 ${date.month}월 ${date.day}일');
}

// ━━━━━━━━━━ 3단계 ━━━━━━━━━━
final weekNames = ['월', '화', '수', '목', '금', '토', '일'];

String dateLabel(DateTime startedAt) =>
    '${startedAt.month}월 ${startedAt.day}일 ${weekNames[startedAt.weekday - 1]}요일';

void step3() {
  print('--- 3단계 ---');
  print(DateTime(2026, 11, 9).weekday);
  print(dateLabel(DateTime(2026, 11, 9)));
  print(dateLabel(DateTime(2026, 11, 15)));
}
