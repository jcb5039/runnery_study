// 15주차 3일 해설 — 성공한 뒤에만 지우기
// 문제의 결과만 출력해요. 먼저 단계마다 직접 시도한 뒤 읽고, 닫은 다음 입력을 바꾸어 다시 풀어 보세요.
// 3단계 설명: r1은 성공해서 server로 가고 pending에서 지워져요. r2에서 실패하면 catch의 return이
//            push 전체를 끝내서 r3는 시도하지 않아요. 남은 [r2, r3]는 다음 동기화 때 다시 올려요.

Future<void> main() async {
  await step1();
  await step2();
  await step3();
}

// 1단계에서 쓰는 예제 함수예요.
Future<void> exampleSend(bool online) async {
  if (!online) throw StateError('오프라인');
}

// ━━━━━━━━━━ 1단계 ━━━━━━━━━━
Future<void> step1() async {
  print('--- 1단계 ---');
  try {
    await exampleSend(true);
    print('전송 성공');
  } catch (error) {
    print('대기 유지');
  }
}

// ━━━━━━━━━━ 2단계 ━━━━━━━━━━
Future<void> step2() async {
  print('--- 2단계 ---');
  final online = false;
  final pending = ['run-1'];
  try {
    await send(online);
    pending.remove('run-1');
  } catch (error) {
    print('전송 실패');
  }
  print(pending);
}

Future<void> send(bool online) async {
  await Future<void>.delayed(const Duration(milliseconds: 50));
  if (!online) throw StateError('오프라인');
}

// ━━━━━━━━━━ 3단계 ━━━━━━━━━━
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
  await push();
  print(server);
  print(pending);
}
