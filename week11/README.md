# 11주차 — JSON과 파일 저장

하루 90분을 기준으로 복습 10분 → 짧은 예제 20분 → 직접 실습 45분 → 설명과 기록 15분으로 나눠요.
기간은 추정이에요. 이해가 어려운 날은 같은 파일을 다시 연습해도 됩니다.

파일 쓰기 실습은 이 학습 폴더의 `week11/data/`만 사용해요. 4~5일은 같은 실습 파일을 덮어써요. 7일은 쓰기와 읽기 모드를 나누어 재실행 뒤 값이 남는지 확인해요. 브라우저용 Flutter 앱에는 `dart:io` 코드를 그대로 넣지 않아요. 플랫폼에 맞는 영구 저장 구현은 이 기본 과정 이후의 확장이에요.

## 이번 주 처음 만나는 개념

지금까지 변수에 넣은 값은 프로그램이 끝나면 사라졌어요. 이번 주에는 값을 **JSON이라는 글자로 바꿔 파일에 저장하고, 다시 읽어서 되살리는** 방법을 배워요.

```text
저장: 객체 → Map → JSON 문자열 → 파일
복원: 파일 → JSON 문자열 → Map → 객체
```

| 종류 | 이번 주 예 |
| --- | --- |
| 키워드 | `import`, `as`, `factory`, `dynamic` |
| Dart가 제공 | `dart:convert`, `jsonEncode`, `jsonDecode`, `num`, `dart:io`, `File`, `writeAsString`, `readAsString`, `exists` |
| 작성자가 붙인 이름 | `book`, `text`, `back`, `Book`, `toJson`, `fromJson`, `file` |

### 1. Map과 JSON 문자열 — 1~2일

```dart
import 'dart:convert';

void main() {
  final book = {'title': '달리기', 'pages': 120};
  final text = jsonEncode(book);
  print(text);

  final back = jsonDecode(text) as Map<String, dynamic>;
  print(back['pages']);
}
```

- `import 'dart:convert';`: Dart가 제공하는 변환 도구를 가져와요.
- `jsonEncode(book)`: Map을 **JSON 문자열**로 바꿔요. JSON은 파일 저장이나 서버 전송에 쓰는, 약속된 모양의 글자예요. 결과는 그냥 `String`이라서 `text['title']`처럼 키로 꺼낼 수 없어요.
- `jsonDecode(text)`: 반대로 문자열을 다시 자료로 바꿔요. 결과의 타입은 `dynamic`(무엇이든 될 수 있음)이에요.
- `as Map<String, dynamic>`: "이 값을 키가 String인 Map으로 다룰게"라는 표시예요. 값을 바꿔 주는 게 아니라 **확인**만 해서, 실제 모양이 다르면 오류가 나요.
- `num`: `int`와 `double`을 함께 부르는 타입이에요. JSON의 숫자는 `2`처럼 정수로 올 수도 있어서 `(값 as num).toDouble()`로 double로 맞춰요. → [2일](day02.dart)

**예상 출력**

```text
{"title":"달리기","pages":120}
120
```

→ [1일](day01.dart)

### 2. 객체를 저장하고 되살리기: toJson, fromJson — 3일

```dart
import 'dart:convert';

void main() {
  final original = Book('달리기', 120);
  final text = jsonEncode(original.toJson());
  final copy = Book.fromJson(jsonDecode(text) as Map<String, dynamic>);
  print(text);
  print(copy.title);
}

class Book {
  final String title;
  final int pages;

  Book(this.title, this.pages);

  Map<String, Object> toJson() => {'title': title, 'pages': pages};

  factory Book.fromJson(Map<String, dynamic> data) {
    return Book(data['title'] as String, data['pages'] as int);
  }
}
```

- `toJson()`: 작성자가 만든 메서드예요. 객체의 필드를 Map으로 꺼내요. 많은 코드가 이 이름을 쓰지만 Dart 키워드는 아니에요.
- `Book.fromJson(...)`: 이름이 붙은 생성자예요. `factory`는 "안에서 직접 계산해서 객체를 만들어 돌려주는 생성자"라는 키워드예요. Map에서 값을 꺼내 일반 생성자 `Book(...)`을 호출해요.
- `copy`는 `original`과 **값이 같은 새 객체**예요.

| 함수 | 정의 | 호출 | 입력 | 반환 |
| --- | --- | --- | --- | --- |
| `toJson` | `Book` 안 메서드 | `original.toJson()` | 없음(자기 필드를 읽음) | `Map` |
| `Book.fromJson` | `Book` 안 factory 생성자 | `main`의 `Book.fromJson(...)` | `jsonDecode`로 되돌린 Map | 새 `Book` 객체 |

**예상 출력**

```text
{"title":"달리기","pages":120}
달리기
```

→ [3일](day03.dart)

### 3. 파일 쓰기와 읽기 — 4~5일, 7일

```dart
import 'dart:io';

Future<void> main() async {
  final file = File('week11/data/concept_example.txt');
  await file.parent.create(recursive: true);
  await file.writeAsString('안녕');
  print(await file.readAsString());
  print(await file.exists());
}
```

