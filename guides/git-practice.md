# 16주 1일 — 별도 폴더에서 Git 연습

Git은 코드의 변경 전후를 기록해요. 학습 폴더 안에 작은 **별도 저장소**를 만들고 하루 파일의 복사본으로 연습해요. 아래 준비 명령은 한 번만 실행하세요.

```bash
cd ~/src/runnery-study
mkdir -p week16/git-practice
cp week16/day01.dart week16/git-practice/main.dart
cd week16/git-practice
git init
git status
git add main.dart
git commit -m "연습 시작점"
git switch -c practice/record-label
```

커밋 시 이름과 이메일을 요구하면 이 연습 저장소에서 `git config user.name "본인 이름"`, `git config user.email "본인 이메일"`로 본인의 값을 설정한 뒤 다시 커밋하세요. `--global`은 필요 없어요.

1. `mkdir`로 공간을 만들고 `cp`로 그날 파일을 복사해요.
2. `cd`로 들어간 폴더에서 이후 Git 명령을 실행해요.
3. `git init`이 이 폴더의 변경 기록을 시작해요.
4. `git status`는 새 파일·수정 파일·커밋 대기 상태를 보여줘요.
5. `git add`가 현재 파일 내용을 다음 기록에 포함하도록 준비해요.
6. `git commit`이 준비한 내용을 한 시점의 기록으로 남겨요.
7. `git switch -c`가 연습용 브랜치를 만들고 이동해요.

이제 **복사본 `week16/git-practice/main.dart`**를 열어 TODO를 풀고 저장하세요. 같은 연습 폴더에서 실행해요.

```bash
dart run main.dart
git status
git diff
```

파일은 1·2·3단계로 나뉘어 있어요. 1단계를 풀고 저장한 뒤 `git status`와 `git diff`를 보고, 2단계를 풀어 `--- 2단계 ---` 아래에 `기록: 5km`가 보이면 아래처럼 기록해요. `git diff`의 `+`는 추가된 줄, `-`는 제거된 줄이에요. 이 기호는 Dart 코드에 넣는 문자가 아니에요.

확인한 변경을 기록해요.

```bash
git add main.dart
git diff --staged
git commit -m "거리 표시 연습"
git log --oneline -3
```

비슷한 실습: 5를 3으로 바꾸고 실행 → diff → add → staged diff → commit을 다시 해보세요. **마지막 커밋 뒤에 고친 내용이 자동으로 커밋에 들어가는지** 설명하세요.

다시 시작할 때는 `cd ~/src/runnery-study/week16/git-practice`부터 실행해요. 이미 수정한 복사본 위에 `cp`를 다시 실행하면 덮어쓰므로 준비 명령을 반복하지 마세요.
