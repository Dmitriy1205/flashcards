import 'package:bloc/bloc.dart';
import 'package:flashcards/core/services/service_locator.dart';
import 'package:flashcards/data/remote/empty.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'lists_event.dart';

part 'lists_state.dart';

part 'lists_bloc.freezed.dart';

class ListsBloc extends Bloc<ListsEvent, ListsState> {
  ListsBloc({required this.data})
      : super(
            ListsState.viewCollections(collectionsList: data.collectionsList)) {
    on<ListsEvent>(_mapEventToState);
  }

  final MockData data;

  bool isEditMode = false;

  Future<void> _mapEventToState(ListsEvent event, Emitter<ListsState> emit) =>
      event.map(
        createNewList: (event) => _createNewList(event, emit),
        selectCollection: (event) => _selectCollection(event, emit),
        started: (event) => _started(event, emit),
        deleteSelectedCollection: (event) =>
            _deleteSelectedCollection(event, emit),
      );

  Future<void> _createNewList(
      _CreateNewList event, Emitter<ListsState> emit) async {
    print('_createNewList in bloc');
    data.collectionsList.add({'name': event.name, 'toDelete': false});
    emit(const ListsState.loading());
    emit(ListsState.viewCollections(collectionsList: data.collectionsList));
  }

  Future<void> _selectCollection(
      _SelectCollection event, Emitter<ListsState> emit) async {
    print('collectionsListName in bloc');
    emit(ListsState.viewCards(collectionsListName: event.collectionsListName));
    emit(ListsState.viewCollections(collectionsList: data.collectionsList));
  }

  Future<void> _deleteSelectedCollection(
      _DeleteSelecteCollection event, Emitter<ListsState> emit) async {
    data.collectionsList.removeWhere((element) => element['toDelete']);
    emit(const ListsState.loading());
    emit(ListsState.viewCollections(collectionsList: data.collectionsList));
  }

  Future<void> _started(ListsEvent event, Emitter<ListsState> emit) async {
    emit(const ListsState.loading());
    emit(ListsState.viewCollections(collectionsList: data.collectionsList));
  }
}
