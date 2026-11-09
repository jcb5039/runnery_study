// 15주차 7일 해설 — 복습: 오프라인 저장 후 재시도
// 문제의 결과만 출력해요. 먼저 시도한 뒤 읽고, 닫은 다음 입력을 바꾸어 다시 풀어 보세요.
// 확인 질문: 반복 중 제거할 때 pending 복사본을 사용하는 이유는 무엇인가요?
// 예상 결과:
// 오프라인
// [run-1]
// {run-1: 5}
// []

Future<void> main() async {
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
