# 16주차 — 한 기능을 끝까지 구현하고 설명

하루 90분을 기준으로 복습 10분 → 짧은 예제 20분 → 직접 실습 45분 → 설명과 기록 15분으로 나눠요.
기간은 추정이에요. 이해가 어려운 날은 같은 파일을 다시 연습해도 됩니다.

1일은 Dart와 [별도 Git 연습](../guides/git-practice.md), 2~7일은 Flutter예요. 2~6일은 메모 기능을 단계별로, 7일은 기록 새로고침을 예제 없이 다시 구성해요. [최종 설명 기록](../guides/final-review.md)을 채우세요.

## 이번 주 처음 만나는 개념

새 문법은 거의 없어요. 대신 **Git으로 변경 전후를 기록하는 방법**과, 지금까지 배운 것을 이어서 **기능 하나를 처음부터 끝까지 따라가는 방법**을 배워요.

| 종류 | 이번 주 예 |
| --- | --- |
| 터미널 도구(Dart 코드가 아님) | `git status`, `git diff`, `git add`, `git commit`, `git switch` |
| Dart·Flutter가 제공 | `trim`, `isEmpty`, `TextEditingController`, `SwitchListTile` |
| 작성자가 붙인 이름 | `typed`, `hello`, 실습의 `MemoStore`, `save` |

### 1. Git: 작업 파일 → 준비 → 기록 — 1일

→ 1일 문제는 이 섹션과 [별도 Git 연습](../guides/git-practice.md)만 읽고 풀 수 있어요. 3단계의 `toStringAsFixed`는 [3주차 6일](../week03/README.md)에서 배웠어요.

Git은 터미널에서 쓰는 도구예요. Dart 코드가 아니에요.

```text
작업 파일 수정 --git add--> 다음 기록에 넣을 준비 --git commit--> 기록(커밋) 하나
```

| 명령 | 하는 일 |
| --- | --- |
| `git status` | 어떤 파일이 바뀌었는지 보여줘요. |
| `git diff` | 아직 add하지 않은 변경에서 어떤 줄이 바뀌었는지 보여줘요. |
| `git add 파일` | 그 파일의 지금 내용을 다음 기록에 넣을 준비를 해요. |
| `git commit -m "메시지"` | 준비한 내용을 기록 하나로 남겨요. |
| `git switch -c 이름` | 새 브랜치(따로 쌓는 기록 줄기)를 만들고 그쪽으로 옮겨요. |

`print('${n}잔');`을 `print('${n}컵');`으로 고쳤다면 `git diff`는 이렇게 보여줘요.

```diff
-  print('${n}잔');
+  print('${n}컵');
```

- `-`는 지워진 줄, `+`는 새로 생긴 줄이에요. 이 기호는 코드에 넣는 글자가 아니라 diff가 보여주는 표시예요.
- 커밋한 뒤 다시 고친 내용은 자동으로 커밋에 들어가지 않아요. 다시 `add`와 `commit`을 해야 해요.
- 연습은 [별도 Git 연습](../guides/git-practice.md)에서 안내하는 새 폴더에서 해요. 이 학습 폴더나 Runnery의 기록은 건드리지 않아요. → [1일](day01.dart)

### 2. 입력값 검사: trim과 isEmpty — 2일

→ 2일 문제는 이 섹션과 아래 3번 섹션의 표를 읽으면 풀 수 있어요.

```dart
void main() {
  final typed = '   ';
  print(typed.isEmpty);
  print(typed.trim().isEmpty);

  final hello = '  안녕  ';
  print('[${hello.trim()}]');
}
```

- `trim()`: 문자열 **양끝의 공백**을 지운 새 문자열을 돌려줘요. 가운데 공백은 그대로예요.
- 공백만 입력하면 `isEmpty`는 `false`예요. 하지만 `trim()`한 뒤에는 `true`예요. 그래서 입력이 비었는지는 trim한 뒤에 검사해요.
- `[ ]`는 출력에서 공백이 지워졌는지 눈으로 보려고 붙인 글자예요.

**예상 출력**

```text
false
true
[안녕]
```

**2일 3단계에 필요한 것: Map 펼치기 `...`**

```dart
void main() {
  final base = {'km': 5.0, 'memo': ''};
  final changed = {...base, 'memo': '비 옴'};
  print(base);
  print(changed);
}
```

