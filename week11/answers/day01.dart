// 11주차 1일 해설 — Map을 JSON 문자열로
// 문제의 결과만 출력해요. 먼저 단계마다 직접 시도한 뒤 읽고, 닫은 다음 입력을 바꾸어 다시 풀어 보세요.
// 3단계 설명: toIso8601String()은 날짜를 글자로 바꿔서 JSON에서도 "..." 따옴표로 감싸져요.
//            숫자 5.0과 값 없음 null은 JSON에서도 숫자와 null 그대로 써요.

import 'dart:convert';

void main() {
  step1();
  step2();
  step3();
}

// ━━━━━━━━━━ 1단계 ━━━━━━━━━━
void step1() {
  print('--- 1단계 ---');
  final shoe = {'brand': '빠른신발', 'size': 260};
  print(jsonEncode(shoe));
}

// ━━━━━━━━━━ 2단계 ━━━━━━━━━━
void step2() {
  print('--- 2단계 ---');
  final record = {'km': 5, 'seconds': 1800};
  print(record['km']);
  print(jsonEncode(record));
}

// ━━━━━━━━━━ 3단계 ━━━━━━━━━━
Map<String, Object?> recordJson(DateTime startedAt, double distanceKm, int? paceSeconds) => {
  'version': 1,
  'startedAt': startedAt.toIso8601String(),
  'distanceKm': distanceKm,
  'averagePaceSeconds': paceSeconds,
};

void step3() {
  print('--- 3단계 ---');
  print(jsonEncode(recordJson(DateTime(2026, 11, 9, 7, 30), 5.0, 360)));
  print(jsonEncode(recordJson(DateTime(2026, 11, 9, 7, 30), 0.0, null)));
}
