// 15주차 1일 해설 — 로컬 저장과 서버 저장 구분
// 문제의 결과만 출력해요. 먼저 시도한 뒤 읽고, 닫은 다음 입력을 바꾸어 다시 풀어 보세요.
// 확인 질문: 로컬 저장 성공과 서버 전송 성공을 따로 표시해야 하는 이유는 무엇인가요?
// 예상 결과:
// 로컬: 1
// 서버: 0

void main() {
  final local = <String, int>{};
  final server = <String, int>{};
  local['run-1'] = 5;
  print('로컬: ${local.length}');
  print('서버: ${server.length}');
}
