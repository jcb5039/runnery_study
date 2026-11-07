// 1주차 4일 해설 — 값 바꾸기: var, final, const
// 이 파일은 문제의 정답만 출력해요.
// walkedKm에는 새 값을 저장하고, 나머지 두 변수는 문장에 사용할 때 읽기만 해요.

void main() {
  var walkedKm = 2;
  final targetKm = 5;
  const unit = 'km';
  walkedKm += 1;
  print('오늘 $walkedKm$unit, 목표 $targetKm$unit');
}