- `...base`: base Map의 키와 값을 **그 자리에 펼쳐 넣어요**. 그 뒤에 같은 키 `'memo'`를 쓰면 뒤에 쓴 값이 덮어써요.
- 원래 `base`는 바뀌지 않아요. 새 Map이 하나 더 생긴 거예요. Runnery는 이렇게 메모만 다른 **새 기록**을 만들어요.
- 실습의 `json['km'] as double`은 11주차의 `as`예요.

**예상 출력**

```text
{km: 5.0, memo: }
{km: 5.0, memo: 비 옴}
```

→ [2일](../practice_app/lib/week16/day02.dart)

### 3. 기능 하나를 끝까지 따라가기 — 2~7일

→ 3~7일 문제는 이 섹션과, 각 줄에 적힌 이전 주차 내용으로 풀 수 있어요.

이번 주 Flutter 실습은 아래 표의 칸을 하나씩 채우는 연습이에요. [12주차](../week12/README.md)의 `CupStore` 예제로 먼저 채워 보면 이래요.

| 단계 | 질문 | 12주차 마시기 버튼 예 |
| --- | --- | --- |
| 사용자 행동 | 무엇을 누르나요? | 마시기 버튼 |
| 콜백 | 어떤 함수가 불리나요? | `store.drink` |
| 데이터 처리 | 어떤 값이 어떻게 바뀌나요? | `cups`가 0에서 1로 |
| 기다림과 실패 | `await`가 있나요? 실패하면요? | 없음(메모리 값만 바꿈) |
| 상태 갱신 | 화면에 무엇으로 알리나요? | `notifyListeners()` |
| 화면 표시 | 어느 위젯이 새 값을 보여주나요? | `ListenableBuilder` 안의 `Text` |
| 정리 | 언제 무엇을 정리하나요? | 화면의 `dispose`에서 `store.dispose()` |

- 이번 주 메모 기능에는 "기다림과 실패" 칸이 채워져요. 저장소는 **성공을 확인한 뒤에만** 저장값을 바꾸고, 실패하면 throw해서 기존 값을 그대로 둬요. 화면은 그 실패를 `catch`에서 표시해요. → [3일](../practice_app/lib/week16/day03.dart), [4일](../practice_app/lib/week16/day04.dart)
- 정상 입력, 빈 입력, 실패, 세 경우를 모두 실행해 보고 예상과 비교해요. `SwitchListTile`은 켜고 끄는 스위치가 달린 목록 한 줄이에요. 성공·실패 입력을 화면에서 바꾸는 데 써요. → [5일](../practice_app/lib/week16/day05.dart)
- 화면에 들어가서 나올 때까지 `initState` → 저장 → `dispose`를 로그로 따라가요(8주차). → [6일](../practice_app/lib/week16/day06.dart), 7일은 [최종 복습](../practice_app/lib/week16/day07.dart)이에요.
- 다 채운 표는 [최종 설명 기록](../guides/final-review.md)에 옮겨 적어요.

**3~7일 3단계에 필요한 것**

- 3일: `if (value.length > 20) throw StateError(...)`처럼 저장 함수가 마지막으로 규칙을 확인해요. `length`는 글자 수예요. throw가 `memo = value;`보다 위에 있어서 실패하면 보관된 값이 그대로예요.
- 4일: 6주차 6일과 같아요. 실패하면 `catch`에서 오류만 바꾸고 목록은 건드리지 않아요.
- 5일: `SwitchListTile`의 `subtitle`은 제목 아래 작은 설명 글자예요. `onChanged: (v) => setState(() => autoPause = v)`의 `v`는 스위치의 새 값(true/false)이에요. `onChanged`에 null을 넣으면 스위치가 꺼져서(비활성) 누를 수 없어요.
- 6일: 13주차 5일의 `Timer.periodic`을 State 안에서 `initState`에 켜고 `dispose`에서 `cancel()`해요. `Timer`를 쓰려면 파일 맨 위에 `import 'dart:async';`가 있어야 해요.
- 7일: `where((r) => r.startedAt.year == now.year && r.startedAt.month == now.month && r.startedAt.day == now.day)`는 연·월·일이 **모두** 같은 기록만 남겨요(`&&`). 그다음 4주차 `fold`로 거리를 더해요.

### 확인 질문

1. `'  런  '.trim().length`는 얼마일까요?
2. 커밋한 뒤 파일을 한 번 더 고치고 `git status`를 실행하면 어떻게 보일지 예측해 보세요.

