// 5주차 5일 해설 — static 메서드
// 문제의 결과만 출력해요. 먼저 시도한 뒤 읽고, 닫은 다음 입력을 바꾸어 다시 풀어 보세요.
// 확인 질문: RunCalc.metersToKm과 record.label 호출의 앞부분은 무엇이 다른가요?
// 예상 결과:
// 1.5

void main() {
  print(RunCalc.metersToKm(1500));
}

class RunCalc {
  static double metersToKm(int meters) => meters / 1000;
}
