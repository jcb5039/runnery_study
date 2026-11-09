// 학습 자료 제작 검증용입니다. 학습자가 작성한 TODO를 채점하지 않아요.
// 날짜별 문제와 예상 결과는 각 실습 파일 안에서 직접 확인하세요.
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:runnery_practice/week07/answers/day01.dart' as structure;
import 'package:runnery_practice/week08/answers/day03.dart' as counter;
import 'package:runnery_practice/week08/answers/day04.dart' as lifecycle;
import 'package:runnery_practice/week08/answers/day05.dart' as loader;
import 'package:runnery_practice/week09/answers/day04.dart' as navigation;
import 'package:runnery_practice/week12/answers/day05.dart' as reload;
import 'package:runnery_practice/week12/answers/day07.dart' as records;
import 'package:runnery_practice/week13/answers/day06.dart' as app_lifecycle;
import 'package:runnery_practice/week14/answers/day04.dart' as login_failure;
import 'package:runnery_practice/week14/answers/day05.dart' as login_success;
import 'package:runnery_practice/week16/answers/day05.dart' as memo;

void main() {
  testWidgets('기본 구조의 제목과 본문', (tester) async {
    await tester.pumpWidget(const MaterialApp(home: structure.PracticePage()));
    expect(find.text('나의 달리기'), findsOneWidget);
    expect(find.text('오늘 3km'), findsOneWidget);
  });

  testWidgets('거리 증가와 초기화', (tester) async {
    await tester.pumpWidget(const MaterialApp(home: counter.PracticePage()));
    for (var i = 0; i < 2; i++) {
      await tester.tap(find.text('추가'));
      await tester.pump();
    }
    expect(find.text('2km'), findsOneWidget);
    await tester.tap(find.text('초기화'));
    await tester.pump();
    expect(find.text('0km'), findsOneWidget);
  });

  testWidgets('State 초기화, 갱신, 정리와 새 State', (tester) async {
    final logs = <String>[];
    final originalDebugPrint = debugPrint;
    debugPrint = (String? message, {int? wrapWidth}) {
      if (message != null) logs.add(message);
    };
    try {
      await tester.pumpWidget(const MaterialApp(home: lifecycle.PracticePage()));
      await tester.tap(find.text('기록 화면 열기'));
      await tester.pumpAndSettle();
      expect(logs.where((line) => line == '기록 initState').length, 1);
      await tester.tap(find.text('다시 그리기'));
      await tester.pump();
      expect(find.text('1'), findsOneWidget);
      expect(logs.where((line) => line == '기록 initState').length, 1);
      await tester.pageBack();
      await tester.pumpAndSettle();
      expect(logs.where((line) => line == '기록 dispose').length, 1);
      await tester.tap(find.text('기록 화면 열기'));
      await tester.pumpAndSettle();
      expect(find.text('0'), findsOneWidget);
      expect(logs.where((line) => line == '기록 initState').length, 2);
      await tester.pumpWidget(const SizedBox.shrink());
    } finally {
      debugPrint = originalDebugPrint;
    }
  });

  testWidgets('await 중 화면 제거 뒤 setState하지 않음', (tester) async {
    await tester.pumpWidget(const MaterialApp(home: loader.PracticePage()));
    await tester.tap(find.text('기록 불러오기 화면'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('불러오기'));
    await tester.pump();
    expect(find.text('불러오는 중'), findsOneWidget);
    await tester.pageBack();
    await tester.pumpAndSettle();
    await tester.pump(const Duration(seconds: 2));
    expect(tester.takeException(), isNull);
    expect(find.text('기록 불러오기 화면'), findsOneWidget);
  });

  testWidgets('화면 결과 전달과 취소', (tester) async {
    await tester.pumpWidget(const MaterialApp(home: navigation.PracticePage()));
    await tester.tap(find.text('거리 선택'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('5km 선택'));
    await tester.pumpAndSettle();
    expect(find.text('5km 선택'), findsOneWidget);
    await tester.tap(find.text('거리 선택'));
    await tester.pumpAndSettle();
    await tester.pageBack();
    await tester.pumpAndSettle();
    expect(find.text('선택 취소'), findsOneWidget);
  });

  testWidgets('저장 알림 뒤 목록을 다시 읽음', (tester) async {
    await tester.pumpWidget(const MaterialApp(home: reload.PracticePage()));
    await tester.pump();
    await tester.tap(find.text('저장'));
    await tester.pump(const Duration(milliseconds: 400));
    await tester.pump();
    expect(find.text('[3.0]'), findsOneWidget);
    await tester.pumpWidget(const SizedBox.shrink());
    expect(tester.takeException(), isNull);
  });

  testWidgets('목록과 합계가 함께 갱신되고 비워짐', (tester) async {
    await tester.pumpWidget(const MaterialApp(home: records.PracticePage()));
    for (var i = 0; i < 2; i++) {
      await tester.tap(find.text('추가'));
      await tester.pump();
    }
    expect(find.text('[3.0, 3.0]'), findsOneWidget);
    expect(find.text('합계: 6.0km'), findsOneWidget);
    await tester.tap(find.text('비우기'));
    await tester.pump();
    expect(find.text('[]'), findsOneWidget);
    expect(find.text('합계: 0.0km'), findsOneWidget);
  });

  testWidgets('앱 상태를 수신하고 제거 뒤 observer 정리', (tester) async {
    await tester.pumpWidget(
      const MaterialApp(home: app_lifecycle.PracticePage()),
    );
    tester.binding.handleAppLifecycleStateChanged(AppLifecycleState.inactive);
    await tester.pump();
    expect(find.text('inactive'), findsOneWidget);
    tester.binding.handleAppLifecycleStateChanged(AppLifecycleState.resumed);
    await tester.pump();
    expect(find.text('resumed'), findsOneWidget);
    await tester.pumpWidget(const SizedBox.shrink());
    tester.binding.handleAppLifecycleStateChanged(AppLifecycleState.inactive);
    tester.binding.handleAppLifecycleStateChanged(AppLifecycleState.resumed);
    expect(tester.takeException(), isNull);
  });

  testWidgets('로그인 실패 뒤 재시도 가능', (tester) async {
    await tester.pumpWidget(
      const MaterialApp(home: login_failure.PracticePage()),
    );
    await tester.tap(find.text('로그인'));
    await tester.pump();
    expect(find.text('로그인 중'), findsOneWidget);
    expect(
      tester.widget<ElevatedButton>(find.byType(ElevatedButton)).onPressed,
      isNull,
    );
    await tester.pump(const Duration(milliseconds: 400));
    expect(find.text('로그인 실패'), findsOneWidget);
    expect(
      tester.widget<ElevatedButton>(find.byType(ElevatedButton)).onPressed,
      isNotNull,
    );
  });

  testWidgets('로그인 성공 뒤 홈으로 교체', (tester) async {
    await tester.pumpWidget(
      const MaterialApp(home: login_success.PracticePage()),
    );
    await tester.tap(find.text('로그인'));
    await tester.pump(const Duration(milliseconds: 400));
    await tester.pumpAndSettle();
    expect(find.text('환영합니다: user-1'), findsOneWidget);
    expect(find.byType(BackButton), findsNothing);
  });

  testWidgets('메모 정상, 빈 입력, 실패 후 기존 값 유지', (tester) async {
    await tester.pumpWidget(const MaterialApp(home: memo.PracticePage()));
    await tester.tap(find.text('저장'));
    await tester.pump(const Duration(milliseconds: 400));
    expect(find.text('저장 완료'), findsOneWidget);
    expect(find.text('보관된 메모: 새 메모'), findsOneWidget);
    await tester.enterText(find.byType(TextField), '   ');
    await tester.tap(find.text('저장'));
    await tester.pump();
    expect(find.text('메모를 입력하세요'), findsOneWidget);
    await tester.enterText(find.byType(TextField), '실패할 메모');
    await tester.tap(find.byType(SwitchListTile));
    await tester.pumpAndSettle();
    await tester.tap(find.text('저장'));
    await tester.pump(const Duration(milliseconds: 400));
    expect(find.text('저장 실패'), findsOneWidget);
    expect(find.text('보관된 메모: 새 메모'), findsOneWidget);
  });
}
