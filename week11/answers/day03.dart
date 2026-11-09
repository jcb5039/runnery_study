// 11주차 3일 해설 — 객체 저장과 복원
// 문제의 결과만 출력해요. 먼저 단계마다 직접 시도한 뒤 읽고, 닫은 다음 입력을 바꾸어 다시 풀어 보세요.
// 3단계 설명: toJson이 'version': 1을 넣어서 첫 복원은 통과해요.
//            두 번째 글자는 version이 2라서 fromJson이 throw하고, catch가 문구를 출력해요.

import 'dart:convert';

void main() {
  step1();
  step2();
  step3();
}

// ━━━━━━━━━━ 1단계 ━━━━━━━━━━
void step1() {
  print('--- 1단계 ---');
  print(jsonEncode(Shoe('빠른신발').toJson()));
}

class Shoe {
  final String brand;
  Shoe(this.brand);
  Map<String, Object> toJson() => {'brand': brand};
}

// ━━━━━━━━━━ 2단계 ━━━━━━━━━━
void step2() {
  print('--- 2단계 ---');
  final record = PracticeRun(5.0, 1800);
  final text = jsonEncode(record.toJson());
  final restored = PracticeRun.fromJson(
    jsonDecode(text) as Map<String, dynamic>,
  );
  print(restored.km);
  print(restored.seconds);
}

class PracticeRun {
  final double km;
  final int seconds;
  PracticeRun(this.km, this.seconds);

  Map<String, Object> toJson() => {'km': km, 'seconds': seconds};

  factory PracticeRun.fromJson(Map<String, dynamic> data) {
    return PracticeRun((data['km'] as num).toDouble(), data['seconds'] as int);
  }
}

// ━━━━━━━━━━ 3단계 ━━━━━━━━━━
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
  final text = jsonEncode(RecordLite(5.0).toJson());
  print(RecordLite.fromJson(jsonDecode(text) as Map<String, dynamic>).km);
  try {
    final old = '{"version":2,"distanceKm":3}';
    print(RecordLite.fromJson(jsonDecode(old) as Map<String, dynamic>).km);
  } catch (error) {
    print('지원하지 않는 버전');
  }
}
