// 15주차 6일 해설 — 키와 값 짝 꺼내기
// 문제의 결과만 출력해요. 먼저 단계마다 직접 시도한 뒤 읽고, 닫은 다음 입력을 바꾸어 다시 풀어 보세요.
// 3단계 설명: r1은 서버에서 지워져(null) 폰에서도 지워요. r2는 pending에 있어서 continue로 건너뛰어요.
//            r3는 새로 들어와요. 폰에서 아직 못 올린 r2 수정이 서버 값에 덮이지 않게 지킨 거예요.

void main() {
  step1();
  step2();
  step3();
}

// ━━━━━━━━━━ 1단계 ━━━━━━━━━━
void step1() {
  print('--- 1단계 ---');
  final m = {'a': 1, 'b': 2};
  for (final entry in m.entries) {
    print('${entry.key}=${entry.value}');
  }
}

// ━━━━━━━━━━ 2단계 ━━━━━━━━━━
void step2() {
  print('--- 2단계 ---');
  final local = {'a': 5};
  final remote = {'a': 3, 'b': 2};
  final pending = ['a'];
  for (final entry in remote.entries) {
    if (!pending.contains(entry.key)) local[entry.key] = entry.value;
  }
  print(local);
}

// ━━━━━━━━━━ 3단계 ━━━━━━━━━━
final local = {'r1': 5.0, 'r2': 3.0};
final pending = {'r2': 'upsert'};
final changes = <String, double?>{'r1': null, 'r2': 9.9, 'r3': 4.4};

void pull() {
  for (final e in changes.entries) {
    if (pending.containsKey(e.key)) continue;
    final km = e.value;
    if (km == null) {
      local.remove(e.key);
    } else {
      local[e.key] = km;
    }
  }
}

void step3() {
  print('--- 3단계 ---');
  pull();
  print(local);
  print(pending);
}
