// 4주차 3일 — Map은 이름표로 값을 찾기
// 실행 위치: ~/src/runnery-study
// 실행: dart run week04/day03.dart
// 정답은 answers/day03.dart에 있어요.
// 오늘의 강의: week04/README.md의 "2. Map: 이름표로 값 찾기 — 3일, 7일" 섹션이에요. 그 섹션만 읽고 풀 수 있어요.
// 예제를 실행해 본 뒤 아래로 내려가며 1단계 → 2단계 → 3단계 순서로 풀어요.
// 단계마다 [문제] 바로 아래에 코드를 쓰는 자리(①)와, 필요하면 함수를 만드는 자리(②)가 붙어 있어요.
// 한 단계를 저장·실행해서 예상 출력과 같으면 다음 단계로 넘어가요.

void main() {
  // [짧은 실행 예제]
  final example = <String, String>{'name': '수진', 'memo': '아침'};
  print(example['name']);
  print(example['missing']);

  // [한 줄씩 읽기]
  // 1. <String, String>은 키와 값의 타입이에요.
  // 2. ['name']은 name이라는 키의 값을 꺼내요.
  // 3. 없는 키는 null이에요. null 처리는 6주에 더 배워요.
  // [예제 예상 출력]
  // 수진
  // null

  // [단계 문제 실행]
  // 아래 세 줄은 이 파일 아래쪽의 step1, step2, step3 함수를 차례로 호출해요.
  // 각 단계의 문제와 풀 자리는 그 함수 바로 위아래에 있어요.
  step1();
  step2();
  step3();
}

// ━━━━━━━━━━ 1단계: 예제 따라 하기 ━━━━━━━━━━
// [문제] step1 안에서 shoe = <String, String>{'brand': '빠른신발', 'size': '260'}을 선언하세요.
//        shoe['brand']와 shoe['size']를 차례로 출력하세요.
// [예상 출력]
// --- 1단계 ---
// 빠른신발
// 260

void step1() {
  print('--- 1단계 ---');
  // TODO ①: 여기에 shoe 선언과 두 줄 출력을 작성하세요.
}

// ━━━━━━━━━━ 2단계: 직접 작성 ━━━━━━━━━━
// [문제] step2 안에서 record = <String, Object>{'name': '민수', 'km': 3.0}을 선언하세요.
//        이름과 거리를 키로 꺼내 출력하고, record['km']에 5.0을 넣은 뒤 다시 거리를 출력하세요.
// [예상 출력]
// --- 2단계 ---
// 민수
// 3.0
// 5.0
// [값을 바꾸어 다시 실행] 이름만 '지우'로 바꾸면 첫 줄만 지우로 바뀌어요.

void step2() {
  print('--- 2단계 ---');
  // TODO ①: 여기에 record 선언, 출력, 값 바꾸기, 다시 출력을 작성하세요.
}

// ━━━━━━━━━━ 3단계: Runnery 코드 읽기 — 기록을 Map으로 바꾸기 ━━━━━━━━━━
// Runnery는 기록을 저장하기 전에 Map으로 바꿔요(record/models/running_record.dart의 toJson). 원본 일부예요.
//
//   Map<String, dynamic> toJson() => {
//     'distanceKm': distanceKm,
//     'movingSeconds': movingSeconds,
//     ...
//   };
//
// 읽는 법: 반환 타입이 Map이에요. 키는 글자, 값은 여러 종류(dynamic)예요. dynamic은 지금은 Object처럼 읽어요.
//   'distanceKm' 이름표에는 거리, 'movingSeconds' 이름표에는 움직인 시간(초)을 담아요.
// 바로 아래 [주어진 코드]는 같은 모양을 입력 두 개를 받는 함수로 옮긴 거예요.
// [문제]
// (1) step3 안에서 final saved = recordMap(5.2, 1800);으로 Map을 받으세요.
// (2) 실행 전에 saved['distanceKm'], saved['movingSeconds'], saved['memo']의 결과를 [내 예측]에 적으세요.
// (3) 세 값을 차례로 출력하고 비교하세요.
// (4) 'memo'는 왜 그런 결과가 나오나요?
// [내 예측]
//
// [예상 출력]
// --- 3단계 ---
// 5.2
// 1800
// null

// [주어진 코드 — 수정하지 말고 읽기만 하세요]
Map<String, Object> recordMap(double km, int seconds) {
  return {'distanceKm': km, 'movingSeconds': seconds};
}

void step3() {
  print('--- 3단계 ---');
  // TODO ①: 여기서 recordMap(5.2, 1800)을 saved에 담고, 세 값을 출력하세요.
}

// [내 말로 설명]
// List의 [0]과 Map의 ['name']은 어떻게 다른가요?
