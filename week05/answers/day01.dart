// 5주차 1일 해설 — 클래스와 객체
// 문제의 결과만 출력해요. 먼저 단계마다 직접 시도한 뒤 읽고, 닫은 다음 입력을 바꾸어 다시 풀어 보세요.
// 3단계 설명: PlaceInfo()를 두 번 부르면 객체가 두 개 생기고, 각자 자기 place 필드를 가져요.
//            second.place만 바꿨으니 first.place는 처음 값 그대로예요.

void main() {
  step1();
  step2();
  step3();
}

// ━━━━━━━━━━ 1단계 ━━━━━━━━━━
void step1() {
  print('--- 1단계 ---');
  final shoe = Shoe();
  print(shoe.brand);
}

class Shoe {
  String brand = '빠른신발';
}

// ━━━━━━━━━━ 2단계 ━━━━━━━━━━
void step2() {
  print('--- 2단계 ---');
  final record = PracticeRun();
  print(record.distanceKm);
}

class PracticeRun {
  double distanceKm = 3.0;
}

// ━━━━━━━━━━ 3단계 ━━━━━━━━━━
class PlaceInfo {
  String place = '위치 정보 없음';
}

void step3() {
  print('--- 3단계 ---');
  final first = PlaceInfo();
  final second = PlaceInfo();
  second.place = '한강공원';
  print(first.place);
  print(second.place);
}
