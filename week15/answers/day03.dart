// 15주차 3일 해설 — 실패한 작업은 남기기
// 문제의 결과만 출력해요. 먼저 시도한 뒤 읽고, 닫은 다음 입력을 바꾸어 다시 풀어 보세요.
// 확인 질문: pending을 await보다 먼저 지우면 실패했을 때 무엇을 잃나요?
// 예상 결과:
// 전송 실패
// [run-1]

Future<void> main() async {
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
