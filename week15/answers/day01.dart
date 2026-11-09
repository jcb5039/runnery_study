// 15주차 1일 해설 — 로컬과 서버는 따로
// 문제의 결과만 출력해요. 먼저 단계마다 직접 시도한 뒤 읽고, 닫은 다음 입력을 바꾸어 다시 풀어 보세요.
// 3단계 설명: r1은 처음에 'upsert'였다가 같은 키에 'delete'가 덮어써졌어요. 그래서 항목은 r1, r2 두 개예요.
//            저장한 뒤 지웠다면 서버에는 "지우기"만 하면 되니까 마지막 일만 남기는 거예요.

void main() {
  step1();
  step2();
  step3();
}

// ━━━━━━━━━━ 1단계 ━━━━━━━━━━
void step1() {
  print('--- 1단계 ---');
  final phone = <String, String>{};
  final cloud = <String, String>{};
  phone['memo-1'] = '물 마시기';
  print(phone);
  print(cloud);
}

// ━━━━━━━━━━ 2단계 ━━━━━━━━━━
void step2() {
  print('--- 2단계 ---');
  final local = <String, int>{};
  final server = <String, int>{};
  local['run-1'] = 5;
  print('로컬: ${local.length}');
  print('서버: ${server.length}');
}

// ━━━━━━━━━━ 3단계 ━━━━━━━━━━
final pending = <String, String>{};

void recordSaved(String id) {
  pending[id] = 'upsert';
}

void recordDeleted(String id) {
  pending[id] = 'delete';
}

void step3() {
  print('--- 3단계 ---');
  recordSaved('r1');
  recordSaved('r2');
  recordDeleted('r1');
  print(pending);
  print(pending.length);
}
