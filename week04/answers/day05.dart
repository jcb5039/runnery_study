// 4주차 5일 해설 — map 변환과 fold 누적
// 문제의 결과만 출력해요. 먼저 단계마다 직접 시도한 뒤 읽고, 닫은 다음 입력을 바꾸어 다시 풀어 보세요.
// 3단계 설명: 3.2 + 1.8 = 5.0, 1200 + 660 = 1860, 150.4 + 99.8 = 250.2를 반올림해 250이에요.
//            처음 값을 100으로 바꾸면 100 + 1200 + 660 = 1960이에요.

void main() {
  step1();
  step2();
  step3();
}

// ━━━━━━━━━━ 1단계 ━━━━━━━━━━
void step1() {
  print('--- 1단계 ---');
  final minutes = [10, 20];
  print(minutes.map((m) => m * 60).toList());
  print(minutes.fold<int>(0, (sum, m) => sum + m));
}

// ━━━━━━━━━━ 2단계 ━━━━━━━━━━
void step2() {
  print('--- 2단계 ---');
  final distances = [2.0, 4.0, 6.0];
  print(distances.map((km) => km * 1000).toList());
  print(distances.fold<double>(0.0, (sum, km) => sum + km));
}

// ━━━━━━━━━━ 3단계 ━━━━━━━━━━
final todayKm = [3.2, 1.8];
final todaySeconds = [1200, 660];
final todayKcal = [150.4, 99.8];

void step3() {
  print('--- 3단계 ---');
  print(todayKm.fold<double>(0, (sum, km) => sum + km));
  print(todaySeconds.fold<int>(0, (sum, s) => sum + s));
  print(todayKcal.fold<double>(0, (sum, k) => sum + k).round());
}
