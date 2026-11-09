// 10주차 2일 해설 — Duration과 분·초 표시
// 문제의 결과만 출력해요. 먼저 시도한 뒤 읽고, 닫은 다음 입력을 바꾸어 다시 풀어 보세요.
// 확인 질문: inSeconds와 남은 초는 왜 같지 않나요?
// 예상 결과:
// 3분 5초

void main() {
  final duration = Duration(seconds: 185);
  final minutes = duration.inMinutes;
  final seconds = duration.inSeconds % 60;
  print('${minutes}분 ${seconds}초');
}
