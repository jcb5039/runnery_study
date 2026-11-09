// 15주차 4일 — 같은 ID는 한 번만
// 실행 위치: ~/src/runnery-study
// 실행: dart run week15/day04.dart
// 정답은 answers/day04.dart에 있어요.
// 오늘의 강의: week15/README.md의 "3. 같은 키, 지우기, 키와 값 짝 꺼내기 — 4~6일" 섹션이에요. 그 섹션만 읽고 풀 수 있어요.
// 예제를 실행해 본 뒤 아래로 내려가며 1단계 → 2단계 → 3단계 순서로 풀어요.
// 단계마다 [문제] 바로 아래에 코드를 쓰는 자리(①)와, 필요하면 함수를 만드는 자리(②)가 붙어 있어요.
// 한 단계를 저장·실행해서 예상 출력과 같으면 다음 단계로 넘어가요.

Future<void> main() async {
  // [짧은 실행 예제]
  final exampleServer = <String, int>{};
  exampleServer['a'] = 2;
  exampleServer['a'] = 2;
  print(exampleServer.length);

  // [한 줄씩 읽기]
  // 1. Map은 같은 키에 다시 넣으면 그 키의 값을 바꿔요.
  // 2. 같은 ID를 쓰면 항목이 두 개로 늘어나지 않아요.
  // 3. 실제 서버도 중복 처리 정책을 별도로 구현해야 해요.
  // [예제 예상 출력]
  // 1

  // [단계 문제 실행]
  // 아래 세 줄은 이 파일 아래쪽의 step1, step2, step3 함수를 차례로 호출해요.
  // 각 단계의 문제와 풀 자리는 그 함수 바로 위아래에 있어요.
  await step1();
  await step2();
  await step3();
}

// ━━━━━━━━━━ 1단계: 예제 따라 하기 ━━━━━━━━━━
// [문제] step1 안에서 scores = {'민': 70}을 만들고 scores['민'] = 80;으로 다시 넣으세요.
//        scores.length와 scores['민']을 차례로 출력하세요.
// [예상 출력]
// --- 1단계 ---
// 1
// 80

Future<void> step1() async {
  print('--- 1단계 ---');
  // TODO ①: 여기에 scores 선언, 다시 넣기, 두 줄 출력을 작성하세요.
}

// ━━━━━━━━━━ 2단계: 직접 작성 ━━━━━━━━━━
// [문제] void push(Map<String, int> server, String id, int km)를 정의하고 server[id] = km를 하세요.
//        step2 안에서 빈 server를 만들고 push(server, 'run-1', 5)를 두 번 호출하세요.
//        server.length와 server['run-1']을 출력하세요.
// [예상 출력]
// --- 2단계 ---
// 1
// 5
// [값을 바꾸어 다시 실행] 두 번째 ID를 'run-2'로 바꾸면 개수는 2예요.

Future<void> step2() async {
  print('--- 2단계 ---');
  // TODO ①: 여기에 server 선언, push 두 번, 두 줄 출력을 작성하세요.
}

// TODO ②: 여기에 void push(Map<String, int> server, String id, int km)를 정의하세요.

// ━━━━━━━━━━ 3단계: Runnery 코드 읽기 — 올리는 사이에 또 바뀌었다면 ━━━━━━━━━━
// RecordSync._push에서 성공 뒤 할 일을 지우는 줄이에요(record/data/record_sync.dart).
//
//   // 올리는 사이에 같은 기록이 또 바뀌었다면 올릴 일을 남겨 둡니다.
//   if (_pending[id]?.seq == op.seq) _pending.remove(id);
//
// 읽는 법: 할 일마다 번호(seq)가 있어요. 같은 기록에 새 일이 생기면 같은 키에 더 큰 번호가 덮어써져요.
//   올리기 전에 기억한 번호와 지금 번호가 같을 때만 지워요. 다르면 그사이 또 바뀐 거라 남겨 둬요.
// 바로 아래 [주어진 코드]는 할 일 Map에 번호만 담고, "올리는 사이 수정됐는지"를 입력으로 정해요.
// [문제]
// (1) step3 안에서 await pushOne('r1', editedMeanwhile: true); 다음에 pending을 출력하세요.
// (2) 이어서 await pushOne('r1', editedMeanwhile: false); 다음에 pending을 출력하세요.
// (3) 실행 전에 두 출력을 [내 예측]에 적고 비교하세요. 첫 번째에서 r1은 왜 남았나요?
// [내 예측]
//
// [예상 출력]
// --- 3단계 ---
// {r1: 2}
// {}

// [주어진 코드 — 수정하지 말고 읽기만 하세요]
final pending = <String, int>{'r1': 1};

Future<void> pushOne(String id, {required bool editedMeanwhile}) async {
  final seq = pending[id];
  await Future<void>.delayed(const Duration(milliseconds: 20));
  if (editedMeanwhile) pending[id] = 2;
  if (pending[id] == seq) pending.remove(id);
}

Future<void> step3() async {
  print('--- 3단계 ---');
  // TODO ①: 여기에 문제 (1)~(2)의 코드를 쓰세요.
}

// [내 말로 설명]
// 응답을 놓쳐 재전송할 때마다 새 ID를 만들면 어떤 문제가 생기나요?
