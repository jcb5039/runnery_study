// 15주차 4일 — 같은 ID로 중복 전송하기
// 실행 위치: ~/src/runnery-study
// 실행: dart run week15/day04.dart
// 예제부터 실행한 뒤 TODO에 직접 작성하세요. 정답은 answers/day04.dart에 있어요.
// 오늘도 복습 10분 → 예제 20분 → 실습 45분 → 설명과 기록 15분으로 나눠 보세요.

void main() {
  // [짧은 실행 예제]
  final exampleServer = <String, int>{};
  exampleServer['a'] = 2;
  exampleServer['a'] = 2;
  print(exampleServer.length);

  // [한 줄씩 읽기]
  // 1. Map은 같은 키에 다시 넣으면 그 키의 값을 바꿔요.
  // 2. 같은 ID를 쓰면 항목이 두 개로 늘어나지 않아요.
  // 3. 실제 서버도 중복 처리 정책을 별도로 구현해야 해요.
  // [예제 예상 출력]
  // 1

  // [직접 풀 문제]
  // main 아래 void push(Map<String, int> server, String id, int km)를 정의하고 server[id] = km를 하세요.
  // main에서 빈 server를 만들고 push(server, 'run-1', 5)를 두 번 호출하세요.
  // server.length와 server['run-1']을 출력하세요.
  //
  // [문제 부분의 예상 출력 — 예제 뒤에 이어져요]
  // 1
  // 5
  //
  // [값을 바꾸어 다시 실행]
  // 두 번째 ID를 'run-2'로 바꾸면 개수는 2예요.
  //
  // [내 말로 설명]
  // 응답을 놓쳐 재전송할 때마다 새 ID를 만들면 어떤 문제가 생기나요?

  // TODO: 문제의 변수 선언과 함수 호출은 이 아래에 작성하세요.
}

// [직접 만들 함수·클래스 정의 위치]
// TODO: 문제에서 새 함수나 클래스를 요구하면 여기, main의 닫는 중괄호 아래에 정의하세요.
