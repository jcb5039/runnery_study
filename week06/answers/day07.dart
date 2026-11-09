// 6주차 7일 해설 — 복습: 거리와 메모 불러오기
// 문제의 결과만 출력해요. 먼저 시도한 뒤 읽고, 닫은 다음 입력을 바꾸어 다시 풀어 보세요.
// 확인 질문: 어느 줄에서 기다리고, 어느 값이 없을 수 있나요?
// 예상 결과:
// 시작
// 3.0
// 메모 없음
// 끝

Future<void> main() async {
  String? memo = null;
  print('시작');
  final km = await loadDistance();
  print(km);
  print(memo ?? '메모 없음');
  print('끝');
}

Future<double> loadDistance() async {
  await Future<void>.delayed(const Duration(milliseconds: 100));
  return 3.0;
}
