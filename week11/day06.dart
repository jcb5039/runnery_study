// 11주차 6일 — 깨진 내용 읽기
// 실행 위치: ~/src/runnery-study
// 실행: dart run week11/day06.dart
// 정답은 answers/day06.dart에 있어요.
// 오늘의 강의: week11/README.md의 "4. 깨진 내용 읽기 — 6일" 섹션이에요. 그 섹션만 읽고 풀 수 있어요.
// 예제를 실행해 본 뒤 아래로 내려가며 1단계 → 2단계 → 3단계 순서로 풀어요.
// 단계마다 [문제] 바로 아래에 코드를 쓰는 자리(①)와, 필요하면 함수를 만드는 자리(②)가 붙어 있어요.
// 한 단계를 저장·실행해서 예상 출력과 같으면 다음 단계로 넘어가요.

import 'dart:convert';

void main() {
  // [짧은 실행 예제]
  try {
    print(jsonDecode('깨진 JSON'));
  } catch (error) {
    print('읽기 실패');
  }

  // [한 줄씩 읽기]
  // 1. JSON 형식이 아니면 변환이 실패해요.
  // 2. catch에서 실패를 사용자에게 알려요.
  // 3. 실패했다고 기존 파일을 자동으로 빈 값으로 덮어쓰지는 않아요.
  // [예제 예상 출력]
  // 읽기 실패

  // [단계 문제 실행]
  // 아래 세 줄은 이 파일 아래쪽의 step1, step2, step3 함수를 차례로 호출해요.
  // 각 단계의 문제와 풀 자리는 그 함수 바로 위아래에 있어요.
  step1();
  step2();
  step3();
}

// ━━━━━━━━━━ 1단계: 예제 따라 하기 ━━━━━━━━━━
// [문제] step1 안에서 예제와 같은 try/catch를 쓰되 jsonDecode('[1,2]')를 출력하세요.
//        catch에서는 '읽기 실패'를 출력해요.
// [예상 출력]
// --- 1단계 ---
// [1, 2]

void step1() {
  print('--- 1단계 ---');
  // TODO ①: 여기에 try/catch를 작성하세요.
}

// ━━━━━━━━━━ 2단계: 직접 작성 ━━━━━━━━━━
// [문제] step2 안에서 text = '깨진 JSON'을 선언하세요. try 안에서 JSON 목록으로 바꾸고 각 값을 double로 바꿔 출력하세요.
//        catch에서는 '기록을 읽을 수 없음', finally에서는 '읽기 종료'를 출력하세요.
// [예상 출력]
// --- 2단계 ---
// 기록을 읽을 수 없음
// 읽기 종료
// [값을 바꾸어 다시 실행] text가 '[2,4]'이면 [2.0, 4.0], 읽기 종료예요. '["오류"]'도 실패 문구가 나와야 해요.

void step2() {
  print('--- 2단계 ---');
  // TODO ①: 여기에 text 선언과 try/catch/finally를 작성하세요.
}

// ━━━━━━━━━━ 3단계: Runnery 코드 읽기 — 읽기 실패를 화면에 알리기 ━━━━━━━━━━
// Runnery에서는 fromJson이 잘못된 값을 만나면 FormatException을 던지고(2일·3일),
// 홈 화면의 _reload가 catch에서 받아 오류 문구를 보여줘요(6주차 6일).
//
//   } catch (error) {
//     if (mounted) setState(() => _error = error);
//   }
//
// 바로 아래 [주어진 코드]는 이 흐름을 줄인 거예요. parseRecords는 음수가 있으면 실패를 던지고,
// loadMessage는 성공하면 개수를, 실패하면 오류 문구를 돌려줘요.
// [문제]
// (1) 실행 전에 loadMessage('[5, 3.2]'), loadMessage('[5, -1]'), loadMessage('깨짐')의 결과를 [내 예측]에 적으세요.
// (2) step3 안에서 세 호출을 각각 print 안에 넣어 실행하고 비교하세요.
// (3) '[5, -1]'은 JSON 모양은 맞는데 왜 실패하나요? 실패가 생기는 줄을 찾아보세요.
// [내 예측]
//
// [예상 출력]
// --- 3단계 ---
// 2개 불러옴
// 기록을 읽을 수 없어요
// 기록을 읽을 수 없어요

// [주어진 코드 — 수정하지 말고 읽기만 하세요]
List<double> parseRecords(String text) {
  final values = jsonDecode(text) as List<dynamic>;
  return values.map((v) {
    if (v is! num || v < 0) {
      throw const FormatException('Invalid record metric');
    }
    return v.toDouble();
  }).toList();
}

String loadMessage(String text) {
  try {
    final kms = parseRecords(text);
    return '${kms.length}개 불러옴';
  } catch (error) {
    return '기록을 읽을 수 없어요';
  }
}

void step3() {
  print('--- 3단계 ---');
  // TODO ①: 여기서 세 호출을 각각 print 안에 넣으세요.
}

// [내 말로 설명]
// 읽기 실패를 빈 목록으로만 바꾸면 사용자에게 무엇이 숨겨지나요?
