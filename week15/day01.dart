// 15주차 1일 — 로컬과 서버는 따로
// 실행 위치: ~/src/runnery-study
// 실행: dart run week15/day01.dart
// 정답은 answers/day01.dart에 있어요.
// 오늘의 강의: week15/README.md의 "1. 저장소 두 개는 따로 움직여요 — 1~2일" 섹션이에요. 그 섹션만 읽고 풀 수 있어요.
// 예제를 실행해 본 뒤 아래로 내려가며 1단계 → 2단계 → 3단계 순서로 풀어요.
// 단계마다 [문제] 바로 아래에 코드를 쓰는 자리(①)와, 필요하면 함수를 만드는 자리(②)가 붙어 있어요.
// 한 단계를 저장·실행해서 예상 출력과 같으면 다음 단계로 넘어가요.

void main() {
  // [짧은 실행 예제]
  final exampleLocal = <String, int>{};
  final exampleServer = <String, int>{};
  exampleLocal['run-1'] = 2;
  print(exampleLocal.length);
  print(exampleServer.length);

  // [한 줄씩 읽기]
  // 1. 두 Map은 서로 다른 저장소의 역할을 흉내 내요.
  // 2. 로컬에 넣어도 서버 Map에는 자동으로 들어가지 않아요.
  // 3. 이번 주 Map은 메모리 자료라 재실행하면 초기화돼요. 영구 저장은 11주와 연결하세요.
  // [예제 예상 출력]
  // 1
  // 0

  // [단계 문제 실행]
  // 아래 세 줄은 이 파일 아래쪽의 step1, step2, step3 함수를 차례로 호출해요.
  // 각 단계의 문제와 풀 자리는 그 함수 바로 위아래에 있어요.
  step1();
  step2();
  step3();
}

// ━━━━━━━━━━ 1단계: 예제 따라 하기 ━━━━━━━━━━
// [문제] step1 안에서 phone과 cloud를 <String, String>{}로 만드세요.
//        phone['memo-1']에 '물 마시기'를 넣고 phone과 cloud를 차례로 출력하세요.
// [예상 출력]
// --- 1단계 ---
// {memo-1: 물 마시기}
// {}

void step1() {
  print('--- 1단계 ---');
  // TODO ①: 여기에 두 Map 선언, 값 넣기, 출력을 작성하세요.
}

// ━━━━━━━━━━ 2단계: 직접 작성 ━━━━━━━━━━
// [문제] step2 안에서 local과 server를 <String, int>{}로 만드세요. local['run-1']에 5를 저장하세요.
//        각 저장소의 개수를 '로컬: 1', '서버: 0' 형태로 출력하세요.
// [예상 출력]
// --- 2단계 ---
// 로컬: 1
// 서버: 0
// [값을 바꾸어 다시 실행] server['run-1'] = 5;도 넣으면 서버는 1이에요.

void step2() {
  print('--- 2단계 ---');
  // TODO ①: 여기에 두 Map 선언, 값 넣기, 개수 출력을 작성하세요.
}

// ━━━━━━━━━━ 3단계: Runnery 코드 읽기 — 올릴 일 적어 두기 ━━━━━━━━━━
// Runnery의 RecordSync(record/data/record_sync.dart)는 기록을 저장하거나 지우면 "서버에 할 일"을 적어 둬요.
//
//   final Map<String, _Op> _pending = {};
//   void recordSaved(LocalRecords local, RunningRecord record) =>
//       _mark(local, record.id, 'upsert');
//   void recordDeleted(LocalRecords local, String id) =>
//       _mark(local, id, 'delete');
//   ... _mark 안: _pending[id] = _Op(kind, ++_seq);
//
// 읽는 법: 할 일 목록은 기록 ID → 할 일 종류('upsert' 올리기 / 'delete' 지우기) Map이에요.
//   같은 기록에 또 일이 생기면 같은 키에 덮어써서 마지막 일만 남아요.
// 바로 아래 [주어진 코드]는 할 일 종류만 글자로 담게 줄인 거예요.
// [문제]
// (1) step3 안에서 recordSaved('r1'); recordSaved('r2'); recordDeleted('r1'); 을 차례로 부르세요.
// (2) pending과 pending.length를 출력하세요.
// (3) 실행 전에 두 출력을 [내 예측]에 적고 비교하세요. r1의 할 일은 왜 하나만 남았나요?
// [내 예측]
//
// [예상 출력]
// --- 3단계 ---
// {r1: delete, r2: upsert}
// 2

// [주어진 코드 — 수정하지 말고 읽기만 하세요]
final pending = <String, String>{};

void recordSaved(String id) {
  pending[id] = 'upsert';
}

void recordDeleted(String id) {
  pending[id] = 'delete';
}

void step3() {
  print('--- 3단계 ---');
  // TODO ①: 여기에 세 호출과 두 출력을 작성하세요.
}

// [내 말로 설명]
// 로컬 저장 성공과 서버 전송 성공을 따로 표시해야 하는 이유는 무엇인가요?
