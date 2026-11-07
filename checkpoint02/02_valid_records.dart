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

// [해야 할 일]
// 1. for-in문으로 rawDistances의 값을 하나씩 확인하고 위 기준으로 분류하세요.
// 2. validDistances에는 rawDistances에서 발견한 순서대로 값을 추가하세요.
//    rawDistances 자체는 변경하지 마세요.
// 3. 반복이 끝난 뒤 네 결과를 아래 순서와 형식으로 출력하세요.

// [기본 입력의 예상 출력]
// 달린 거리 목록: [3, 5, 4]
// 총 거리: 12km
// 쉰 날: 1일
// 잘못된 기록: 2개

// [입력값만 바꾸어 추가 확인]
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
  // TODO: 입력과 결과 변수 선언 → 분류와 계산 → 출력 순서로 작성하세요.
}

// [작성 후 설명 — 답을 주석으로 적으세요]
// rawDistances가 [5, 5, 0]이면 validDistances에 5를 몇 개 넣어야 하나요? 왜인가요?
// 답:
