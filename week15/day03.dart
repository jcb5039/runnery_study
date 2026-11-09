// 15주차 3일 — 성공한 뒤에만 지우기
// 실행 위치: ~/src/runnery-study
// 실행: dart run week15/day03.dart
// 정답은 answers/day03.dart에 있어요.
// 오늘의 강의: week15/README.md의 "2. 성공을 확인한 뒤에만 지우기 — 3일" 섹션이에요. 그 섹션만 읽고 풀 수 있어요.
// 예제를 실행해 본 뒤 아래로 내려가며 1단계 → 2단계 → 3단계 순서로 풀어요.
// 단계마다 [문제] 바로 아래에 코드를 쓰는 자리(①)와, 필요하면 함수를 만드는 자리(②)가 붙어 있어요.
// 한 단계를 저장·실행해서 예상 출력과 같으면 다음 단계로 넘어가요.

Future<void> main() async {
  // [짧은 실행 예제]
  try {
    await exampleSend(false);
  } catch (error) {
    print('대기 유지');
  }

  // [한 줄씩 읽기]
  // 1. await는 가짜 전송 결과를 기다려요.
  // 2. 실패하면 catch로 이동해요.
  // 3. 성공이 확인되기 전에는 대기 작업을 지우지 않아요.
  // [예제 예상 출력]
  // 대기 유지

  // [단계 문제 실행]
  // 아래 세 줄은 이 파일 아래쪽의 step1, step2, step3 함수를 차례로 호출해요.
  // 각 단계의 문제와 풀 자리는 그 함수 바로 위아래에 있어요.
  await step1();
  await step2();
  await step3();
}

Future<void> exampleSend(bool online) async {
  if (!online) throw StateError('오프라인');
}

// ━━━━━━━━━━ 1단계: 예제 따라 하기 ━━━━━━━━━━
// [문제] step1 안에서 예제와 같은 try/catch를 쓰되 await exampleSend(true)를 부르세요.
//        그 바로 아래(try 안)에 '전송 성공'을 출력하고, catch에서는 '대기 유지'를 출력해요.
// [예상 출력]
// --- 1단계 ---
// 전송 성공

Future<void> step1() async {
  print('--- 1단계 ---');
  // TODO ①: 여기에 try/catch를 작성하세요.
}

// ━━━━━━━━━━ 2단계: 직접 작성 ━━━━━━━━━━
// [문제] Future<void> send(bool online) async를 정의하세요. 50밀리초 뒤 online이 false이면 StateError('오프라인')을 던지세요.
//        step2 안에서 online = false, pending = ['run-1']을 선언하세요.
//        try에서 await send(online) 성공 후에만 pending.remove('run-1')을 하세요.
//        catch에서는 '전송 실패'를 출력하고 마지막에 pending을 출력하세요.
// [예상 출력]
// --- 2단계 ---
// 전송 실패
// [run-1]
// [값을 바꾸어 다시 실행] online이 true이면 []만 출력돼요.

Future<void> step2() async {
  print('--- 2단계 ---');
  // TODO ①: 여기에 online, pending 선언과 try/catch, 출력을 작성하세요.
}

// TODO ②: 여기에 Future<void> send(bool online) async를 정의하세요.

// ━━━━━━━━━━ 3단계: Runnery 코드 읽기 — 실패하면 거기서 멈추기 ━━━━━━━━━━
// RecordSync._push의 뼈대예요(record/data/record_sync.dart).
//
//   for (final id in _pending.keys.toList()) {
//     try {
//       ... await backend.upsert(uid, record, ...) ...
//       _pending.remove(id);
//     } catch (_) {
//       // 인터넷이 없는 것으로 보고 이번에는 여기서 멈춥니다. 남은 일은 다음에 다시 합니다.
//       return;
//     }
//   }
//
// 읽는 법: 할 일을 하나씩 올려요. 올리기에 성공한 뒤에만 지우고, 실패하면 return으로 반복 전체를 끝내요.
//   toList()로 복사본을 만들어 돌기 때문에 반복 중에 원본에서 지워도 괜찮아요.
// 바로 아래 [주어진 코드]는 'r2'를 올릴 때 인터넷이 끊긴다고 정한 거예요.
// [문제]
// (1) step3 안에서 await push(); 를 부른 뒤 server와 pending을 출력하세요.
// (2) 실행 전에 출력 세 줄을 [내 예측]에 적고 비교하세요.
// (3) r3는 시도조차 안 했어요. 왜 그런가요? 다음 동기화 때는 무엇부터 올리나요?
// [내 예측]
//
// [예상 출력]
// --- 3단계 ---
// 여기서 멈춤: r2
// [r1]
// [r2, r3]

// [주어진 코드 — 수정하지 말고 읽기만 하세요]
final pending = <String>['r1', 'r2', 'r3'];
final server = <String>[];

Future<void> upload(String id) async {
  await Future<void>.delayed(const Duration(milliseconds: 20));
  if (id == 'r2') throw StateError('인터넷 끊김');
  server.add(id);
}

Future<void> push() async {
  for (final id in pending.toList()) {
    try {
      await upload(id);
      pending.remove(id);
    } catch (_) {
      print('여기서 멈춤: $id');
      return;
    }
  }
}

Future<void> step3() async {
  print('--- 3단계 ---');
  // TODO ①: 여기에 push 기다리기와 두 출력을 작성하세요.
}

// [내 말로 설명]
// pending을 await보다 먼저 지우면 실패했을 때 무엇을 잃나요?
