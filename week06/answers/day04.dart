// 6주차 4일 해설 — Future 값을 기다려 받기
// 문제의 결과만 출력해요. 먼저 시도한 뒤 읽고, 닫은 다음 입력을 바꾸어 다시 풀어 보세요.
// 확인 질문: Future<double>과 double은 어떻게 다른가요?
// 예상 결과:
// 3.0

Future<void> main() async {
  final km = await loadDistance();
  print(km);
}

Future<double> loadDistance() async {
  await Future<void>.delayed(const Duration(milliseconds: 100));
  return 3.0;
}
