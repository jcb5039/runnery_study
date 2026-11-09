// 6주차 2일 — 없는 값에 안전하게 접근하기
// 실행 위치: ~/src/runnery-study
// 실행: dart run week06/day02.dart
// 예제부터 실행한 뒤 TODO에 직접 작성하세요. 정답은 answers/day02.dart에 있어요.
// 오늘도 복습 10분 → 예제 20분 → 실습 45분 → 설명과 기록 15분으로 나눠 보세요.

void main() {
  // [짧은 실행 예제]
  print(exampleLength(null));
  print(exampleLength('아침'));

  // [한 줄씩 읽기]
  // 1. String? 매개변수에는 null도 전달할 수 있어요.
  // 2. ?.length는 값이 있을 때만 길이를 읽어요. 없으면 null이에요.
  // 3. ?? 0이 null을 0으로 바꿔요.
  // [예제 예상 출력]
  // 0
  // 2

  // [직접 풀 문제]
  // main 아래에 int memoLength(String? memo)를 정의하고 memo?.length ?? 0을 반환하세요.
  // main에서 memoLength(null), memoLength('달리기')를 출력하세요. !는 쓰지 마세요.
  //
  // [문제 부분의 예상 출력 — 예제 뒤에 이어져요]
  // 0
  // 3
  //
  // [값을 바꾸어 다시 실행]
  // ''를 전달하면 0이에요.
  //
  // [내 말로 설명]
  // !로 값이 있다고 단정했는데 실제 null이면 어떻게 될까요?

  // TODO: 문제의 변수 선언과 함수 호출은 이 아래에 작성하세요.
}

int exampleLength(String? text) => text?.length ?? 0;

// [직접 만들 함수·클래스 정의 위치]
// TODO: 문제에서 새 함수나 클래스를 요구하면 여기, main의 닫는 중괄호 아래에 정의하세요.
