// 11주차 3일 해설 — 객체를 저장하고 복원하기
// 문제의 결과만 출력해요. 먼저 시도한 뒤 읽고, 닫은 다음 입력을 바꾸어 다시 풀어 보세요.
// 확인 질문: 복원한 객체는 원래 객체와 값이 같은 새 객체인가요?
// 예상 결과:
// 5.0
// 1800

import 'dart:convert';

void main() {
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
