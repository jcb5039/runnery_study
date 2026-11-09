# 15주차 — 로컬 저장과 서버 동기화

하루 90분을 기준으로 복습 10분 → 짧은 예제 20분 → 직접 실습 45분 → 설명과 기록 15분으로 나눠요.
기간은 추정이에요. 이해가 어려운 날은 같은 파일을 다시 연습해도 됩니다.

이번 주 local/server/pending은 모두 메모리 모형이에요. 실제 서버나 계정에 접속하지 않아요. 재실행 시 초기화되므로 앱 종료 뒤 재시도까지 구현한 것으로 해석하지 마세요. [동기화 흐름 정리](../guides/sync-flow.md)에 오프라인·삭제·실패 경로를 직접 적어요.

## 이번 주 처음 만나는 개념

Runnery는 기록을 **폰에 먼저 저장하고**, 나중에 **서버로 보내요**. 이번 주에는 Map과 List로 폰(로컬), 서버, 보낼 작업 목록을 흉내 내요. 실제 서버에는 접속하지 않아요. 값은 메모리에만 있어서 다시 실행하면 처음으로 돌아가요.

| 종류 | 이번 주 예 |
| --- | --- |
| Dart가 제공 | `Map`, `remove`, `entries`, `key`, `value`, `List.from` |
| 작성자가 붙인 이름 | `phone`, `cloud`, `waiting`, `scores`, `entry` (실습 파일에서는 `local`, `server`, `pending`) |

### 1. 저장소 두 개는 따로 움직여요 — 1~2일

```dart
void main() {
  final phone = <String, String>{};
  final cloud = <String, String>{};
  final waiting = <String>[];

  phone['memo-1'] = '물 마시기';
  waiting.add('memo-1');

  print('폰: $phone');
  print('클라우드: $cloud');
  print('보낼 작업: $waiting');
}
```

- `phone`, `cloud`, `waiting`은 작성자가 붙인 이름이에요. 실습 파일에서는 각각 `local`, `server`, `pending`이라고 불러요.
- 폰 Map에 넣어도 클라우드 Map에는 **자동으로 들어가지 않아요**. 보내는 코드가 따로 실행돼야 해요.
- `waiting`(pending)은 아직 서버에 못 보낸 기록의 ID 목록이에요. 기록 자체가 아니라 **할 일 목록**이에요.

**예상 출력**

```text
폰: {memo-1: 물 마시기}
클라우드: {}
보낼 작업: [memo-1]
```

→ [1일](day01.dart), [2일](day02.dart)

### 2. 성공을 확인한 뒤에만 지우기 — 3일

보낼 작업은 서버 전송이 **성공한 뒤에** 목록에서 지워요.

```text
전송 시도 (await)
  ├─ 성공 → 보낼 작업에서 ID 제거
  └─ 실패(throw) → catch로 이동, 보낼 작업은 그대로 → 나중에 다시 시도
```

먼저 지우고 보냈는데 실패하면, 무엇을 다시 보내야 하는지 잊어버려요. 6주차에서 배운 것처럼 `try` 안에서 `await` **다음 줄**은 성공했을 때만 실행돼요. 이 점을 이용해요. → [3일](day03.dart)

### 3. 같은 키, 지우기, 키와 값 짝 꺼내기 — 4~6일

```dart
void main() {
  final scores = {'민': 70};
  scores['민'] = 80;
  scores['준'] = 90;
  print(scores);
  print(scores.length);

  scores.remove('민');
  for (final entry in scores.entries) {
    print('${entry.key}=${entry.value}');
  }
}
```

- 같은 키에 다시 넣으면 항목이 늘지 않고 **값만 바뀌어요**. 그래서 같은 기록을 두 번 보내도 ID가 같으면 서버에 하나만 남아요. → [4일](day04.dart)
- `remove('민')`: 그 키와 값을 지워요. 폰에서만 지우면 서버에는 남아 있어요. 그래서 지운 ID도 따로 보관했다가 서버에 전달해요. → [5일](day05.dart)
- `scores.entries`: 키와 값의 **짝**들이에요. 각 짝의 `.key`와 `.value`로 꺼내요. → [6일](day06.dart)

