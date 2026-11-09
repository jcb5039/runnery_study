// 4주차 4일 해설 — 함수를 값으로 전달하고 걸러내기
// 문제의 결과만 출력해요. 먼저 단계마다 직접 시도한 뒤 읽고, 닫은 다음 입력을 바꾸어 다시 풀어 보세요.
// 3단계 설명: 넘긴 함수는 'a', 'b', 'c'로 세 번 호출돼요. 'b'는 deleted에 있어서 contains가 true,
//            앞의 !가 뒤집어 false를 돌려주니 b는 빠져요. 지운 목록이 비어 있으면 모두 남아요.

void main() {
  step1();
  step2();
  step3();
}

// ━━━━━━━━━━ 1단계 ━━━━━━━━━━
void step1() {
  print('--- 1단계 ---');
  final scores = [40, 75, 90];
  print(scores.where((s) => s >= 70).toList());
}

// ━━━━━━━━━━ 2단계 ━━━━━━━━━━
void step2() {
  print('--- 2단계 ---');
  final distances = [2.0, 4.0, 6.0];
  print(distances.where((km) => km >= 4).toList());
  final selected = <double>[];
  for (final km in distances) {
    if (km >= 4) selected.add(km);
  }
  print(selected);
}

// ━━━━━━━━━━ 3단계 ━━━━━━━━━━
List<String> visibleIds(List<String> all, List<String> deleted) {
  return all.where((id) => !deleted.contains(id)).toList();
}

void step3() {
  print('--- 3단계 ---');
  print(visibleIds(['a', 'b', 'c'], ['b']));
  print(visibleIds(['a', 'b', 'c'], []));
}
