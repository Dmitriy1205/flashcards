import 'package:bloc/bloc.dart';
import 'package:flashcards/data/remote/empty.dart';
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

  List<String> cardsListToDelete = [];

  Future<void> _mapEventToState(CardsEvent event, Emitter<CardsState> emit) =>
      event.map(
        createNewCard: (event) => _createNewCard(event, emit),
        deleteSelectedCards: (event) => _deleteSelectedCards(event, emit),
        editCard: (event) => _editCard(event, emit),
      );

  Future<void> _createNewCard(
      _CreateNewCard event, Emitter<CardsState> emit) async {
    id++;

    MockData.cardsList.add(
      CardEntity(id: id.toString(), front: event.front, back: event.back),
    );
    emit(CardsState.loading());
    emit(CardsState.initial(cardsList: MockData.cardsList));
  }

  Future<void> _editCard(_EditCard event, Emitter<CardsState> emit) async {

    MockData.cardsList.remove(event.card);
    MockData.cardsList.add(event.card);
    emit(CardsState.loading());
    emit(CardsState.initial(cardsList: MockData.cardsList));
  }

  Future<void> _deleteSelectedCards(
      _DeleteSelectedCards event, Emitter<CardsState> emit) async {
    ///TODO
    for (String id in event.cardsIdToDelete) {
      MockData.cardsList.removeWhere((element) => element.id == id);
    }
    emit(CardsState.loading());
    emit(CardsState.initial(cardsList: MockData.cardsList));
  }
}