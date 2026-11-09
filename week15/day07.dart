// 15주차 7일 — 복습: 실패와 재시도
// 실행 위치: ~/src/runnery-study
// 실행: dart run week15/day07.dart
// 정답은 answers/day07.dart에 있어요.
// 오늘의 강의: week15/README.md의 "1~3번 섹션과 README의 "7일" 안내" 섹션이에요. 그 섹션만 읽고 풀 수 있어요.
// 예제를 실행해 본 뒤 아래로 내려가며 1단계 → 2단계 → 3단계 순서로 풀어요.
// 단계마다 [문제] 바로 아래에 코드를 쓰는 자리(①)와, 필요하면 함수를 만드는 자리(②)가 붙어 있어요.
// 한 단계를 저장·실행해서 예상 출력과 같으면 다음 단계로 넘어가요.

Future<void> main() async {
  // [짧은 실행 예제]
  print('로컬 저장 → 대기 등록 → 전송 시도 → 성공한 작업 제거');

  // [한 줄씩 읽기]
  // 1. 오늘은 같은 프로세스 안에서 실패와 재시도를 연속으로 관찰해요.
  // [예제 예상 출력]
  // 로컬 저장 → 대기 등록 → 전송 시도 → 성공한 작업 제거

  // [단계 문제 실행]
  // 아래 세 줄은 이 파일 아래쪽의 step1, step2, step3 함수를 차례로 호출해요.
  // 각 단계의 문제와 풀 자리는 그 함수 바로 위아래에 있어요.
  await step1();
  await step2();
  await step3();
}

// ━━━━━━━━━━ 1단계: 복습 ━━━━━━━━━━
// [문제] step1 안에서 original = ['a', 'b']를 만들고 copy = List<String>.from(original)로 복사하세요.
//        copy.add('c');를 한 뒤 original과 copy를 차례로 출력하세요.
// [예상 출력]
// --- 1단계 ---
// [a, b]
// [a, b, c]

Future<void> step1() async {
  print('--- 1단계 ---');
  // TODO ①: 여기에 original, copy 선언, add, 출력을 작성하세요.
}

// ━━━━━━━━━━ 2단계: 직접 작성 ━━━━━━━━━━
// [문제] Future<void> sync(Map<String, int> local, Map<String, int> server, List<String> pending, bool online) async를 정의하세요.
//        offline이면 '오프라인'을 출력하고 return하세요. online이면 List<String>.from(pending) 복사본을 반복하세요.
//        각 ID의 local 값을 확인하고 서버에 넣은 뒤 원본 pending에서 그 ID를 제거하세요.
//        step2 안에서 local = {'run-1': 5}, 빈 server, pending = ['run-1']을 만드세요.
//        sync(..., false)를 기다린 뒤 pending, sync(..., true)를 기다린 뒤 server와 pending을 출력하세요.
// [예상 출력]
// --- 2단계 ---
// 오프라인
// [run-1]
// {run-1: 5}
// []
// [값을 바꾸어 다시 실행] online 재시도를 한 번 더 해도 서버 개수는 1이에요.

Future<void> step2() async {
  print('--- 2단계 ---');
  // TODO ①: 여기에 세 변수 선언과 sync 두 번, 출력을 작성하세요.
}

// TODO ②: 여기에 Future<void> sync(...) async를 정의하세요.

// ━━━━━━━━━━ 3단계: Runnery 코드 읽기 — 방금 했으면 건너뛰기 ━━━━━━━━━━
// RecordSync.syncNow의 앞부분이에요(record/data/record_sync.dart).
//
//   Future<void> syncNow(LocalRecords local, {Duration? minAge, ...}) {
//     final last = _lastSyncAt;
//     if (minAge != null &&
//         last != null &&
//         DateTime.now().difference(last) < minAge) {
//       return Future.value();
//     }
//     ...
//
// 읽는 법: minAge(최소 간격)를 주면, 마지막 동기화 뒤 그만큼 지나지 않았을 때 아무것도 안 하고 끝내요.
//   minAge를 안 주면(null) 이 검사를 하지 않고 바로 동기화해요.
// 바로 아래 [주어진 코드]는 시간 대신 "몇 초째"인지 정수 now로 흉내 내요.
// [문제]
// (1) 실행 전에 아래 네 호출의 결과를 [내 예측]에 적으세요(위에서부터 차례로 불러요).
//       syncNow(0, minAge: 60)
//       syncNow(30, minAge: 60)
//       syncNow(90, minAge: 60)
//       syncNow(95)
// (2) step3 안에서 네 결과를 차례로 출력하고 비교하세요.
// (3) 마지막 호출은 5초밖에 안 지났는데 왜 '건너뜀'이 아닌가요?
// [내 예측]
//
// [예상 출력]
// --- 3단계 ---
// 동기화
// 건너뜀
// 동기화
// 동기화

// [주어진 코드 — 수정하지 말고 읽기만 하세요]
var lastSyncAt = -1000;

String syncNow(int now, {int? minAge}) {
  if (minAge != null && now - lastSyncAt < minAge) return '건너뜀';
  lastSyncAt = now;
  return '동기화';
}

Future<void> step3() async {
  print('--- 3단계 ---');
  // TODO ①: 여기서 네 결과를 차례로 출력하세요.
}

// [내 말로 설명]
// 반복 중 제거할 때 pending 복사본을 사용하는 이유는 무엇인가요?
