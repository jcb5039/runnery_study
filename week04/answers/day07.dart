// 4주차 7일 해설 — 복습: 기록 목록에서 이름 모으기
// 문제의 결과만 출력해요. 먼저 단계마다 직접 시도한 뒤 읽고, 닫은 다음 입력을 바꾸어 다시 풀어 보세요.
// 3단계 설명: r에는 Map 하나가 통째로 들어와요. r['id']로 그 Map의 id를 꺼내 비교해요.
//            id가 r2인 Map만 남아서 길이 1, 목록 출력은 [{id: r2, name: 지우}], 없는 id는 []예요.

void main() {
  step1();
  step2();
  step3();
}

// ━━━━━━━━━━ 1단계 ━━━━━━━━━━
void step1() {
  print('--- 1단계 ---');
  final days = <Map<String, String>>[
    {'day': '월', 'memo': '휴식'},
    {'day': '화', 'memo': '5km'},
  ];
  print(days[0]['memo']);
  print(days.length);
}

// ━━━━━━━━━━ 2단계 ━━━━━━━━━━
void step2() {
  print('--- 2단계 ---');
  final records = <Map<String, String>>[
    {'name': '민수'},
    {'name': '지우'},
  ];
  for (final record in records) {
    print(record['name']);
  }
  print(records.map((record) => record['name']).toList());
}

// ━━━━━━━━━━ 3단계 ━━━━━━━━━━
final saved = <Map<String, String>>[
  {'id': 'r1', 'name': '민수'},
  {'id': 'r2', 'name': '지우'},
];

List<Map<String, String>> findById(List<Map<String, String>> records, String id) {
  return records.where((r) => r['id'] == id).toList();
}

void step3() {
  print('--- 3단계 ---');
  print(findById(saved, 'r2').length);
  print(findById(saved, 'r2'));
  print(findById(saved, 'r9'));
}
