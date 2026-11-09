// 13주차 7일 해설 — 복습: 가짜 GPS 합산과 권한 분기
// 문제의 결과만 출력해요. 먼저 시도한 뒤 읽고, 닫은 다음 입력을 바꾸어 다시 풀어 보세요.
// 확인 질문: 권한 없음, 앱 비활성화, 화면 제거는 서로 어떤 상태인가요?
// 예상 결과:
// 총 300m

bool permissionGranted = true; // 입력: 실제 권한 요청을 대신하는 연습 값

Future<void> main() async {
  if (!permissionGranted) {
    print('위치 권한 없음');
    return;
  }
  var total = 0;
  await for (final meters in Stream<int>.fromIterable([100, 120, 80])) {
    total += meters;
  }
  print('총 ${total}m');
}
