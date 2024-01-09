import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'cards_event.dart';

part 'cards_state.dart';

part 'cards_bloc.freezed.dart';

class CardsBloc extends Bloc<CardsEvent, CardsState> {
  CardsBloc() : super(const CardsState.initial()) {
    on<CardsEvent>(_mapEventToState);
  }

  final List<Map<String, dynamic>> cardsList = [
    {
      'name': 'How can i help you with such a complicated task?',
      'toDelete': false
    },
    {'name': 'Sad', 'toDelete': false},
    {'name': 'Happy', 'toDelete': false},
    {'name': 'Anxious', 'toDelete': false},
    {'name': 'A sleep', 'toDelete': false}
  ];
  bool isEditMode = false;

  Future<void> _mapEventToState(CardsEvent event, Emitter<CardsState> emit) =>
      event.map(
        createNewCard: (event) => _createNewCard(event, emit),
        deleteSelectedCards: (event) => _deleteSelectedCards(event, emit),
        editCard: (event) => _editCard(event, emit),
        selectCard: (event) => _selectCard(event, emit),
        selectProfile: (event) => _selectProfile(event, emit),
        started: (event) => _started(event, emit),
      );

  Future<void> _createNewCard(
      CardsEvent event, Emitter<CardsState> emit) async {
    emit(const CardsState.initial());
  }

  Future<void> _editCard(CardsEvent event, Emitter<CardsState> emit) async {}

  Future<void> _selectCard(CardsEvent event, Emitter<CardsState> emit) async {
    emit(const CardsState.viewIndividualCard());
  }

  Future<void> _selectProfile(
      CardsEvent event, Emitter<CardsState> emit) async {}

  Future<void> _started(CardsEvent event, Emitter<CardsState> emit) async {}

  Future<void> _deleteSelectedCards(
      CardsEvent event, Emitter<CardsState> emit) async {}
}
