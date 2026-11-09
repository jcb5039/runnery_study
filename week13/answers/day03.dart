// 13주차 3일 해설 — 일정 간격의 가짜 위치 이벤트
// 문제의 결과만 출력해요. 먼저 시도한 뒤 읽고, 닫은 다음 입력을 바꾸어 다시 풀어 보세요.
// 확인 질문: take가 없으면 이 스트림은 스스로 끝나나요?
// 예상 결과:
// 100
// 200
// 300

Future<void> main() async {
  final meters = Stream<int>.periodic(
    const Duration(milliseconds: 50),
    (index) => (index + 1) * 100,
  ).take(3);
  await for (final value in meters) {
    print(value);
  }
}