**예상 출력**

```text
{민: 80, 준: 90}
2
준=90
```

7일의 `List<String>.from(목록)`은 목록의 **복사본**을 만들어요. 목록을 `for-in`으로 돌면서 같은 목록의 항목을 지우면 Dart가 `Concurrent modification during iteration` 오류를 내요. 그래서 복사본을 돌면서 원본에서 지워요. → [7일](day07.dart). 전체 흐름은 [동기화 흐름 정리](../guides/sync-flow.md)의 표에 직접 적어 보세요.

### 확인 질문

1. 서버 전송이 성공했는데 보낼 작업 목록에서 ID를 지우지 않으면 다음 동기화 때 무슨 일이 생길까요? ID가 같다면 서버 기록 개수는 어떻게 될지도 함께 설명해 보세요.
2. 화면에 "폰에 저장 완료"와 "서버 전송 완료"를 따로 표시해야 하는 이유를 말해 보세요.

## 하루별 자료

| 날짜 | 실습 | 실행 방식 | 막혔을 때 볼 해설 |
| --- | --- | --- | --- |
| 1일 | [로컬 저장과 서버 저장 구분](day01.dart) | Dart 콘솔 | [해설](answers/day01.dart) |
| 2일 | [보낼 작업을 목록에 보관하기](day02.dart) | Dart 콘솔 | [해설](answers/day02.dart) |
| 3일 | [실패한 작업은 남기기](day03.dart) | Dart 콘솔 | [해설](answers/day03.dart) |
| 4일 | [같은 ID로 중복 전송하기](day04.dart) | Dart 콘솔 | [해설](answers/day04.dart) |
| 5일 | [삭제도 전달할 작업](day05.dart) | Dart 콘솔 | [해설](answers/day05.dart) |
| 6일 | [서버에서 목록 받기와 충돌](day06.dart) | Dart 콘솔 | [해설](answers/day06.dart) |
| 7일 | [복습: 오프라인 저장 후 재시도](day07.dart) | Dart 콘솔 | [해설](answers/day07.dart) |

## 실행

Dart 파일은 학습 폴더에서 실행해요.

```bash
cd ~/src/runnery-study
dart run week15/day01.dart
```

## 푸는 순서

1. 예제의 출력 또는 화면 변화를 먼저 예측하고 실행해요.
2. 파일의 줄별 설명을 읽고 입력·호출·반환·표시 위치를 찾아요.
3. TODO 영역에 문제를 직접 풀어요. 예상 결과는 파일 안에 공개되어 있어요.
4. 입력값이나 조작을 바꾸어 추가 사례도 확인해요.
5. 정답을 봤다면 닫고 비슷한 입력으로 다시 작성해요. [학습 기록](../notes.md)에 막힌 줄을 적어요.

해설은 별도 파일이며 문제 결과만 실행해요. 다른 날짜의 풀이를 import하거나 숨겨진 채점 함수에 값을 전달하지 않아요.

## 이번 주 통과 기준

오프라인 저장과 전송 성공을 구분하고 실패 작업·중복 ID·삭제 전달의 이유를 설명한다.

7일 복습을 마친 뒤, 입력을 바꾼 결과를 실행 전에 예측하고 자기 말로 설명할 수 있는지 확인하세요. 둘 중 하나가 어렵다면 해당 날짜를 다시 풀고 다음 주로 넘어가요. 파일을 다 열었다는 것만으로 통과하지 않아요.

## Runnery에서 읽을 곳

`RecordSync의 recordSaved, syncNow, _push, _pull`를 [코드 지도](../project-map.md)에서 찾아요. 이번 Map 모형과 실제 영구 저장·충돌 규칙의 차이를 표시해요. 원본 수정 없이 읽고, 실험은 이 학습 폴더에서 해요.

[전체 학습 순서](../roadmap.md) · [학습 기록](../notes.md)
