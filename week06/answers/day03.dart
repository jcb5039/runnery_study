// 6주차 3일 해설 — 기다리는 결과 Future
// 문제의 결과만 출력해요. 먼저 시도한 뒤 읽고, 닫은 다음 입력을 바꾸어 다시 풀어 보세요.
// 확인 질문: await 다음 print는 언제 실행되나요?
// 예상 결과:
// 불러오는 중
// 완료

Future<void> main() async {
  print('불러오는 중');
  await Future<void>.delayed(const Duration(milliseconds: 100));
  print('완료');
}
