import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trivial_number/core/util/input_converter.dart';
import 'package:trivial_number/features/number_trivia/domain/usecases/get_concrete_number_trivia.dart';
import 'package:trivial_number/features/number_trivia/domain/usecases/get_random_number_trivia.dart';
import 'package:trivial_number/features/number_trivia/presentation/bloc/bloc.dart';
import 'package:trivial_number/features/number_trivia/presentation/bloc/number_trivia_event.dart';
import 'package:trivial_number/features/number_trivia/presentation/bloc/number_trivia_state.dart';

class NumberTriviaBloc extends Bloc<NumberTriviaEvent, NumberTriviaState> {
  final GetConcreteNumberTrivia getConcreteNumberTrivia;
  final GetRandomNumberTrivia getRandomNumberTrivia;
  final InputConverter inputConverter;

  NumberTriviaBloc({
    // Changed the name of the constructor parameter (cannot use 'this.')
    GetConcreteNumberTrivia concrete,
    GetRandomNumberTrivia random,
    this.inputConverter,
    // Asserts are how you can make sure that a passed in argument is not null.
    // We omit this elsewhere for the sake of brevity.
  })  : assert(concrete != null),
        assert(random != null),
        assert(inputConverter != null),
        getConcreteNumberTrivia = concrete,
        getRandomNumberTrivia = random,
        super(null);

  @override
  NumberTriviaState get initialState => Empty();

  @override
  Stream<NumberTriviaState> mapEventToState(
    NumberTriviaEvent event,
  ) async* {
    // TODO: Add Logic
  }
}
