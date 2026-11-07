// 1주차 5일 해설 — 몫과 나머지
// 이 파일은 문제의 정답만 출력해요.
// 125에는 60이 두 번 들어가고 5가 남아요. 문자열의 한글과 변수 경계를 분명히 하려면 ${minutes}분처럼 써요.

void main() {
  final totalSeconds = 125;
  final minutes = totalSeconds ~/ 60;
  final seconds = totalSeconds % 60;
  print('${minutes}분 ${seconds}초');
}
