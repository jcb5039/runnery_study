// 15주차 4일 해설 — 같은 ID로 중복 전송하기
// 문제의 결과만 출력해요. 먼저 시도한 뒤 읽고, 닫은 다음 입력을 바꾸어 다시 풀어 보세요.
// 확인 질문: 응답을 놓쳐 재전송할 때마다 새 ID를 만들면 어떤 문제가 생기나요?
// 예상 결과:
// 1
// 5

void main() {
  final server = <String, int>{};
  push(server, 'run-1', 5);
  push(server, 'run-1', 5);
  print(server.length);
  print(server['run-1']);
}

void push(Map<String, int> server, String id, int km) {
  server[id] = km;
}
