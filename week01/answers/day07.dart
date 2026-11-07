// 1주차 7일 해설 — 1주차 복습: 오늘의 기록
// 이 파일은 문제의 정답만 출력해요.
// 입력 선언 → 시간 계산 → 출력 → 조건 검사 순서예요. 함수나 자동 채점 코드는 필요 없어요.

void main() {
  final name = '찬범';
  final distanceKm = 4;
  final totalSeconds = 150;
  final minutes = totalSeconds ~/ 60;
  final seconds = totalSeconds % 60;
  print('$name: ${distanceKm}km');
  print('${minutes}분 ${seconds}초');
  if (distanceKm >= 5) {
    print('목표 달성');
  } else {
    print('목표 미달');
  }
}
