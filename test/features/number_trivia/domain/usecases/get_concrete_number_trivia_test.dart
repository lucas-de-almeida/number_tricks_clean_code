// ignore: import_of_legacy_library_into_null_safe
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:mockito/mockito.dart';
import 'package:trivial_number/core/usecases/usecase.dart';
import 'package:trivial_number/features/number_trivia/domain/entities/number_trivia.dart';
import 'package:trivial_number/features/number_trivia/domain/repositories/number_trivia_repository.dart';
import 'package:trivial_number/features/number_trivia/domain/usecases/get_concrete_number_trivia.dart';

class MockNumberTriviaRepository extends Mock
    implements NumberTriviaRepository {}

void main() {
  GetRandomNumberTrivia usecase;
  MockNumberTriviaRepository mockNumberTriviaRepository;

  setUp(() {
    mockNumberTriviaRepository = MockNumberTriviaRepository();
    usecase = GetRandomNumberTrivia(mockNumberTriviaRepository);
  });

  final tNumberTrivia = NumberTrivia(number: 1, text: 'teste');

  test('should get trivia for the number from the repository', () async {
    when(mockNumberTriviaRepository.getRandomNumberTrivia())
        .thenAnswer((_) async => Right(tNumberTrivia));

    final result = await usecase(NoParams());

    expect(result, Right(tNumberTrivia));

    verify(mockNumberTriviaRepository.getRandomNumberTrivia());
    verifyNoMoreInteractions(mockNumberTriviaRepository);
  });
}
