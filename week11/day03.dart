// 11주차 3일 — 객체 저장과 복원
// 실행 위치: ~/src/runnery-study
// 실행: dart run week11/day03.dart
// 정답은 answers/day03.dart에 있어요.
// 오늘의 강의: week11/README.md의 "2. 객체를 저장하고 되살리기: toJson, fromJson — 3일" 섹션이에요. 그 섹션만 읽고 풀 수 있어요.
// 예제를 실행해 본 뒤 아래로 내려가며 1단계 → 2단계 → 3단계 순서로 풀어요.
// 단계마다 [문제] 바로 아래에 코드를 쓰는 자리(①)와, 필요하면 함수를 만드는 자리(②)가 붙어 있어요.
// 한 단계를 저장·실행해서 예상 출력과 같으면 다음 단계로 넘어가요.

import 'dart:convert';

void main() {
  // [짧은 실행 예제]
  final example = ExampleRun(2.0);
  final text = jsonEncode(example.toJson());
  final restored = ExampleRun.fromJson(
    jsonDecode(text) as Map<String, dynamic>,
  );
  print(restored.km);

  // [한 줄씩 읽기]
  // 1. toJson 메서드가 객체의 필드를 Map으로 꺼내요.
  // 2. JSON 문자열로 바꿨다가 다시 Map으로 돌려요.
  // 3. factory 생성자는 Map을 읽어 새 객체를 반환해요.
  // [예제 예상 출력]
  // 2.0

  // [단계 문제 실행]
  // 아래 세 줄은 이 파일 아래쪽의 step1, step2, step3 함수를 차례로 호출해요.
  // 각 단계의 문제와 풀 자리는 그 함수 바로 위아래에 있어요.
  step1();
  step2();
  step3();
}

class ExampleRun {
  final double km;
  ExampleRun(this.km);
  Map<String, Object> toJson() => {'km': km};
  factory ExampleRun.fromJson(Map<String, dynamic> data) {
    return ExampleRun((data['km'] as num).toDouble());
  }
}

// ━━━━━━━━━━ 1단계: 예제 따라 하기 ━━━━━━━━━━
// [문제] Shoe 클래스를 정의하세요. 필드 final String brand, 생성자 Shoe(this.brand),
//        Map<String, Object> toJson() => {'brand': brand}; 메서드를 두세요.
//        step1 안에서 jsonEncode(Shoe('빠른신발').toJson())을 출력하세요.
// [예상 출력]
// --- 1단계 ---
// {"brand":"빠른신발"}

void step1() {
  print('--- 1단계 ---');
  // TODO ①: 여기서 jsonEncode 결과를 출력하세요.
}

// TODO ②: 여기에 Shoe 클래스를 정의하세요.

// ━━━━━━━━━━ 2단계: 직접 작성 ━━━━━━━━━━
// [문제] PracticeRun 클래스를 만들고 final double km, final int seconds와 위치 매개변수 생성자를 정의하세요.
//        Map<String, Object> toJson()과 factory PracticeRun.fromJson(Map<String, dynamic> data)를 만드세요.
//        step2 안에서 PracticeRun(5.0, 1800)을 JSON 문자열로 바꾼 뒤 복원하고 km, seconds를 출력하세요.
// [예상 출력]
// --- 2단계 ---
// 5.0
// 1800
// [값을 바꾸어 다시 실행] 거리 0.0, 시간 0으로 바꿔도 두 값이 유지되어야 해요.

void step2() {
  print('--- 2단계 ---');
  // TODO ①: 여기서 객체 → JSON 문자열 → 복원 후 두 값을 출력하세요.
}

// TODO ②: 여기에 PracticeRun 클래스를 정의하세요.

// ━━━━━━━━━━ 3단계: Runnery 코드 읽기 — 저장 형식 판 번호 검사 ━━━━━━━━━━
// RunningRecord.fromJson의 첫 줄들이에요(record/models/running_record.dart).
//
//   factory RunningRecord.fromJson(Map<String, dynamic> json) {
//     if (json['version'] != 1) {
//       throw const FormatException('Unsupported record version');
//     }
//     ...
//
// 읽는 법: 저장할 때 넣은 'version'이 1이 아니면 모르는 형식이라 읽지 않고 실패를 던져요.
// 바로 아래 [주어진 코드]는 판 번호와 거리만 남긴 기록 클래스예요.
// [문제]
// (1) step3 안에서 jsonEncode(RecordLite(5.0).toJson())을 text에 담고,
//     RecordLite.fromJson(jsonDecode(text) as Map<String, dynamic>)의 km를 출력하세요.
// (2) 그 아래에 try/catch를 쓰세요. try에서 아래 글자를 복원해 km를 출력하고,
//     catch에서는 '지원하지 않는 버전'을 출력해요.
//       '{"version":2,"distanceKm":3}'
// (3) 실행 전에 두 출력을 [내 예측]에 적고 비교하세요.
// [내 예측]
//
// [예상 출력]
// --- 3단계 ---
// 5.0
// 지원하지 않는 버전

// [주어진 코드 — 수정하지 말고 읽기만 하세요]
class RecordLite {
  final double km;
  RecordLite(this.km);

  Map<String, Object> toJson() => {'version': 1, 'distanceKm': km};

  factory RecordLite.fromJson(Map<String, dynamic> json) {
    if (json['version'] != 1) {
      throw const FormatException('Unsupported record version');
    }
    return RecordLite((json['distanceKm'] as num).toDouble());
  }
}

void step3() {
  print('--- 3단계 ---');
  // TODO ①: 여기에 문제 (1)~(2)의 코드를 쓰세요.
}

// [내 말로 설명]
// 복원한 객체는 원래 객체와 값이 같은 새 객체인가요?
