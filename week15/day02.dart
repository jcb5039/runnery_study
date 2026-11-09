// 15주차 2일 — 보낼 작업을 목록에 보관하기
// 실행 위치: ~/src/runnery-study
// 실행: dart run week15/day02.dart
// 예제부터 실행한 뒤 TODO에 직접 작성하세요. 정답은 answers/day02.dart에 있어요.
// 오늘도 복습 10분 → 예제 20분 → 실습 45분 → 설명과 기록 15분으로 나눠 보세요.

void main() {
  // [짧은 실행 예제]
  final examplePending = <String>[];
  examplePending.add('run-a');
  print(examplePending);

  // [한 줄씩 읽기]
  // 1. pending은 아직 서버로 보내지 못한 작업이에요.
  // 2. 로컬 기록과 대기 작업은 서로 다른 역할이에요.
  // [예제 예상 출력]
  // [run-a]

  // [직접 풀 문제]
  // main에서 local = <String, int>{}, pending = <String>[]를 선언하세요.
  // 'run-1' 거리 5를 local에 넣고 같은 ID를 pending에 추가하세요.
  // local['run-1']과 pending을 출력하세요. 서버 전송은 아직 하지 않아요.
  //
  // [문제 부분의 예상 출력 — 예제 뒤에 이어져요]
  // 5
  // [run-1]
  //
  // [값을 바꾸어 다시 실행]
  // 'run-2' 거리 3을 같은 순서로 추가하면 대기 목록은 [run-1, run-2]예요.
  //
  // [내 말로 설명]
  // 앱 종료 후 재시도하려면 대기 작업도 어디에 저장해야 하나요?

  // TODO: 문제의 변수 선언과 함수 호출은 이 아래에 작성하세요.
}

// [직접 만들 함수·클래스 정의 위치]
// TODO: 문제에서 새 함수나 클래스를 요구하면 여기, main의 닫는 중괄호 아래에 정의하세요.
