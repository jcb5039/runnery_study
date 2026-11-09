// 15주차 6일 — 서버에서 목록 받기와 충돌
// 실행 위치: ~/src/runnery-study
// 실행: dart run week15/day06.dart
// 예제부터 실행한 뒤 TODO에 직접 작성하세요. 정답은 answers/day06.dart에 있어요.
// 오늘도 복습 10분 → 예제 20분 → 실습 45분 → 설명과 기록 15분으로 나눠 보세요.

void main() {
  // [짧은 실행 예제]
  final exampleLocal = {'a': 2};
  final exampleRemote = {'a': 3, 'b': 4};
  exampleLocal.addAll(exampleRemote);
  print(exampleLocal);

  // [한 줄씩 읽기]
  // 1. addAll은 다른 Map의 키와 값을 넣어요.
  // 2. 같은 키가 있으면 전달한 값으로 바뀌어요.
  // 3. 실제 서비스의 충돌 규칙은 더 복잡해요. 오늘은 미전송 로컬 값을 보존하는 단순 규칙만 써요.
  // [예제 예상 출력]
  // {a: 3, b: 4}

  // [직접 풀 문제]
  // main에서 local = {'a': 5}, remote = {'a': 3, 'b': 2}, pending = ['a']를 선언하세요.
  // remote.entries를 for-in으로 꺼내 entry.key가 pending에 없는 경우에만 local[entry.key] = entry.value를 하세요.
  // local을 출력하세요. entries는 키와 값 쌍의 모음이에요.
  //
  // [문제 부분의 예상 출력 — 예제 뒤에 이어져요]
  // {a: 5, b: 2}
  //
  // [값을 바꾸어 다시 실행]
  // pending을 <String>[]로 바꾸면 {a: 3, b: 2}예요.
  //
  // [내 말로 설명]
  // 이 연습 규칙은 어떤 값을 우선하며, 왜 실제 충돌 해결 전체를 대신하지 못하나요?

  // TODO: 문제의 변수 선언과 함수 호출은 이 아래에 작성하세요.
}

// [직접 만들 함수·클래스 정의 위치]
// TODO: 문제에서 새 함수나 클래스를 요구하면 여기, main의 닫는 중괄호 아래에 정의하세요.
