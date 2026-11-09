// 6주차 6일 해설 — 비동기 함수의 실패도 기다려 처리하기
// 문제의 결과만 출력해요. 먼저 시도한 뒤 읽고, 닫은 다음 입력을 바꾸어 다시 풀어 보세요.
// 확인 질문: await를 빼면 catch가 기다린 뒤 발생한 오류를 같은 방식으로 받을까요?
// 예상 결과:
// 3.0
// 처리 끝

Future<void> main() async {
  final succeed = true;
  try {
    print(await loadDistance(succeed));
  } catch (error) {
    print('불러오기 실패');
  } finally {
    print('처리 끝');
  }
}

Future<double> loadDistance(bool succeed) async {
  await Future<void>.delayed(const Duration(milliseconds: 100));
  if (!succeed) throw StateError('불러오기 실패');
  return 3.0;
}
