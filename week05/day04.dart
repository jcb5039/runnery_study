// 5주차 4일 — getter로 계산한 값 읽기
// 실행 위치: ~/src/runnery-study
// 실행: dart run week05/day04.dart
// 예제부터 실행한 뒤 TODO에 직접 작성하세요. 정답은 answers/day04.dart에 있어요.
// 오늘도 복습 10분 → 예제 20분 → 실습 45분 → 설명과 기록 15분으로 나눠 보세요.

void main() {
  // [짧은 실행 예제]
  final example = ExampleRun(2.0);
  print(example.meters);

  // [한 줄씩 읽기]
  // 1. get meters는 getter를 정의해요.
  // 2. 읽을 때 () 없이 .meters로 써요.
  // 3. 값을 읽는 순간 식을 계산해요.
  // [예제 예상 출력]
  // 2000.0

  // [직접 풀 문제]
  // main 아래에 거리(double distanceKm), 시간(int seconds)을 받는 PracticeRun을 정의하세요.
  // double get averageSpeed를 만들고 seconds <= 0이면 0, 아니면 distanceKm / (seconds / 3600)을 반환하세요.
  // main에서 PracticeRun(2.0, 1200).averageSpeed와 PracticeRun(2.0, 0).averageSpeed를 출력하세요.
  //
  // [문제 부분의 예상 출력 — 예제 뒤에 이어져요]
  // 6.0
  // 0.0
  //
  // [값을 바꾸어 다시 실행]
  // PracticeRun(5.0, 1800)은 10.0km/h예요.
  //
  // [내 말로 설명]
  // 초를 시간으로 바꾸는 3600은 왜 필요한가요?

  // TODO: 문제의 변수 선언과 함수 호출은 이 아래에 작성하세요.
}

class ExampleRun {
  final double km;
  ExampleRun(this.km);
  double get meters => km * 1000;
}

// [직접 만들 함수·클래스 정의 위치]
// TODO: 문제에서 새 함수나 클래스를 요구하면 여기, main의 닫는 중괄호 아래에 정의하세요.
