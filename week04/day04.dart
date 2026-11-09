// 4주차 4일 — 함수를 값으로 전달하고 걸러내기
// 실행 위치: ~/src/runnery-study
// 실행: dart run week04/day04.dart
// 정답은 answers/day04.dart에 있어요.
// 오늘의 강의: week04/README.md의 "3. 이름 없는 함수를 넘겨서 거르기: where — 4일" 섹션이에요. 그 섹션만 읽고 풀 수 있어요.
// 예제를 실행해 본 뒤 아래로 내려가며 1단계 → 2단계 → 3단계 순서로 풀어요.
// 단계마다 [문제] 바로 아래에 코드를 쓰는 자리(①)와, 필요하면 함수를 만드는 자리(②)가 붙어 있어요.
// 한 단계를 저장·실행해서 예상 출력과 같으면 다음 단계로 넘어가요.

void main() {
  // [짧은 실행 예제]
  final examples = [1, 3, 5];
  final selected = examples.where((km) {
    return km >= 3;
  }).toList();
  print(selected);

  // [한 줄씩 읽기]
  // 1. where에 이름 없는 함수를 전달해요. 몸통을 { return ...; }으로 쓴 모양이에요.
  // 2. 각 값이 km로 들어오고 true인 값만 남아요.
  // 3. toList()로 결과를 List로 만들어요.
  // [예제 예상 출력]
  // [3, 5]

  // [단계 문제 실행]
  // 아래 세 줄은 이 파일 아래쪽의 step1, step2, step3 함수를 차례로 호출해요.
  // 각 단계의 문제와 풀 자리는 그 함수 바로 위아래에 있어요.
  step1();
  step2();
  step3();
}

// ━━━━━━━━━━ 1단계: 예제 따라 하기 ━━━━━━━━━━
// [문제] step1 안에서 scores = [40, 75, 90]을 선언하세요.
//        where에 (s) => s >= 70을 넘기고 toList()로 바꾼 결과를 출력하세요.
// [예상 출력]
// --- 1단계 ---
// [75, 90]

void step1() {
  print('--- 1단계 ---');
  // TODO ①: 여기에 scores 선언과 where 결과 출력을 작성하세요.
}

// ━━━━━━━━━━ 2단계: 직접 작성 ━━━━━━━━━━
// [문제] step2 안에서 distances = [2.0, 4.0, 6.0]을 선언하세요.
//        where에 (km) => km >= 4를 전달하고 toList로 바꾼 결과를 출력하세요.
//        같은 조건을 for-in과 if로 작성해 만든 목록도 출력하세요.
// [예상 출력]
// --- 2단계 ---
// [4.0, 6.0]
// [4.0, 6.0]
// [값을 바꾸어 다시 실행] 기준을 7로 바꾸면 두 출력 모두 []예요.

void step2() {
  print('--- 2단계 ---');
  // TODO ①: 여기에 distances 선언, where 결과 출력, for-in으로 만든 목록 출력을 작성하세요.
}

// ━━━━━━━━━━ 3단계: Runnery 코드 읽기 — 지운 기록 빼고 보여주기 ━━━━━━━━━━
// Runnery 기록 목록 화면(record/list/record_list_page.dart)은 방금 지운 기록을 목록에서 빼고 보여줘요.
//
//   List<RunningRecord> get records => (widget.records ?? _saved)
//       .where((r) => !_deleted.contains(r.id))
//       .toList();
//
// 읽는 법: 핵심은 가운데 줄이에요. 기록 r의 id가 지운 목록(_deleted)에 들어 있지 않은 것만 남겨요.
//   contains는 "목록에 이 값이 있나요?", 앞의 !는 "아니다"예요.
// 바로 아래 [주어진 코드]는 기록 대신 id 글자 목록으로 같은 일을 하는 함수예요.
// [문제]
// (1) 실행 전에 visibleIds(['a', 'b', 'c'], ['b'])와 visibleIds(['a', 'b', 'c'], [])의 결과를 [내 예측]에 적으세요.
// (2) step3 안에서 두 호출을 각각 print 안에 넣어 실행하고 비교하세요.
// (3) 첫 번째 호출에서 where에 넘긴 함수는 몇 번 호출되나요? 'b'일 때 그 함수는 무엇을 돌려주나요?
// [내 예측]
//
// [예상 출력]
// --- 3단계 ---
// [a, c]
// [a, b, c]

// [주어진 코드 — 수정하지 말고 읽기만 하세요]
List<String> visibleIds(List<String> all, List<String> deleted) {
  return all.where((id) => !deleted.contains(id)).toList();
}

void step3() {
  print('--- 3단계 ---');
  // TODO ①: 여기서 두 호출을 각각 print 안에 넣으세요.
}

// [내 말로 설명]
// where 안의 함수는 누가 몇 번 호출하나요?
