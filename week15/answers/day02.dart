// 15주차 2일 해설 — 보낼 작업을 목록에 보관하기
// 문제의 결과만 출력해요. 먼저 시도한 뒤 읽고, 닫은 다음 입력을 바꾸어 다시 풀어 보세요.
// 확인 질문: 앱 종료 후 재시도하려면 대기 작업도 어디에 저장해야 하나요?
// 예상 결과:
// 5
// [run-1]

void main() {
  final local = <String, int>{};
  final pending = <String>[];
  local['run-1'] = 5;
  pending.add('run-1');
  print(local['run-1']);
  print(pending);
}
