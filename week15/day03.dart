// 15주차 3일 — 실패한 작업은 남기기
// 실행 위치: ~/src/runnery-study
// 실행: dart run week15/day03.dart
// 예제부터 실행한 뒤 TODO에 직접 작성하세요. 정답은 answers/day03.dart에 있어요.
// 오늘도 복습 10분 → 예제 20분 → 실습 45분 → 설명과 기록 15분으로 나눠 보세요.

Future<void> main() async {
  // [짧은 실행 예제]
  try {
    await exampleSend(false);
  } catch (error) {
    print('대기 유지');
  }

  // [한 줄씩 읽기]
  // 1. await는 가짜 전송 결과를 기다려요.
  // 2. 실패하면 catch로 이동해요.
  // 3. 성공이 확인되기 전에는 대기 작업을 지우지 않아요.
  // [예제 예상 출력]
  // 대기 유지

  // [직접 풀 문제]
  // main 아래 Future<void> send(bool online) async를 정의하세요. 50밀리초 뒤 online이 false이면 StateError('오프라인')을 던지세요.
  // main에서 online = false, pending = ['run-1']을 선언하세요.
  // try에서 await send(online) 성공 후에만 pending.remove('run-1')을 하세요.
  // catch에서는 '전송 실패'를 출력하고 마지막에 pending을 출력하세요.
  //
  // [문제 부분의 예상 출력 — 예제 뒤에 이어져요]
  // 전송 실패
  // [run-1]
  //
  // [값을 바꾸어 다시 실행]
  // online이 true이면 []만 출력돼요.
  //
  // [내 말로 설명]
  // pending을 await보다 먼저 지우면 실패했을 때 무엇을 잃나요?

  // TODO: 문제의 변수 선언과 함수 호출은 이 아래에 작성하세요.
}

Future<void> exampleSend(bool online) async {
  if (!online) throw StateError('오프라인');
}

// [직접 만들 함수·클래스 정의 위치]
// TODO: 문제에서 새 함수나 클래스를 요구하면 여기, main의 닫는 중괄호 아래에 정의하세요.
