// 심화 확인 3 — 목표 거리에 처음 도달한 날
// 실행: dart run checkpoint02/03_reach_goal.dart (runnery-study 폴더에서)
// 아래 main() 안에 변수 선언부터 직접 작성하세요.

// [입력과 변수]
// distances = [2, 3, 6, 4]: 첫날부터 순서대로 기록한 하루 거리(km).
// targetKm = 10: 여러 날의 거리를 더해 달성할 목표(km).
// totalKm = 0: 지금까지 더한 거리. checkedDays = 0: 거리를 더한 날의 수.
// 입력 거리는 0 이상, targetKm은 0보다 큰 정수예요.

// [할 일]
// 1. while문으로 distances의 첫 항목부터 순서대로 totalKm에 더하세요.
//    항목 하나를 더할 때마다 checkedDays를 1 늘리세요. 0km인 날도 세세요.
// 2. totalKm이 targetKm 이상이 되거나, 마지막 항목까지 더했으면 반복을 끝내세요.
//    목표에 도달한 날의 거리는 전부 더하고, 다음 날의 거리는 더하지 마세요.
// 3. 반복문 밖에서 checkedDays, totalKm, 달성 여부를 아래처럼 세 줄로 출력하세요.
//    totalKm이 targetKm 미만이면 '목표까지 ○km 부족'을 출력하세요.
//    ○에는 targetKm에서 totalKm을 뺀 값을 넣으세요.
// 반복문 안에서는 출력하지 마세요. 필요한 변수는 추가로 선언해도 돼요.

// [예상 출력]
// 합산한 날: 3일
// 누적 거리: 11km
// 목표 달성

// [입력값을 바꿔 실행하기 — targetKm은 모두 10]
// distances = [1, 2, 3] → 3일, 6km, 목표까지 4km 부족
// distances = [10, 2, 3] → 1일, 10km, 목표 달성
// distances = [0, 0] → 2일, 0km, 목표까지 10km 부족

void main() {
  var distances = [2, 3, 6, 4]; //첫날부터 순서대로 기록한 하루 거리(km).
  var targetKm = 10; //여러 날의 거리를 더해 달성할 목표(km).
  var totalKm = 0; //지금까지 더한 거리. checkedDays = 0: 거리를 더한 날의 수.
  var checkedDays = 0;

  while (checkedDays < distances.length && totalKm < targetKm) {
    totalKm += distances[checkedDays];
    checkedDays++;
  }

  print('합산한 날: ${checkedDays}일');
  print('누적 거리: ${totalKm}km');
  if (totalKm >= targetKm) {
    print('목표 달성');
  } else {
    print('목표까지 ${targetKm - totalKm}km 부족');
  }
}

// [작성 후 설명 — 답을 주석으로 적으세요]
// 추가 실행 사례 A에서 totalKm은 targetKm보다 작은데도 반복을 끝내야 해요.
// 그때 리스트에서 더 꺼낼 항목이 있는지 어떻게 판단했는지 적으세요.
// 답: checkedDays는 지금까지 더한 날의 수이면서, 다음에 꺼낼 칸 번호이기도 하다.
//     while 조건의 checkedDays < distances.length로 꺼낼 칸이 남았는지 확인했다.
//     사례 A([1, 2, 3])에서는 3개를 다 더하면 checkedDays가 3이 되고,
//     3 < 3은 거짓이라 totalKm(6)이 10보다 작아도 반복이 끝난다.
//     이 조건이 없으면 없는 3번 칸 distances[3]을 꺼내려다 오류가 난다.
