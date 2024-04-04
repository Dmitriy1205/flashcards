import 'package:bloc/bloc.dart';
import 'package:flashcards/domain/entities/card_entity/card_entity.dart';
import 'package:flashcards/domain/entities/full_card_entity/full_card_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/repositories/cards_repo/card_repo_contract.dart';

part 'full_card_event.dart';

part 'full_card_state.dart';

part 'full_card_bloc.freezed.dart';

class FullCardBloc extends Bloc<FullCardEvent, FullCardState> {
  final CardRepo _cardRepo;

  FullCardBloc({required CardRepo cardRepo})
      : _cardRepo = cardRepo,
        super(const FullCardState.initial()) {
    on<FullCardEvent>(_mapEventToState);
  }

  Future<void> _mapEventToState(
          FullCardEvent event, Emitter<FullCardState> emit) =>
      event.map(fetchFullInformation: (e) => _fetchFullInformation(e, emit));

  Future<void> _fetchFullInformation(
      FullCardEvent event, Emitter<FullCardState> emit) async {
    try {
      final fullCard = await _cardRepo.getFullCard(card: event.card);
      emit(FullCardState.loaded(card: fullCard));
    } catch (e) {
      emit(FullCardState.loaded(card: FullCardEntity(card: event.card)));
    }
  }
}
