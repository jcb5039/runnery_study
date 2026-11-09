// 15주차 6일 — 키와 값 짝 꺼내기
// 실행 위치: ~/src/runnery-study
// 실행: dart run week15/day06.dart
// 정답은 answers/day06.dart에 있어요.
// 오늘의 강의: week15/README.md의 "3. 같은 키, 지우기, 키와 값 짝 꺼내기 — 4~6일" 섹션이에요. 그 섹션만 읽고 풀 수 있어요.
// 예제를 실행해 본 뒤 아래로 내려가며 1단계 → 2단계 → 3단계 순서로 풀어요.
// 단계마다 [문제] 바로 아래에 코드를 쓰는 자리(①)와, 필요하면 함수를 만드는 자리(②)가 붙어 있어요.
// 한 단계를 저장·실행해서 예상 출력과 같으면 다음 단계로 넘어가요.

void main() {
  // [짧은 실행 예제]
  final exampleLocal = {'a': 2};
  final exampleRemote = {'a': 3, 'b': 4};
  exampleLocal.addAll(exampleRemote);
  print(exampleLocal);

  // [한 줄씩 읽기]
  // 1. addAll은 다른 Map의 키와 값을 넣어요.
  // 2. 같은 키가 있으면 전달한 값으로 바뀌어요.
  // 3. 실제 서비스의 충돌 규칙은 더 복잡해요. 오늘은 미전송 로컬 값을 보존하는 단순 규칙만 써요.
  // [예제 예상 출력]
  // {a: 3, b: 4}

  // [단계 문제 실행]
  // 아래 세 줄은 이 파일 아래쪽의 step1, step2, step3 함수를 차례로 호출해요.
  // 각 단계의 문제와 풀 자리는 그 함수 바로 위아래에 있어요.
  step1();
  step2();
  step3();
}

// ━━━━━━━━━━ 1단계: 예제 따라 하기 ━━━━━━━━━━
// [문제] step1 안에서 m = {'a': 1, 'b': 2}를 만드세요.
//        for-in으로 m.entries를 돌며 '${entry.key}=${entry.value}'를 출력하세요.
// [예상 출력]
// --- 1단계 ---
// a=1
// b=2

void step1() {
  print('--- 1단계 ---');
  // TODO ①: 여기에 m 선언과 entries 반복을 작성하세요.
}

// ━━━━━━━━━━ 2단계: 직접 작성 ━━━━━━━━━━
// [문제] step2 안에서 local = {'a': 5}, remote = {'a': 3, 'b': 2}, pending = ['a']를 선언하세요.
//        remote.entries를 for-in으로 꺼내 entry.key가 pending에 없는 경우에만 local[entry.key] = entry.value를 하세요.
//        local을 출력하세요.
// [예상 출력]
// --- 2단계 ---
// {a: 5, b: 2}
// [값을 바꾸어 다시 실행] pending을 <String>[]로 바꾸면 {a: 3, b: 2}예요.

void step2() {
  print('--- 2단계 ---');
  // TODO ①: 여기에 세 변수 선언, entries 반복, 출력을 작성하세요.
}

// ━━━━━━━━━━ 3단계: Runnery 코드 읽기 — 내려받을 때 폰의 것을 우선하기 ━━━━━━━━━━
// RecordSync._pull의 핵심이에요(record/data/record_sync.dart).
//
//   for (final item in changes.items) {
//     // 폰에서 바꾼 것이 아직 서버에 안 올라갔으면 폰의 것이 우선입니다.
//     if (_pending.containsKey(item.id)) continue;
//     if (item.deleted) {
//       await local.applyRemoteDelete(item.id);
//     } else {
//       await local.applyRemote(item.record!);
//     }
//   }
//
// 읽는 법: 서버의 변경을 하나씩 보며, 폰에 아직 못 올린 일이 있는 기록은 건너뛰어요(containsKey).
//   서버에서 지워진 기록은 폰에서도 지우고, 아니면 폰에 반영해요.
// 바로 아래 [주어진 코드]에서 changes의 값이 null이면 "서버에서 지워짐"이라는 뜻으로 정했어요.
// [문제]
// (1) step3 안에서 pull();을 부른 뒤 local과 pending을 출력하세요.
// (2) 실행 전에 두 출력을 [내 예측]에 적고 비교하세요.
// (3) 서버에는 r2가 9.9인데 폰의 r2는 왜 3.0으로 남았나요?
// [내 예측]
//
// [예상 출력]
// --- 3단계 ---
// {r2: 3.0, r3: 4.4}
// {r2: upsert}

// [주어진 코드 — 수정하지 말고 읽기만 하세요]
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
  // TODO ①: 여기에 pull 호출과 두 출력을 작성하세요.
}

// [내 말로 설명]
// 이 연습 규칙은 어떤 값을 우선하며, 왜 실제 충돌 해결 전체를 대신하지 못하나요?
