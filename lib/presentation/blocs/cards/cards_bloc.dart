import 'package:bloc/bloc.dart';
import 'package:flashcards/domain/entities/card_entity/card_entity.dart';
import 'package:flashcards/domain/params/card_param/create_card_param.dart';
import 'package:flashcards/domain/params/card_param/edit_card_param.dart';
import 'package:flashcards/domain/repositories/cards_repo/card_repo_contract.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'cards_event.dart';

part 'cards_state.dart';

part 'cards_bloc.freezed.dart';

class CardsBloc extends Bloc<CardsEvent, CardsState> {
  CardsBloc({required this.cardRepo})
      : super(const CardsState.loaded(
          cardsList: [],
        )) {
    on<CardsEvent>(_mapEventToState);
  }

  final CardRepo cardRepo;
  bool isEditMode = false;
  late final int cardsLength;

  List<String> cardsListToDelete = [];

  Future<List<CardEntity>> getCards(collectionId) async {
    return await cardRepo.fetchCards(collectionId: collectionId);
  }

  Future<void> _mapEventToState(CardsEvent event, Emitter<CardsState> emit) =>
      event.map(
          initCard: (event) => _initCard(event, emit),
          createNewCard: (event) => _createNewCard(event, emit),
          deleteSelectedCards: (event) => _deleteSelectedCards(event, emit),
          editCard: (event) => _editCard(event, emit),
          emptyCardsList: (event) => _emptyCardsList(event, emit),
          shareCollection: (event) => _shareCard(event, emit),
          createSharedCards: (event) => _createSharedCards(event, emit),
          swipeCard: (event) => _swipeCard(event, emit),
          finishLearn: (event) => _finishLearn(event, emit),
          importExcel: (event) => _importExcel(event, emit));

  Future<void> _importExcel(_ImportExcel event, Emitter<CardsState> emit) async{
    final prevState = state;
    try{
      await cardRepo.importExcel(path: event.path, collectionName: event.collectionName, collectionId: event.collectionId);
      emit(const CardsState.successfullyImported());
      final cards = await cardRepo.fetchCards(collectionId: event.collectionId);
      emit(CardsState.loaded(cardsList: cards));
    }on FormatException catch(e){
      emit(CardsState.error(error: e.message));
      emit(prevState);
    }
  }

  Future<void> _initCard(_InitCard event, Emitter<CardsState> emit) async {
    try {
      emit(const CardsState.loading());
      final cardsList =
          await cardRepo.fetchCards(collectionId: event.collectionId);
      emit(CardsState.loaded(cardsList: cardsList));
    } catch (e) {
      emit(CardsState.error(error: e.toString()));
    }
  }

  Future<void> _shareCard(_ShareCard event, Emitter<CardsState> emit) async {
    try {
      await cardRepo.shareCollection(
          collectionId: event.collectionId,
          collectionName: event.collectionName);
    } catch (e) {
      emit(CardsState.error(error: e.toString()));
    }
  }

  Future<void> _createSharedCards(
      _CreateSharedCards event, Emitter<CardsState> emit) async {
    try {
      emit(const CardsState.loading());
      await cardRepo.createSharedCards(
          collectionId: event.collectionId, sender: event.sender);

      add(_InitCard(collectionId: event.collectionId));
      // _initCard(_InitCard(collectionId: event.collectionId,), emit);
    } catch (e) {
      emit(CardsState.error(error: e.toString()));
    }
  }

  Future<void> _createNewCard(
      _CreateNewCard event, Emitter<CardsState> emit) async {
    try {
      emit(const CardsState.loading());
      await cardRepo.createCard(cardParam: event.cardParam);
      final cardsList =
          await cardRepo.fetchCards(collectionId: event.collectionId);
      emit(CardsState.loaded(cardsList: cardsList));
    } catch (e) {
      emit(CardsState.error(error: e.toString()));
    }
  }

  Future<void> _editCard(_EditCard event, Emitter<CardsState> emit) async {
    try {
      emit(const CardsState.loading());
      cardRepo.editCard(cardParam: event.cardParam);
      final cardsList =
          await cardRepo.fetchCards(collectionId: event.collectionId);
      emit(CardsState.loaded(cardsList: cardsList));
    } catch (e) {
      emit(CardsState.error(error: e.toString()));
    }
  }

  Future<void> _deleteSelectedCards(
      _DeleteSelectedCards event, Emitter<CardsState> emit) async {
    try {
      emit(const CardsState.loading());
      await cardRepo.deleteCards(
          cardsToDelete: event.cardsIdToDelete,
          collectionId: event.collectionId);
      final cardsList =
          await cardRepo.fetchCards(collectionId: event.collectionId);
      emit(CardsState.loaded(cardsList: cardsList));
    } catch (e) {
      emit(CardsState.error(error: e.toString()));
    }
  }

  Future<void> _emptyCardsList(
      _EmptyCardsList event, Emitter<CardsState> emit) async {
    emit(const CardsState.loaded(cardsList: []));
  }

  Future<void> _swipeCard(_SwipeCard event, Emitter<CardsState> emit) async {
    await cardRepo.swipeCard(cardEntity: event.cardEntity);
    final cardsList =
        await cardRepo.fetchCards(collectionId: event.cardEntity.collectionId);
    emit(CardsState.loaded(cardsList: cardsList));
  }

  Future<void> _finishLearn(
      _FinishLearn event, Emitter<CardsState> emit) async {
    emit(const CardsState.finishLearning());
  }
}