## 하루별 자료

| 날짜 | 실습 | 실행 방식 | 막혔을 때 볼 해설 |
| --- | --- | --- | --- |
| 1일 | [Git으로 변경 전후 확인하기](day01.dart) | Dart 콘솔 | [해설](answers/day01.dart) |
| 2일 | [기능 선택: 메모 변경 흐름](../practice_app/lib/week16/day02.dart) | Flutter 화면 | [해설](../practice_app/lib/week16/answers/day02.dart) |
| 3일 | [화면과 저장 함수 나누기](../practice_app/lib/week16/day03.dart) | Flutter 화면 | [해설](../practice_app/lib/week16/answers/day03.dart) |
| 4일 | [실패하면 기존 값 유지하기](../practice_app/lib/week16/day04.dart) | Flutter 화면 | [해설](../practice_app/lib/week16/answers/day04.dart) |
| 5일 | [정상·빈 값·실패를 같은 화면에서 확인](../practice_app/lib/week16/day05.dart) | Flutter 화면 | [해설](../practice_app/lib/week16/answers/day05.dart) |
| 6일 | [화면 진입부터 종료까지 추적](../practice_app/lib/week16/day06.dart) | Flutter 화면 | [해설](../practice_app/lib/week16/answers/day06.dart) |
| 7일 | [최종 복습: 기록 목록 새로고침](../practice_app/lib/week16/day07.dart) | Flutter 화면 | [해설](../practice_app/lib/week16/answers/day07.dart) |

## 실행

Dart 파일은 학습 폴더에서 실행해요.

```bash
cd ~/src/runnery-study
dart run week16/day01.dart
```

Flutter 파일은 [실습 앱 안내](../practice_app/README.md)를 먼저 읽고 실행해요.

```bash
cd ~/src/runnery-study/practice_app
flutter run -d chrome -t lib/week16/day02.dart
```

`stage = 0`으로 예제를 보고, `Step1Page`부터 차례로 푼 뒤 `stage`를 1, 2, 3으로 바꿔요. 저장 후 `R`로 다시 시작해요. 다른 날짜는 `q`로 종료한 뒤 `-t` 경로를 바꿔 실행해요. 해설은 경로에 `answers/`를 넣어 실행해요. 각 파일은 자기 `main()`을 가진 독립 실습이에요.

## 푸는 순서

1. 예제의 출력 또는 화면 변화를 먼저 예측하고 실행해요.
2. 파일의 줄별 설명을 읽고 입력·호출·반환·표시 위치를 찾아요.
3. 먼저 그날 파일 맨 위 "오늘의 강의"에 적힌 README 섹션을 읽어요. 날짜마다 1단계(예제 따라 하기) → 2단계(직접 작성) → 3단계(Runnery 코드 읽기) 문제가 있고, 단계마다 문제 바로 아래에 코드를 쓰는 자리가 있어요. 한 단계의 결과가 예상과 같으면 다음 단계로 넘어가요. Flutter 파일은 `stage` 숫자를 1, 2, 3으로 바꿔 단계 화면을 확인해요.
4. 입력값이나 조작을 바꾸어 추가 사례도 확인해요.
5. 정답을 봤다면 닫고 비슷한 입력으로 다시 작성해요. [학습 기록](../notes.md)에 막힌 줄을 적어요.

해설은 별도 파일이며 문제 결과만 실행해요. 다른 날짜의 풀이를 import하거나 숨겨진 채점 함수에 값을 전달하지 않아요.

## 이번 주 통과 기준

정상·빈 값·실패를 확인하고 사용자 행동부터 데이터와 화면까지 원본에서 설명한다.

7일 복습을 마친 뒤, 입력을 바꾼 결과를 실행 전에 예측하고 자기 말로 설명할 수 있는지 확인하세요. 둘 중 하나가 어렵다면 해당 날짜를 다시 풀고 다음 주로 넘어가요. 파일을 다 열었다는 것만으로 통과하지 않아요.

## Runnery에서 읽을 곳

`선택한 기능의 호출부터 화면 반영까지`를 [코드 지도](../project-map.md)에서 찾아요. 메모 변경 또는 기록 목록 새로고침 중 하나를 골라 파일 이름과 함수 이름을 기록해요. 원본 수정 없이 읽고, 실험은 이 학습 폴더에서 해요.

[전체 학습 순서](../roadmap.md) · [학습 기록](../notes.md)
