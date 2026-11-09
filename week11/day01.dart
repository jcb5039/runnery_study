// 11주차 1일 — Map을 JSON 문자열로
// 실행 위치: ~/src/runnery-study
// 실행: dart run week11/day01.dart
// 정답은 answers/day01.dart에 있어요.
// 오늘의 강의: week11/README.md의 "1. Map과 JSON 문자열 — 1~2일" 섹션이에요. 그 섹션만 읽고 풀 수 있어요.
// 예제를 실행해 본 뒤 아래로 내려가며 1단계 → 2단계 → 3단계 순서로 풀어요.
// 단계마다 [문제] 바로 아래에 코드를 쓰는 자리(①)와, 필요하면 함수를 만드는 자리(②)가 붙어 있어요.
// 한 단계를 저장·실행해서 예상 출력과 같으면 다음 단계로 넘어가요.

import 'dart:convert';

void main() {
  // [짧은 실행 예제]
  final example = {'km': 2, 'seconds': 600};
  final text = jsonEncode(example);
  print(text);

  // [한 줄씩 읽기]
  // 1. import dart:convert가 변환 도구를 가져와요.
  // 2. Map은 코드에서 키로 꺼낼 수 있는 자료예요.
  // 3. jsonEncode는 자료를 저장·전송할 문자열로 바꿔요.
  // [예제 예상 출력]
  // {"km":2,"seconds":600}

  // [단계 문제 실행]
  // 아래 세 줄은 이 파일 아래쪽의 step1, step2, step3 함수를 차례로 호출해요.
  // 각 단계의 문제와 풀 자리는 그 함수 바로 위아래에 있어요.
  step1();
  step2();
  step3();
}

// ━━━━━━━━━━ 1단계: 예제 따라 하기 ━━━━━━━━━━
// [문제] step1 안에서 shoe = {'brand': '빠른신발', 'size': 260}을 선언하세요.
//        jsonEncode(shoe)를 출력하세요.
// [예상 출력]
// --- 1단계 ---
// {"brand":"빠른신발","size":260}

void step1() {
  print('--- 1단계 ---');
  // TODO ①: 여기에 shoe 선언과 jsonEncode 결과 출력을 작성하세요.
}

// ━━━━━━━━━━ 2단계: 직접 작성 ━━━━━━━━━━
// [문제] step2 안에서 record = {'km': 5, 'seconds': 1800}을 선언하세요.
//        Map의 km를 출력하고 jsonEncode(record)도 출력하세요.
// [예상 출력]
// --- 2단계 ---
// 5
// {"km":5,"seconds":1800}
// [값을 바꾸어 다시 실행] km를 3으로 바꾸면 두 출력의 거리만 3으로 바뀌어요.

void step2() {
  print('--- 2단계 ---');
  // TODO ①: 여기에 record 선언과 두 줄 출력을 작성하세요.
}

// ━━━━━━━━━━ 3단계: Runnery 코드 읽기 — 저장용 Map의 날짜와 null ━━━━━━━━━━
// RunningRecord.toJson의 일부예요(record/models/running_record.dart).
//
//   Map<String, dynamic> toJson() => {
//     'version': 1,
//     'startedAt': startedAt.toIso8601String(),
//     'distanceKm': distanceKm,
//     'averagePaceSeconds': distanceKm < .01 ? null : paceSeconds,
//     ...
//   };
//
// 읽는 법: DateTime은 JSON에 그대로 못 넣어서 toIso8601String()으로 정해진 모양의 글자로 바꿔요.
//   'version': 1은 저장 형식의 판 번호예요. 페이스를 계산할 수 없으면 null을 넣어요.
// 바로 아래 [주어진 코드]는 이 네 줄을 입력 세 개를 받는 함수로 바꾼 거예요. 값이 null일 수 있어 Object?를 써요.
// [문제]
// (1) 실행 전에 아래 두 줄의 출력을 [내 예측]에 적으세요.
//       jsonEncode(recordJson(DateTime(2026, 11, 9, 7, 30), 5.0, 360))
//       jsonEncode(recordJson(DateTime(2026, 11, 9, 7, 30), 0.0, null))
// (2) step3 안에서 두 값을 각각 print로 출력하고 비교하세요.
// (3) 날짜는 왜 따옴표로 감싸져 있고, 5.0과 null은 따옴표가 없나요?
// [내 예측]
//
// [예상 출력]
// --- 3단계 ---
// {"version":1,"startedAt":"2026-11-09T07:30:00.000","distanceKm":5.0,"averagePaceSeconds":360}
// {"version":1,"startedAt":"2026-11-09T07:30:00.000","distanceKm":0.0,"averagePaceSeconds":null}

// [주어진 코드 — 수정하지 말고 읽기만 하세요]
Map<String, Object?> recordJson(DateTime startedAt, double distanceKm, int? paceSeconds) => {
  'version': 1,
  'startedAt': startedAt.toIso8601String(),
  'distanceKm': distanceKm,
  'averagePaceSeconds': paceSeconds,
};

void step3() {
  print('--- 3단계 ---');
  // TODO ①: 여기서 두 jsonEncode 결과를 각각 출력하세요.
}

// [내 말로 설명]
// Map과 JSON 문자열은 각각 어떤 조작에 쓰나요?
