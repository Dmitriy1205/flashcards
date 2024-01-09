import 'package:bloc/bloc.dart';
import 'package:flashcards/domain/entities/card_entity/card_entity.dart';
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
      'name': CardEntity(
          front: 'How can i help you with such a complicated task?',
          back: 'Back'),
      'toDelete': false
    },
    {'name': CardEntity(front: 'Sad', back: 'sad Back'), 'toDelete': false},
    {'name': CardEntity(front: 'Happy', back: 'Happy Back'), 'toDelete': false},
    {
      'name': CardEntity(front: 'Anxious', back: 'Anxious Back'),
      'toDelete': false
    },
    {'name': CardEntity(front: 'sleep', back: 'sleep Back'), 'toDelete': false}
  ];
  bool isEditMode = false;

  Future<void> _mapEventToState(CardsEvent event, Emitter<CardsState> emit) =>
      event.map(
        createNewCard: (event) => _createNewCard(event, emit),
        deleteSelectedCards: (event) => _deleteSelectedCards(event, emit),
        editCard: (event) => _editCard(event, emit),
      );

  Future<void> _createNewCard(
      CardsEvent event, Emitter<CardsState> emit) async {
    emit(const CardsState.initial());
  }

  Future<void> _editCard(CardsEvent event, Emitter<CardsState> emit) async {}

  Future<void> _deleteSelectedCards(
      CardsEvent event, Emitter<CardsState> emit) async {
    cardsList.removeWhere((element) => element['toDelete']);
    emit(const CardsState.initial());
  }
}
