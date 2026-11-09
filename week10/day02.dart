// 10주차 2일 — Duration과 분·초 표시
// 실행 위치: ~/src/runnery-study
// 실행: dart run week10/day02.dart
// 예제부터 실행한 뒤 TODO에 직접 작성하세요. 정답은 answers/day02.dart에 있어요.
// 오늘도 복습 10분 → 예제 20분 → 실습 45분 → 설명과 기록 15분으로 나눠 보세요.

void main() {
  // [짧은 실행 예제]
  final example = Duration(seconds: 125);
  print(example.inMinutes);
  print(example.inSeconds % 60);

  // [한 줄씩 읽기]
  // 1. Duration은 시간의 길이를 나타내요.
  // 2. inMinutes는 완성된 분의 수예요.
  // 3. 전체 초를 60으로 나눈 나머지가 남은 초예요.
  // [예제 예상 출력]
  // 2
  // 5

  // [직접 풀 문제]
  // main에서 duration = Duration(seconds: 185)를 선언하세요.
  // 분과 남은 초를 구해 '3분 5초'를 출력하세요.
  //
  // [문제 부분의 예상 출력 — 예제 뒤에 이어져요]
  // 3분 5초
  //
  // [값을 바꾸어 다시 실행]
  // 60초이면 1분 0초예요.
  //
  // [내 말로 설명]
  // inSeconds와 남은 초는 왜 같지 않나요?

  // TODO: 문제의 변수 선언과 함수 호출은 이 아래에 작성하세요.
}

// [직접 만들 함수·클래스 정의 위치]
// TODO: 문제에서 새 함수나 클래스를 요구하면 여기, main의 닫는 중괄호 아래에 정의하세요.
