// 11주차 6일 해설 — 깨진 내용 읽기
// 문제의 결과만 출력해요. 먼저 단계마다 직접 시도한 뒤 읽고, 닫은 다음 입력을 바꾸어 다시 풀어 보세요.
// 3단계 설명: '[5, -1]'은 jsonDecode는 통과하지만 map 안에서 -1을 만나 throw해요.
//            '깨짐'은 jsonDecode에서 바로 실패해요. 둘 다 loadMessage의 catch가 받아요.

import 'dart:convert';

void main() {
  step1();
  step2();
  step3();
}

// ━━━━━━━━━━ 1단계 ━━━━━━━━━━
void step1() {
  print('--- 1단계 ---');
  try {
    print(jsonDecode('[1,2]'));
  } catch (error) {
    print('읽기 실패');
  }
}

// ━━━━━━━━━━ 2단계 ━━━━━━━━━━
void step2() {
  print('--- 2단계 ---');
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

// ━━━━━━━━━━ 3단계 ━━━━━━━━━━
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
  print(loadMessage('[5, 3.2]'));
  print(loadMessage('[5, -1]'));
  print(loadMessage('깨짐'));
}
