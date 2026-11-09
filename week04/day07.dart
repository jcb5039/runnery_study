// 4주차 7일 — 복습: 기록 목록에서 이름 모으기
// 실행 위치: ~/src/runnery-study
// 실행: dart run week04/day07.dart
// 정답은 answers/day07.dart에 있어요.
// 오늘의 강의: week04/README.md의 "1~4번 섹션 전체(7일은 2. Map: 이름표로 값 찾기의 7일 부분)" 섹션이에요. 그 섹션만 읽고 풀 수 있어요.
// 예제를 실행해 본 뒤 아래로 내려가며 1단계 → 2단계 → 3단계 순서로 풀어요.
// 단계마다 [문제] 바로 아래에 코드를 쓰는 자리(①)와, 필요하면 함수를 만드는 자리(②)가 붙어 있어요.
// 한 단계를 저장·실행해서 예상 출력과 같으면 다음 단계로 넘어가요.

void main() {
  // [짧은 실행 예제]
  final example = <String, String>{'name': '수진'};
  print(example['name']);

  // [한 줄씩 읽기]
  // 1. Map 하나를 만들어요.
  // 2. 오늘은 Map 여러 개를 List에 넣고 꺼내요.
  // [예제 예상 출력]
  // 수진

  // [단계 문제 실행]
  // 아래 세 줄은 이 파일 아래쪽의 step1, step2, step3 함수를 차례로 호출해요.
  // 각 단계의 문제와 풀 자리는 그 함수 바로 위아래에 있어요.
  step1();
  step2();
  step3();
}

// ━━━━━━━━━━ 1단계: 예제 따라 하기 ━━━━━━━━━━
// [문제] step1 안에서 days = <Map<String, String>>[{'day': '월', 'memo': '휴식'}, {'day': '화', 'memo': '5km'}]를 선언하세요.
//        days[0]['memo']와 days.length를 차례로 출력하세요.
// [예상 출력]
// --- 1단계 ---
// 휴식
// 2

void step1() {
  print('--- 1단계 ---');
  // TODO ①: 여기에 days 선언과 두 줄 출력을 작성하세요.
}

// ━━━━━━━━━━ 2단계: 직접 작성 ━━━━━━━━━━
// [문제] step2 안에서 records = <Map<String, String>>[{'name': '민수'}, {'name': '지우'}]를 선언하세요.
//        for-in으로 각 record의 name을 출력하세요.
//        map으로 이름을 모아 toList() 결과도 출력하세요.
// [예상 출력]
// --- 2단계 ---
// 민수
// 지우
// [민수, 지우]
// [값을 바꾸어 다시 실행] {'name': '하늘'}을 추가하면 한 줄이 추가되고 목록에도 하늘이 들어가요.

void step2() {
  print('--- 2단계 ---');
  // TODO ①: 여기에 records 선언, for-in 출력, map 결과 출력을 작성하세요.
}

// ━━━━━━━━━━ 3단계: Runnery 코드 읽기 — id로 기록 찾기 ━━━━━━━━━━
// Runnery 저장소(record/data/running_record_store.dart)는 id가 같은 기록을 이렇게 찾아요.
//
//   final current = (await load()).where((r) => r.id == id).firstOrNull;
//
// 읽는 법: load()로 받은 기록 목록에서 id가 같은 기록만 남겨요. await와 firstOrNull은 나중에 배워요.
// 바로 아래 [주어진 코드]는 기록 대신 Map 목록에서 같은 일을 하는 함수예요.
// [문제]
// (1) 실행 전에 findById(saved, 'r2').length, findById(saved, 'r2'), findById(saved, 'r9')의 결과를 [내 예측]에 적으세요.
// (2) step3 안에서 세 값을 차례로 출력하고 비교하세요.
// (3) where에 넘긴 함수의 r에는 무엇이 들어오나요? 글자 하나인가요, Map 하나인가요?
// [내 예측]
//
// [예상 출력]
// --- 3단계 ---
// 1
// [{id: r2, name: 지우}]
// []

// [주어진 코드 — 수정하지 말고 읽기만 하세요]
final saved = <Map<String, String>>[
  {'id': 'r1', 'name': '민수'},
  {'id': 'r2', 'name': '지우'},
];

List<Map<String, String>> findById(List<Map<String, String>> records, String id) {
  return records.where((r) => r['id'] == id).toList();
}

void step3() {
  print('--- 3단계 ---');
  // TODO ①: 여기서 세 값을 차례로 출력하세요.
}

// [내 말로 설명]
// for-in이 꺼내는 것은 이름인가요, Map인가요?
