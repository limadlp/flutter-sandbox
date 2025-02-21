import 'package:cubit_tdd_todo/src/cubits/board_cubit.dart';
import 'package:cubit_tdd_todo/src/pages/board_page.dart';
import 'package:cubit_tdd_todo/src/repositories/board_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class BoardRepositoryMock extends Mock implements BoardRepository {}

void main() {
  late BoardRepositoryMock repository = BoardRepositoryMock();
  late BoardCubit cubit;
  setUp(() {
    repository = BoardRepositoryMock();
    cubit = BoardCubit(repository);
  });
  testWidgets('board page with all tasks', (tester) async {
    when(() => repository.fetch()).thenAnswer((_) async => []);
    await tester.pumpWidget(
      BlocProvider.value(value: cubit, child: MaterialApp(home: BoardPage())),
    );
    expect(find.byKey(const Key("EmptyState")), findsOneWidget);
    await tester.pump(const Duration(seconds: 2));
    expect(find.byKey(const Key("GettedState")), findsOneWidget);
  });

  testWidgets('board page with failure state', (tester) async {
    when(() => repository.fetch()).thenThrow(Exception('Error'));
    await tester.pumpWidget(
      BlocProvider.value(value: cubit, child: MaterialApp(home: BoardPage())),
    );
    expect(find.byKey(const Key("EmptyState")), findsOneWidget);
    await tester.pump(const Duration(seconds: 2));
    expect(find.byKey(const Key("FailureState")), findsOneWidget);
  });
}
