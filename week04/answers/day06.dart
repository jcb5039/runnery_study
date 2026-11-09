// 4주차 6일 해설 — 조건과 변환을 연결하기
// 문제의 결과만 출력해요. 먼저 단계마다 직접 시도한 뒤 읽고, 닫은 다음 입력을 바꾸어 다시 풀어 보세요.
// 3단계 설명: 0은 where에서 빠지고 330은 5분, 365는 6분(365 ~/ 60 = 6)이 돼요.
//            map을 먼저 하면 0이 '0분'이 되어 남아요. 거르는 조건도 글자에 맞게 바꿔야 해요.

void main() {
  step1();
  step2();
  step3();
}

// ━━━━━━━━━━ 1단계 ━━━━━━━━━━
void step1() {
  print('--- 1단계 ---');
  final numbers = [5, 15, 25];
  print(numbers.where((n) => n > 10).map((n) => n * 2).toList());
}

// ━━━━━━━━━━ 2단계 ━━━━━━━━━━
void step2() {
  print('--- 2단계 ---');
  print(selectedMeters([2.0, 4.0, 6.0]));
}

List<double> selectedMeters(List<double> distances) {
  return distances.where((km) => km >= 4).map((km) => km * 1000).toList();
}

// ━━━━━━━━━━ 3단계 ━━━━━━━━━━
List<String> paceLabels(List<int> paces) {
  return paces.where((p) => p > 0).map((p) => '${p ~/ 60}분').toList();
}

void step3() {
  print('--- 3단계 ---');
  print(paceLabels([330, 0, 365]));
  print(paceLabels([0, 0]));
}
