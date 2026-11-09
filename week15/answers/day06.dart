// 15주차 6일 해설 — 서버에서 목록 받기와 충돌
// 문제의 결과만 출력해요. 먼저 시도한 뒤 읽고, 닫은 다음 입력을 바꾸어 다시 풀어 보세요.
// 확인 질문: 이 연습 규칙은 어떤 값을 우선하며, 왜 실제 충돌 해결 전체를 대신하지 못하나요?
// 예상 결과:
// {a: 5, b: 2}

void main() {
  final local = {'a': 5};
  final remote = {'a': 3, 'b': 2};
  final pending = ['a'];
  for (final entry in remote.entries) {
    if (!pending.contains(entry.key)) local[entry.key] = entry.value;
  }
  print(local);
}
