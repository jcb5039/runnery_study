// 심화 확인 2 — 올바른 거리만 골라 새 리스트 만들기
// 실행 위치: ~/src/runnery-study
// 실행 명령: dart run checkpoint02/02_valid_records.dart
// 작성 위치: 아래 main()의 TODO 아래. 입력 변수부터 직접 선언하세요.

// [상황]
// rawDistances에는 하루 거리 기록이 순서대로 들어 있어요.
// 이 연습에서는 값을 다음 세 가지로 분류하기로 정했어요.
// - 0보다 큰 값: 실제로 달린 거리. validDistances에 추가하고 totalKm에 더해요.
// - 0인 값: 쉰 날. restDays를 1 늘려요. validDistances에는 추가하지 않아요.
// - 0보다 작은 값: 잘못된 기록. invalidCount를 1 늘려요.
//                  validDistances에 추가하거나 totalKm에 더하지 않아요.
// 음수를 양수로 바꾸는 문제는 아니에요.

// [기본 입력 — 아래 이름으로 직접 선언]
// rawDistances = [3, -2, 0, 5, -1, 4]

// [구할 값 — 아래 이름의 변수를 사용]
// validDistances: 0보다 큰 거리만 모을 새 리스트. 처음에는 []로 선언하세요.
//                 빈 리스트 선언 모양: var validDistances = [];
// totalKm: validDistances에 모은 거리들의 합계. 처음에는 0.
// restDays: 값이 0인 항목의 개수. 처음에는 0.
// invalidCount: 음수인 항목의 개수. 처음에는 0.

// [반복문 안에서 할 일 — 여기서는 print를 사용하지 마세요]
// 1. for-in문으로 rawDistances에서 거리 값을 하나씩 꺼내세요.
// 2. 이번에 꺼낸 거리 값과 0을 비교해서, 아래 세 경우 중 하나만 실행하세요.
//    - 0보다 크면: 그 값을 validDistances 끝에 add로 추가하고,
//                 같은 값을 거리 합계인 totalKm에 더해서 저장하세요.
//    - 0이면: 쉰 날의 수인 restDays에 1을 더해서 저장하세요.
//    - 0보다 작으면: 잘못된 기록의 개수인 invalidCount에 1을 더해서 저장하세요.
// 3. rawDistances의 처음부터 끝까지 같은 방식으로 반복하세요.
//    rawDistances의 항목을 수정하거나 삭제하지 마세요.
//    같은 양수가 여러 번 나와도 각각 validDistances에 추가하세요.
//
// [반복문이 끝난 뒤 할 일 — print를 사용하세요]
// 4. 아래 네 줄을 순서대로 출력하세요. 값은 해당 변수에서 가져오세요.
//    '달린 거리 목록: ' 뒤에는 validDistances 리스트 전체를 출력하세요.
//    '총 거리: ' 뒤에는 거리 합계인 totalKm과 단위 km를 출력하세요.
//    '쉰 날: ' 뒤에는 restDays와 단위 일을 출력하세요.
//    '잘못된 기록: ' 뒤에는 invalidCount와 단위 개를 출력하세요.
//    validDistances의 항목마다 한 줄씩 출력하는 것이 아니라,
//    리스트 전체를 한 줄에 출력하므로 최종 출력은 네 줄이에요.

// [기본 입력의 예상 출력]
// 달린 거리 목록: [3, 5, 4]
// 총 거리: 12km
// 쉰 날: 1일
// 잘못된 기록: 2개

// [추가 실행 사례 — 입력값을 아래 값으로 바꾸고 실행한 뒤 출력 결과를 비교하세요]
// A. rawDistances = [0, -3, 0, 2]
//    달린 거리 목록: [2]
//    총 거리: 2km
//    쉰 날: 2일
//    잘못된 기록: 1개
// B. rawDistances = [-2, 0, -1]
//    달린 거리 목록: []
//    총 거리: 0km
//    쉰 날: 1일
//    잘못된 기록: 2개

// [필수 조건]
// for-in, 조건문, 리스트의 add를 사용하세요.
// where, map, fold 등 아직 연습하지 않은 도구는 사용하지 마세요.
// 값 추가 문법이 기억나지 않으면 찾아봐도 돼요.

void main() {
  var rawDistances = [3, -2, 0, 5, -1, 4];
  var validDistances = []; //0보다 큼(실제로 달린 거리)
  var totalKm = 0; //총 달린 거리
  var restDays = 0; //0인날(쉰날)
  var invalidCount = 0; //0보다 작은값: 잘못된 기록
  
  for(var i in rawDistances) {
    if(i > 0) {
      validDistances.add(i);
      totalKm += i;
    }
    else if(i == 0) {
      restDays += 1;
    }
    else {
      invalidCount += 1;
    }
  }
  print('달린 거리 목록 : $validDistances');
  print('총 거리: ${totalKm}km');
  print('쉰 날: $restDays일');
  print('잘못된 기록: $invalidCount개');
  // TODO: 입력과 결과 변수 선언 → 분류와 계산 → 출력 순서로 작성하세요.
}

// 달린 거리 목록: [3, 5, 4]
// 총 거리: 12km
// 쉰 날: 1일
// 잘못된 기록: 2개

// [작성 후 설명 — 답을 주석으로 적으세요]
// rawDistances가 [5, 5, 0]일 때 totalKm과 validDistances가 각각 어떤 값이
// 되는지, 왜 그렇게 되는지 적으세요.
// 답:totalKm = 10, validDistances = 2
