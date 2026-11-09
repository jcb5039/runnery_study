// 9주차 3일 — 목록에서 선택한 값 전달
// 실행 위치: ~/src/runnery-study/practice_app
// 실행: flutter run -d chrome -t lib/week09/day03.dart
// 정답은 answers/day03.dart에 있어요.
// 오늘의 강의: week09/README.md의 "2. 생성자로 값 넘기기 — 2~3일, 6일" 섹션이에요. 그 섹션만 읽고 풀 수 있어요.
// 처음에는 stage = 0으로 예제를 봐요. 1단계를 풀면 stage = 1로 바꾸고 저장한 뒤 터미널에서 R(대문자)을 눌러요.
// 2단계, 3단계도 stage 숫자만 바꿔 확인해요. 단계마다 [문제] 바로 아래에 그 단계의 화면 클래스가 있어요.
// 다른 날짜를 열 때는 q로 종료하고 그 날짜의 -t 경로로 실행하세요.
//
// [예제 화면 / 관찰할 결과]
// 2km, 4km 중 누른 거리가 상세 화면에 표시돼요.
//
// [한 줄씩 읽기]
// 1. map이 각 거리를 ListTile로 바꿔요.
// 2. onTap 콜백이 그 항목의 km를 사용해요.
// 3. 누른 항목에 따라 상세 화면에 전달되는 값이 달라져요.

import 'package:flutter/material.dart';

int stage = 0; // 0 예제, 1·2·3 단계. 숫자를 바꾸고 저장한 뒤 R을 눌러요.

void main() {
  const pages = <Widget>[ExamplePage(), Step1Page(), Step2Page(), Step3Page()];
  runApp(MaterialApp(home: pages[stage]));
}

// [짧은 실행 예제]
class ExamplePage extends StatelessWidget {
  const ExamplePage({super.key});
  final List<int> distances = const [2, 4];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('달리기 연습')),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: distances
              .map(
                (km) => ListTile(
                  title: Text('${km}km'),
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute<void>(
                        builder: (context) => ExampleDetail(km: km),
                      ),
                    );
                  },
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}

class ExampleDetail extends StatelessWidget {
  final int km;
  const ExampleDetail({super.key, required this.km});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('기록 상세')),
      body: Center(child: Text('${km}km')),
    );
  }
}

// ━━━━━━━━━━ 1단계: 예제 따라 하기 ━━━━━━━━━━
// [문제] Step1Page의 body에 ListView를 놓고 ListTile 두 개를 넣으세요. 제목은 '메뉴 1', '메뉴 2'예요.
//        각 onTap에서 debugPrint('메뉴 1 선택'), debugPrint('메뉴 2 선택')을 하세요.
// [예상 화면]
// 메뉴 1, 메뉴 2 목록 / 메뉴 2를 누르면 터미널에 메뉴 2 선택

class Step1Page extends StatelessWidget {
  const Step1Page({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO ①: body를 ListTile 두 개가 든 ListView로 바꾸세요.
    return Scaffold(
      appBar: AppBar(title: const Text('1단계')),
      body: const Center(child: Text('TODO: 1단계 화면을 만드세요.')),
    );
  }
}

// ━━━━━━━━━━ 2단계: 직접 작성 ━━━━━━━━━━
// [문제] Step2Page의 distances = [3, 5, 7]을 final 필드로 선언하세요.
//        각 항목을 ListTile로 표시하고 onTap에서 해당 km를 RunDetail에 전달해 push하세요.
//        RunDetail은 int km를 required로 받고 거리km를 표시하세요.
// [예상 화면]
// 목록 3km, 5km, 7km / 두 번째 클릭 → 5km
// [조작을 바꿔 다시 확인] 목록을 const <int>[]로 바꾸면 항목이 없어요. 뒤에 빈 상태 표시를 연습해요.

class Step2Page extends StatelessWidget {
  const Step2Page({super.key});
  // TODO: 문제의 입력 필드나 메서드 정의 위치
  @override
  Widget build(BuildContext context) {
    // TODO: 아래 예제용 안내 화면을 문제에서 요구한 위젯으로 바꾸세요.
    return Scaffold(
      appBar: AppBar(title: const Text('달리기 연습')),
      body: Center(child: const Text('TODO: 여기에 문제 화면을 만드세요.')),
    );
  }
}

// TODO ②: 문제에서 새 클래스를 요구하면 여기에 정의하세요.

// ━━━━━━━━━━ 3단계: Runnery 코드 읽기 — 기록 목록에서 상세로 ━━━━━━━━━━
// Runnery 기록 목록은 기록 객체 목록을 받아 줄마다 그리고, 누른 기록을 상세 화면에 넘겨요.
// 바로 아래 [주어진 코드]는 그 흐름을 줄인 거예요.
//
// 읽는 법: RecordListLite는 records를 받아 for-in으로 ListTile을 만들어요(목록 안의 for는 아래 설명 참고).
//   ListTile의 onTap이 그 줄의 record를 RecordDetailLite에 넘겨 push해요.
//   children: [for (final r in records) ListTile(...)]는 records 개수만큼 ListTile을 만드는 모양이에요.
// [문제]
// (1) Step3Page의 build에서 Scaffold 대신 아래를 반환하세요.
//       RecordListLite(records: const [RecordItem('r1', 5.0), RecordItem('r2', 3.2)])
// (2) 실행 전에 목록 글자와 '3.2km'를 눌렀을 때 상세 글자를 [내 예측]에 적고 비교하세요.
// (3) 상세 화면이 보여주는 r2는 어디서 왔나요? 목록의 어느 객체인가요?
// [내 예측]
//
// [예상 화면]
// 목록: 5.0km, 3.2km / 3.2km 누르면: 기록 r2: 3.2km

// [주어진 코드 — 수정하지 말고 읽기만 하세요]
class RecordItem {
  const RecordItem(this.id, this.km);

  final String id;
  final double km;
}

class RecordListLite extends StatelessWidget {
  const RecordListLite({super.key, required this.records});

  final List<RecordItem> records;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('3단계')),
      body: ListView(
        children: [
          for (final r in records)
            ListTile(
              title: Text('${r.km}km'),
              onTap: () => Navigator.of(context).push(
                MaterialPageRoute<void>(builder: (_) => RecordDetailLite(record: r)),
              ),
            ),
        ],
      ),
    );
  }
}

class RecordDetailLite extends StatelessWidget {
  const RecordDetailLite({super.key, required this.record});

  final RecordItem record;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('상세')),
      body: Center(child: Text('기록 ${record.id}: ${record.km}km')),
    );
  }
}

class Step3Page extends StatelessWidget {
  const Step3Page({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO ①: 아래 Scaffold 대신 RecordListLite(records: ...)를 반환하세요.
    return Scaffold(
      appBar: AppBar(title: const Text('3단계')),
      body: const Center(child: Text('TODO: 3단계 화면을 만드세요.')),
    );
  }
}

// [내 말로 설명]
// onTap 안의 km는 목록 전체인가요, 선택한 항목 하나인가요?