- `import 'dart:io';`: 파일을 다루는 Dart 도구예요. 브라우저용 Flutter 앱에서는 쓸 수 없어서, 이번 주는 Dart 콘솔로만 실습해요.
- `File('...')`: 파일 경로를 가리키는 객체예요. 만들기만 해서는 파일이 생기지 않아요. 경로는 터미널의 현재 폴더(`~/src/runnery-study`)를 기준으로 찾아요.
- `file.parent.create(recursive: true)`: 파일이 들어갈 폴더를 준비해요.
- `writeAsString`: 글자를 파일에 써요. 기존 내용은 덮어써요. `readAsString`: 파일 내용을 읽어요. `exists()`: 파일이 있으면 `true`예요.
- 셋 다 디스크를 다루느라 시간이 걸려서 `Future`를 돌려줘요. 그래서 `await`로 기다려요(6주차). 읽은 목록을 돌려주는 함수는 `Future<List<double>>`처럼 "나중에 double 목록이 준비된다"고 적어요. → [5일](day05.dart)

**예상 출력**

```text
안녕
true
```

실행이 끝난 뒤에도 `week11/data/concept_example.txt` 파일은 남아 있어요. 프로그램이 끝나면 사라지는 변수와 다른 점이에요. 확인한 뒤에는 이 파일을 지워도 돼요. → [4일](day04.dart), [7일](day07.dart)

### 4. 깨진 내용 읽기 — 6일

6주차의 `try`/`catch`를 그대로 써요. `jsonDecode('깨진 글자')`처럼 JSON 모양이 아닌 글자를 바꾸면 실패해요. 실패를 빈 목록으로 조용히 바꾸면 사용자는 기록이 사라진 줄 알 수 있어요. 그래서 읽기에 실패했다는 사실을 따로 알려요. → [6일](day06.dart)

### 확인 질문

1. `jsonEncode({'km': 3})`의 결과에 `['km']`를 붙여 값을 꺼낼 수 있을까요? 결과의 타입으로 설명해 보세요.
2. 프로그램을 다시 실행했을 때 남아 있는 것은 변수 값과 파일 내용 중 어느 쪽인가요?

## 하루별 자료

| 날짜 | 실습 | 실행 방식 | 막혔을 때 볼 해설 |
| --- | --- | --- | --- |
| 1일 | [Map과 JSON 문자열](day01.dart) | Dart 콘솔 | [해설](answers/day01.dart) |
| 2일 | [JSON에서 Map으로 돌아오기](day02.dart) | Dart 콘솔 | [해설](answers/day02.dart) |
| 3일 | [객체를 저장하고 복원하기](day03.dart) | Dart 콘솔 | [해설](answers/day03.dart) |
| 4일 | [실습 파일 쓰기와 읽기](day04.dart) | Dart 콘솔 | [해설](answers/day04.dart) |
| 5일 | [Future로 기록 목록 읽기](day05.dart) | Dart 콘솔 | [해설](answers/day05.dart) |
| 6일 | [깨진 저장 내용 처리하기](day06.dart) | Dart 콘솔 | [해설](answers/day06.dart) |
| 7일 | [복습: 재실행해도 남는 기록](day07.dart) | Dart 콘솔 | [해설](answers/day07.dart) |

## 실행

Dart 파일은 학습 폴더에서 실행해요.

```bash
cd ~/src/runnery-study
dart run week11/day01.dart
```

## 푸는 순서

1. 예제의 출력 또는 화면 변화를 먼저 예측하고 실행해요.
2. 파일의 줄별 설명을 읽고 입력·호출·반환·표시 위치를 찾아요.
3. TODO 영역에 문제를 직접 풀어요. 예상 결과는 파일 안에 공개되어 있어요.
4. 입력값이나 조작을 바꾸어 추가 사례도 확인해요.
5. 정답을 봤다면 닫고 비슷한 입력으로 다시 작성해요. [학습 기록](../notes.md)에 막힌 줄을 적어요.

해설은 별도 파일이며 문제 결과만 실행해요. 다른 날짜의 풀이를 import하거나 숨겨진 채점 함수에 값을 전달하지 않아요.

## 이번 주 통과 기준

Map·JSON·파일을 구분하고 쓰기 실행 후 별도의 읽기 실행으로 같은 값을 확인한다.

7일 복습을 마친 뒤, 입력을 바꾼 결과를 실행 전에 예측하고 자기 말로 설명할 수 있는지 확인하세요. 둘 중 하나가 어렵다면 해당 날짜를 다시 풀고 다음 주로 넘어가요. 파일을 다 열었다는 것만으로 통과하지 않아요.

## Runnery에서 읽을 곳

`RunningRecordStore의 save, _saveLocal, load`를 [코드 지도](../project-map.md)에서 찾아요. 서버 동기화는 호출 위치만 표시하고 로컬 파일 흐름을 먼저 읽어요. 원본 수정 없이 읽고, 실험은 이 학습 폴더에서 해요.

[전체 학습 순서](../roadmap.md) · [학습 기록](../notes.md)
