// 15주차 2일 해설 — 보낼 작업 목록
// 문제의 결과만 출력해요. 먼저 단계마다 직접 시도한 뒤 읽고, 닫은 다음 입력을 바꾸어 다시 풀어 보세요.
// 3단계 설명: pending은 할 일 목록이라 clear()로 비워도 기록(local)은 그대로 3개예요.
//            할 일이 비면 isEmpty가 true라서 '모두 올림'이 골라져요.

void main() {
  step1();
  step2();
  step3();
}

// ━━━━━━━━━━ 1단계 ━━━━━━━━━━
void step1() {
  print('--- 1단계 ---');
  final waiting = <String>[];
  waiting.add('memo-1');
  waiting.add('memo-2');
  print(waiting);
}

// ━━━━━━━━━━ 2단계 ━━━━━━━━━━
void step2() {
  print('--- 2단계 ---');
  final local = <String, int>{};
  final pending = <String>[];
  local['run-1'] = 5;
  pending.add('run-1');
  print(local['run-1']);
  print(pending);
}

// ━━━━━━━━━━ 3단계 ━━━━━━━━━━
final local = {'r1': 5.0, 'r2': 3.2, 'r3': 4.0};
final pending = ['r2', 'r3'];

String badge() => pending.isEmpty ? '모두 올림' : '${pending.length}개 올리기 전';

void step3() {
  print('--- 3단계 ---');
  print(badge());
  pending.clear();
  print(badge());
  print(local.length);
}
