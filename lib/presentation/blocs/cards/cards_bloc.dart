import 'package:bloc/bloc.dart';
import 'package:flashcards/domain/entities/card_entity/card_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'cards_event.dart';

part 'cards_state.dart';

part 'cards_bloc.freezed.dart';

class CardsBloc extends Bloc<CardsEvent, CardsState> {
  CardsBloc() : super(CardsState.initial(cardsList: [])) {
    on<CardsEvent>(_mapEventToState);
  }

  bool isEditMode = false;
  int id = 6;
  final List<Map<String, dynamic>> cardsList = [
    {
      'name': CardEntity(
          id: '1',
          front: 'How can i help you with such a complicated task?',
          back: 'Back'),
      'toDelete': false
    },
    {
      'name': CardEntity(id: '2', front: 'Sad', back: 'sad Back'),
      'toDelete': false
    },
    {
      'name': CardEntity(id: '3', front: 'Happy', back: 'Happy Back'),
      'toDelete': false
    },
    {
      'name': CardEntity(id: '4', front: 'Anxious', back: 'Anxious Back'),
      'toDelete': false
    },
    {
      'name': CardEntity(id: '5', front: 'sleep', back: 'sleep Back'),
      'toDelete': false
    }
  ];

  Future<void> _mapEventToState(CardsEvent event, Emitter<CardsState> emit) =>
      event.map(
        createNewCard: (event) => _createNewCard(event, emit),
        deleteSelectedCards: (event) => _deleteSelectedCards(event, emit),
        editCard: (event) => _editCard(event, emit),
      );

  Future<void> _createNewCard(
      _CreateNewCard event, Emitter<CardsState> emit) async {
    id++;

    cardsList.add({
      'name':
          CardEntity(id: id.toString(), front: event.front, back: event.back),

      'toDelete': false
    });
    emit(CardsState.loading());
    emit(CardsState.initial(cardsList: cardsList));
  }

  Future<void> _editCard(_EditCard event, Emitter<CardsState> emit) async {

    cardsList.removeWhere(
        (element) => (element['name'] as CardEntity).id == event.card.id);

    cardsList.add({'name': event.card, 'toDelete': false});
    emit(CardsState.loading());
    emit(CardsState.initial(cardsList: cardsList));
  }

  Future<void> _deleteSelectedCards(
      CardsEvent event, Emitter<CardsState> emit) async {
    cardsList.removeWhere((element) => element['toDelete']);
    emit(CardsState.loading());
    emit(CardsState.initial(cardsList: cardsList));
  }
}