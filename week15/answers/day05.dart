// 15주차 5일 해설 — 삭제도 전달할 작업
// 문제의 결과만 출력해요. 먼저 시도한 뒤 읽고, 닫은 다음 입력을 바꾸어 다시 풀어 보세요.
// 확인 질문: 삭제 정보를 잊은 채 서버 기록을 내려받으면 지운 기록이 다시 나타날 수 있나요?
// 예상 결과:
// {}
// {}
// []

void main() {
  final local = {'run-1': 5};
  final server = {'run-1': 5};
  final deletedIds = <String>[];
  local.remove('run-1');
  deletedIds.add('run-1');
  for (final id in deletedIds) {
    server.remove(id);
  }
  deletedIds.clear();
  print(local);
  print(server);
  print(deletedIds);
}
