// 2주차 4일 해설 — while문으로 거꾸로 세기
// 이 파일은 문제의 정답만 출력해요.
// count가 0이 되면 조건이 거짓이에요. 반복문 다음의 print로 넘어가 출발!을 출력해요.

void main() {
  var count = 3;
  while (count > 0) {
    print(count);
    count--;
  }
  print('출발!');
}
