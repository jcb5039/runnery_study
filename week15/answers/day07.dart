// 15주차 7일 해설 — 복습: 실패와 재시도
// 문제의 결과만 출력해요. 먼저 단계마다 직접 시도한 뒤 읽고, 닫은 다음 입력을 바꾸어 다시 풀어 보세요.
// 3단계 설명: 0초에 동기화, 30초는 30 < 60이라 건너뜀, 90초는 90 - 0 = 90이라 동기화해요.
//            마지막은 minAge가 null이라 && 앞에서 거짓이 되어 검사 없이 동기화해요.

Future<void> main() async {
  await step1();
  await step2();
  await step3();
}

// ━━━━━━━━━━ 1단계 ━━━━━━━━━━
Future<void> step1() async {
  print('--- 1단계 ---');
  final original = ['a', 'b'];
  final copy = List<String>.from(original);
  copy.add('c');
  print(original);
  print(copy);
}

// ━━━━━━━━━━ 2단계 ━━━━━━━━━━
Future<void> step2() async {
  print('--- 2단계 ---');
  final local = {'run-1': 5};
  final server = <String, int>{};
  final pending = ['run-1'];
  await sync(local, server, pending, false);
  print(pending);
  await sync(local, server, pending, true);
  print(server);
  print(pending);
}

Future<void> sync(
  Map<String, int> local,
  Map<String, int> server,
  List<String> pending,
  bool online,
) async {
  if (!online) {
    print('오프라인');
    return;
  }
  for (final id in List<String>.from(pending)) {
    final km = local[id];
    if (km == null) continue;
    await Future<void>.delayed(const Duration(milliseconds: 20));
    server[id] = km;
    pending.remove(id);
  }
}

// ━━━━━━━━━━ 3단계 ━━━━━━━━━━
var lastSyncAt = -1000;

String syncNow(int now, {int? minAge}) {
  if (minAge != null && now - lastSyncAt < minAge) return '건너뜀';
  lastSyncAt = now;
  return '동기화';
}

Future<void> step3() async {
  print('--- 3단계 ---');
  print(syncNow(0, minAge: 60));
  print(syncNow(30, minAge: 60));
  print(syncNow(90, minAge: 60));
  print(syncNow(95));
}
