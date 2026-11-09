// 6주차 2일 해설 — 없는 값에 안전하게 접근하기
// 문제의 결과만 출력해요. 먼저 시도한 뒤 읽고, 닫은 다음 입력을 바꾸어 다시 풀어 보세요.
// 확인 질문: !로 값이 있다고 단정했는데 실제 null이면 어떻게 될까요?
// 예상 결과:
// 0
// 3

void main() {
  print(memoLength(null));
  print(memoLength('달리기'));
}

int memoLength(String? memo) => memo?.length ?? 0;
