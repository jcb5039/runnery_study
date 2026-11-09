// 15주차 1일 — 로컬 저장과 서버 저장 구분
// 실행 위치: ~/src/runnery-study
// 실행: dart run week15/day01.dart
// 예제부터 실행한 뒤 TODO에 직접 작성하세요. 정답은 answers/day01.dart에 있어요.
// 오늘도 복습 10분 → 예제 20분 → 실습 45분 → 설명과 기록 15분으로 나눠 보세요.

void main() {
  // [짧은 실행 예제]
  final exampleLocal = <String, int>{};
  final exampleServer = <String, int>{};
  exampleLocal['run-1'] = 2;
  print(exampleLocal.length);
  print(exampleServer.length);

  // [한 줄씩 읽기]
  // 1. 두 Map은 서로 다른 저장소의 역할을 흉내 내요.
  // 2. 로컬에 넣어도 서버 Map에는 자동으로 들어가지 않아요.
  // 3. 이번 주 Map은 메모리 자료라 재실행하면 초기화돼요. 영구 저장은 11주와 연결하세요.
  // [예제 예상 출력]
  // 1
  // 0

  // [직접 풀 문제]
  // main에서 local과 server를 <String, int>{}로 만드세요. local['run-1']에 5를 저장하세요.
  // 각 저장소의 개수를 '로컬: 1', '서버: 0' 형태로 출력하세요.
  //
  // [문제 부분의 예상 출력 — 예제 뒤에 이어져요]
  // 로컬: 1
  // 서버: 0
  //
  // [값을 바꾸어 다시 실행]
  // server['run-1'] = 5;도 넣으면 서버는 1이에요.
  //
  // [내 말로 설명]
  // 로컬 저장 성공과 서버 전송 성공을 따로 표시해야 하는 이유는 무엇인가요?

  // TODO: 문제의 변수 선언과 함수 호출은 이 아래에 작성하세요.
}

// [직접 만들 함수·클래스 정의 위치]
// TODO: 문제에서 새 함수나 클래스를 요구하면 여기, main의 닫는 중괄호 아래에 정의하세요.
