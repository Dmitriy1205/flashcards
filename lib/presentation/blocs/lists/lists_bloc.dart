import 'package:bloc/bloc.dart';
import 'package:flashcards/domain/entities/collection_entity/collection_entity.dart';
import 'package:flashcards/domain/repositories/collection_repo/collection_repo_contract.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'lists_event.dart';

part 'lists_state.dart';

part 'lists_bloc.freezed.dart';

class ListsBloc extends Bloc<ListsEvent, ListsState> {
  ListsBloc({required this.collectionRepo})
      : super(const ListsState.viewCollections(
            collectionsList: [], isEditMode: false, listToDelete: [])) {
    on<ListsEvent>(_mapEventToState);

    collectionRepo
        .fetchCollections()
        .then((value) => add(const ListsEvent.started(isEditMode: false)));
  }

  final CollectionRepoContract collectionRepo;
  bool isEditMode = false;
  List<String> listIdToDelete = [];

  Future<void> _mapEventToState(ListsEvent event, Emitter<ListsState> emit) {
    return event.map(
      createNewList: (event) => _createNewList(event, emit),
      selectCollection: (event) => _selectCollection(event, emit),
      started: (event) => _started(event, emit),
      deleteSelectedCollection: (event) =>
          _deleteSelectedCollection(event, emit),
      editListName: (event) => _editListName(event, emit)
    );
  }

  Future<void> _createNewList(
      _CreateNewList event, Emitter<ListsState> emit) async {
    emit(const ListsState.loading());
    try {


      await collectionRepo.createCollection(collectionName: event.name);
      final List<CollectionEntity> data =
          await collectionRepo.fetchCollections();
      emit(const ListsState.operationSucceeded());
      emit(ListsState.viewCollections(
          collectionsList: data, isEditMode: false, listToDelete: []));
    } catch (e) {
      emit(ListsState.error(error: e.toString()));
    }
  }

  Future<void> _editListName(
      _EditListName event, Emitter<ListsState> emit) async {
    emit(const ListsState.loading());
    try {
      await collectionRepo.editCollection(
          collectionName: event.name, collectionId: event.id);
      final List<CollectionEntity> data =
          await collectionRepo.fetchCollections();
      emit(const ListsState.operationSucceeded());
      emit(ListsState.viewCollections(
          collectionsList: data, isEditMode: false, listToDelete: []));
    } catch (e) {
      emit(ListsState.error(error: e.toString()));
    }
  }

  Future<void> _selectCollection(
      _SelectCollection event, Emitter<ListsState> emit) async {
    emit(const ListsState.loading());

    try {
      emit(ListsState.viewCards(
        collection: event.collection,
      ));
    } catch (e) {
      emit(ListsState.error(error: e.toString()));
    }
  }

  Future<void> _deleteSelectedCollection(
      _DeleteSelecteCollection event, Emitter<ListsState> emit) async {
    emit(const ListsState.loading());
    try {
      await collectionRepo.deleteCollections(collections: listIdToDelete);
      final data = await collectionRepo.fetchCollections();
      emit(const ListsState.operationSucceeded());
      emit(ListsState.viewCollections(
          collectionsList: data, isEditMode: false, listToDelete: []));
    } catch (e) {
      emit(ListsState.error(error: e.toString()));
    }
  }

  Future<void> _started(_Started event, Emitter<ListsState> emit) async {
    emit(const ListsState.loading());
    try {
      final data = await collectionRepo.fetchCollections();
      isEditMode = event.isEditMode;
      emit(ListsState.viewCollections(
          collectionsList: data,
          isEditMode: event.isEditMode,
          listToDelete: listIdToDelete));
    } catch (e) {
      emit(ListsState.error(error: e.toString()));
    }
  }
}
