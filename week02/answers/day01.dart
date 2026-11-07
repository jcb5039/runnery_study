// 2주차 1일 해설 — 세 가지 경우 나누기
// 이 파일은 문제의 정답만 출력해요.
// else if에 도달했다면 이미 speed가 8 미만이라는 뜻이에요. 그래서 0 초과인지만 추가로 확인해요.

void main() {
  final speed = 5;
  if (speed >= 8) {
    print('달리기');
  } else if (speed > 0) {
    print('걷기');
  } else {
    print('정지');
  }
}
