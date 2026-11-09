// 6주차 1일 해설 — null과 기본값
// 문제의 결과만 출력해요. 먼저 단계마다 직접 시도한 뒤 읽고, 닫은 다음 입력을 바꾸어 다시 풀어 보세요.
// 3단계 설명: 두 번째 객체는 caloriesKcal을 넣지 않았고 기본값도 없어서 null이에요.
//            그래서 ?? 오른쪽 calories.toDouble()이 쓰여 300이 300.0이 돼요.

void main() {
  step1();
  step2();
  step3();
}

// ━━━━━━━━━━ 1단계 ━━━━━━━━━━
void step1() {
  print('--- 1단계 ---');
  int? steps;
  print(steps);
  print(steps ?? 0);
}

// ━━━━━━━━━━ 2단계 ━━━━━━━━━━
void step2() {
  print('--- 2단계 ---');
  String? memo = null;
  print(memo ?? '기록만 저장');
  memo = '천천히 달림';
  print(memo);
}

// ━━━━━━━━━━ 3단계 ━━━━━━━━━━
class RecordLite {
  RecordLite({this.caloriesKcal, required this.calories});

  final double? caloriesKcal;
  final int calories;

  double get energyKcal => caloriesKcal ?? calories.toDouble();
}

void step3() {
  print('--- 3단계 ---');
  print(RecordLite(caloriesKcal: 312.5, calories: 300).energyKcal);
  print(RecordLite(calories: 300).energyKcal);
}
