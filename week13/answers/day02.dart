// 13주차 2일 해설 — listen으로 구독하기
// 문제의 결과만 출력해요. 먼저 시도한 뒤 읽고, 닫은 다음 입력을 바꾸어 다시 풀어 보세요.
// 확인 질문: listen 호출 시점과 콜백이 실행되는 시점은 같은가요?
// 예상 결과:
// 3
// 5
// 완료

Future<void> main() async {
  final subscription = Stream<int>.fromIterable([3, 5]).listen((km) {
    print(km);
  });
  await subscription.asFuture<void>();
  print('완료');
}
