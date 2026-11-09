// 11주차 6일 해설 — 깨진 저장 내용 처리하기
// 문제의 결과만 출력해요. 먼저 시도한 뒤 읽고, 닫은 다음 입력을 바꾸어 다시 풀어 보세요.
// 확인 질문: 읽기 실패를 빈 목록으로만 바꾸면 사용자에게 무엇이 숨겨지나요?
// 예상 결과:
// 기록을 읽을 수 없음
// 읽기 종료

import 'dart:convert';

void main() {
  final text = '깨진 JSON';
  try {
    final values = jsonDecode(text) as List<dynamic>;
    print(values.map((value) => (value as num).toDouble()).toList());
  } catch (error) {
    print('기록을 읽을 수 없음');
  } finally {
    print('읽기 종료');
  }
}
