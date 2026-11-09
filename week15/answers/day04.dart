// 15주차 4일 해설 — 같은 ID는 한 번만
// 문제의 결과만 출력해요. 먼저 단계마다 직접 시도한 뒤 읽고, 닫은 다음 입력을 바꾸어 다시 풀어 보세요.
// 3단계 설명: 첫 호출은 seq 1을 기억했는데 기다리는 사이 번호가 2로 바뀌었어요. 1 ≠ 2라 지우지 않아요.
//            두 번째 호출은 seq 2를 기억하고 그대로 2라서 지워요.

Future<void> main() async {
  await step1();
  await step2();
  await step3();
}

// ━━━━━━━━━━ 1단계 ━━━━━━━━━━
Future<void> step1() async {
  print('--- 1단계 ---');
  final scores = {'민': 70};
  scores['민'] = 80;
  print(scores.length);
  print(scores['민']);
}

// ━━━━━━━━━━ 2단계 ━━━━━━━━━━
Future<void> step2() async {
  print('--- 2단계 ---');
  final server = <String, int>{};
  push(server, 'run-1', 5);
  push(server, 'run-1', 5);
  print(server.length);
  print(server['run-1']);
}

void push(Map<String, int> server, String id, int km) {
  server[id] = km;
}

// ━━━━━━━━━━ 3단계 ━━━━━━━━━━
final pending = <String, int>{'r1': 1};

Future<void> pushOne(String id, {required bool editedMeanwhile}) async {
  final seq = pending[id];
  await Future<void>.delayed(const Duration(milliseconds: 20));
  if (editedMeanwhile) pending[id] = 2;
  if (pending[id] == seq) pending.remove(id);
}

Future<void> step3() async {
  print('--- 3단계 ---');
  await pushOne('r1', editedMeanwhile: true);
  print(pending);
  await pushOne('r1', editedMeanwhile: false);
  print(pending);
}
