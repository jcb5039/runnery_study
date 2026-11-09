// 15주차 5일 해설 — 지운 것도 서버에 알리기
// 문제의 결과만 출력해요. 먼저 단계마다 직접 시도한 뒤 읽고, 닫은 다음 입력을 바꾸어 다시 풀어 보세요.
// 3단계 설명: r1은 'delete'라 서버에서 지워지고, r3는 'upsert'라 폰의 4.0이 서버에 들어가요.
//            r2는 할 일이 없어서 건드리지 않아요. 할 일은 처리할 때마다 지워져서 마지막엔 비어요.

void main() {
  step1();
  step2();
  step3();
}

// ━━━━━━━━━━ 1단계 ━━━━━━━━━━
void step1() {
  print('--- 1단계 ---');
  final m = {'a': 1, 'b': 2};
  m.remove('a');
  print(m);
}

// ━━━━━━━━━━ 2단계 ━━━━━━━━━━
void step2() {
  print('--- 2단계 ---');
  final local = {'run-1': 5};
  final server = {'run-1': 5};
  final deletedIds = <String>[];
  local.remove('run-1');
  deletedIds.add('run-1');
  for (final id in deletedIds) {
    server.remove(id);
  }
  deletedIds.clear();
  print(local);
  print(server);
  print(deletedIds);
}

// ━━━━━━━━━━ 3단계 ━━━━━━━━━━
final server = {'r1': 5.0, 'r2': 3.2};
final pending = {'r1': 'delete', 'r3': 'upsert'};
final local = {'r2': 3.2, 'r3': 4.0};

void push() {
  for (final id in pending.keys.toList()) {
    final kind = pending[id];
    if (kind == 'delete') {
      server.remove(id);
    } else {
      final km = local[id];
      if (km != null) server[id] = km;
    }
    pending.remove(id);
  }
}

void step3() {
  print('--- 3단계 ---');
  push();
  print(server);
  print(pending);
}
