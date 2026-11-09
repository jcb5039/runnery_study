// 15주차 5일 — 지운 것도 서버에 알리기
// 실행 위치: ~/src/runnery-study
// 실행: dart run week15/day05.dart
// 정답은 answers/day05.dart에 있어요.
// 오늘의 강의: week15/README.md의 "3. 같은 키, 지우기, 키와 값 짝 꺼내기 — 4~6일" 섹션이에요. 그 섹션만 읽고 풀 수 있어요.
// 예제를 실행해 본 뒤 아래로 내려가며 1단계 → 2단계 → 3단계 순서로 풀어요.
// 단계마다 [문제] 바로 아래에 코드를 쓰는 자리(①)와, 필요하면 함수를 만드는 자리(②)가 붙어 있어요.
// 한 단계를 저장·실행해서 예상 출력과 같으면 다음 단계로 넘어가요.

void main() {
  // [짧은 실행 예제]
  final exampleServer = {'a': 2};
  exampleServer.remove('a');
  print(exampleServer);

  // [한 줄씩 읽기]
  // 1. remove는 해당 키를 지워요.
  // 2. 로컬에서만 지우면 서버에는 남을 수 있어요.
  // 3. 삭제할 ID를 보관해 서버에도 전달하는 방식으로 연습해요.
  // [예제 예상 출력]
  // {}

  // [단계 문제 실행]
  // 아래 세 줄은 이 파일 아래쪽의 step1, step2, step3 함수를 차례로 호출해요.
  // 각 단계의 문제와 풀 자리는 그 함수 바로 위아래에 있어요.
  step1();
  step2();
  step3();
}

// ━━━━━━━━━━ 1단계: 예제 따라 하기 ━━━━━━━━━━
// [문제] step1 안에서 m = {'a': 1, 'b': 2}를 만들고 m.remove('a')를 한 뒤 m을 출력하세요.
// [예상 출력]
// --- 1단계 ---
// {b: 2}

void step1() {
  print('--- 1단계 ---');
  // TODO ①: 여기에 m 선언, remove, 출력을 작성하세요.
}

// ━━━━━━━━━━ 2단계: 직접 작성 ━━━━━━━━━━
// [문제] step2 안에서 local = {'run-1': 5}, server = {'run-1': 5}, deletedIds = <String>[]를 선언하세요.
//        local에서 run-1을 지우고 deletedIds에 넣으세요.
//        그다음 deletedIds의 각 ID를 server에서도 지우고 성공 후 deletedIds.clear()를 하세요.
//        local, server, deletedIds를 차례로 출력하세요.
// [예상 출력]
// --- 2단계 ---
// {}
// {}
// []
// [값을 바꾸어 다시 실행] 서버 삭제를 실행하기 직전에 멈춘다고 생각하고 세 변수의 값을 종이에 적어보세요.

void step2() {
  print('--- 2단계 ---');
  // TODO ①: 여기에 세 변수 선언, 지우기, 서버 반영, 출력을 작성하세요.
}

// ━━━━━━━━━━ 3단계: Runnery 코드 읽기 — 할 일 종류에 따라 올리거나 지우기 ━━━━━━━━━━
// RecordSync._push 안에서 할 일 종류를 보고 갈라지는 부분이에요.
//
//   if (op.kind == 'delete') {
//     await backend.markDeleted(uid, id, ...);
//   } else {
//     final record = await local.find(id);
//     if (record != null) await backend.upsert(uid, record, ...);
//   }
//
// 읽는 법: 'delete'면 서버에서 지우고, 아니면 폰에서 기록을 찾아 서버에 올려요(같은 ID면 덮어써요).
// 바로 아래 [주어진 코드]는 서버, 할 일, 폰 기록을 Map 세 개로 흉내 내고 기다림은 뺐어요.
// [문제]
// (1) step3 안에서 push();를 부른 뒤 server와 pending을 출력하세요.
// (2) 실행 전에 두 출력을 [내 예측]에 적고 비교하세요.
// (3) r2는 할 일 목록에 없어요. 서버의 r2는 왜 그대로 있나요?
// [내 예측]
//
// [예상 출력]
// --- 3단계 ---
// {r2: 3.2, r3: 4.0}
// {}

// [주어진 코드 — 수정하지 말고 읽기만 하세요]
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
  // TODO ①: 여기에 push 호출과 두 출력을 작성하세요.
}

// [내 말로 설명]
// 삭제 정보를 잊은 채 서버 기록을 내려받으면 지운 기록이 다시 나타날 수 있나요?
