// 13주차 1일 해설 — 여러 번 도착하는 값 Stream
// 문제의 결과만 출력해요. 먼저 시도한 뒤 읽고, 닫은 다음 입력을 바꾸어 다시 풀어 보세요.
// 확인 질문: Future 하나와 Stream 하나가 전달하는 값의 횟수는 어떻게 다른가요?
// 예상 결과:
// 2
// 4
// 6
// 완료

Future<void> main() async {
  final distances = Stream<int>.fromIterable([2, 4, 6]);
  await for (final km in distances) {
    print(km);
  }
  print('완료');
}
