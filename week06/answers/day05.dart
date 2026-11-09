// 6주차 5일 해설 — 실패 처리와 마무리
// 문제의 결과만 출력해요. 먼저 시도한 뒤 읽고, 닫은 다음 입력을 바꾸어 다시 풀어 보세요.
// 확인 질문: 성공했을 때 catch와 finally 중 어느 쪽이 실행되나요?
// 예상 결과:
// 입력 오류
// 정리 완료

void main() {
  final text = '잘못된 값';
  try {
    print(int.parse(text));
  } catch (error) {
    print('입력 오류');
  } finally {
    print('정리 완료');
  }
}
