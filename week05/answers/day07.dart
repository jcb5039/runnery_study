// 5주차 7일 해설 — 복습: 두 기록의 평균 속도
// 문제의 결과만 출력해요. 먼저 단계마다 직접 시도한 뒤 읽고, 닫은 다음 입력을 바꾸어 다시 풀어 보세요.
// 3단계 설명: r에는 today의 RecordLite 객체가 하나씩 들어와요. r.distanceKm는 그 객체의 거리예요.
//            3.2 + 1.8 = 5.0, 1200 + 660 = 1860이에요.

void main() {
  step1();
  step2();
  step3();
}

// ━━━━━━━━━━ 1단계 ━━━━━━━━━━
void step1() {
  print('--- 1단계 ---');
  final shoes = [Shoe('빠른신발'), Shoe('가벼운신발')];
  for (final shoe in shoes) {
    print(shoe.brand);
  }
}

class Shoe {
  final String brand;
  Shoe(this.brand);
}

// ━━━━━━━━━━ 2단계 ━━━━━━━━━━
void step2() {
  print('--- 2단계 ---');
  final records = [
    PracticeRun(distanceKm: 2.0, seconds: 1200),
    PracticeRun(distanceKm: 5.0, seconds: 1800),
  ];
  for (final record in records) {
    print(record.averageSpeed);
  }
}

class PracticeRun {
  final double distanceKm;
  final int seconds;
  PracticeRun({required this.distanceKm, required this.seconds});

  double get averageSpeed {
    if (seconds <= 0) return 0;
    return distanceKm / (seconds / 3600);
  }
}

// ━━━━━━━━━━ 3단계 ━━━━━━━━━━
class RecordLite {
  final double distanceKm;
  final int movingSeconds;
  RecordLite({required this.distanceKm, required this.movingSeconds});
}

final today = [
  RecordLite(distanceKm: 3.2, movingSeconds: 1200),
  RecordLite(distanceKm: 1.8, movingSeconds: 660),
];

void step3() {
  print('--- 3단계 ---');
  final distanceKm = today.fold<double>(0, (sum, r) => sum + r.distanceKm);
  final movingSeconds = today.fold<int>(0, (sum, r) => sum + r.movingSeconds);
  print(distanceKm);
  print(movingSeconds);
}
