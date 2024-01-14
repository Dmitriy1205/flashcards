import 'package:bloc/bloc.dart';
import 'package:flashcards/domain/entities/collection_entity/collection_entity.dart';
import 'package:flashcards/domain/repositories/collection_repo/collection_repo_impl.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'lists_event.dart';

part 'lists_state.dart';

part 'lists_bloc.freezed.dart';

class ListsBloc extends Bloc<ListsEvent, ListsState> {
  ListsBloc({required this.collectionRepo})
      : super(
            const ListsState.viewCollections(collectionsList: [])) {
    on<ListsEvent>(_mapEventToState);
  }


  final CollectionRepoImpl collectionRepo;
  List<CollectionEntity> listIdToDelete = [];
  bool isEditMode = false;
  List<CollectionEntity> data = [];
  Future<void> _mapEventToState(ListsEvent event, Emitter<ListsState> emit) {
    return
      event.map(
        createNewList: (event) => _createNewList(event, emit),
        selectCollection: (event) => _selectCollection(event, emit),
        started: (event) => _started(event, emit),
        deleteSelectedCollection: (event) =>
            _deleteSelectedCollection(event, emit),
      );}

  Future<void> _createNewList(
      _CreateNewList event, Emitter<ListsState> emit) async {
    data = await collectionRepo.fetchCollections();

    print('_createNewList in bloc');
   collectionRepo.createCollection(collectionName: event.name);
    emit(const ListsState.loading());
    emit(ListsState.viewCollections(collectionsList: data));
  }

  Future<void> _selectCollection(
      _SelectCollection event, Emitter<ListsState> emit) async {
    print('collectionsListName in bloc');
    emit(ListsState.viewCards(collectionsListName: event.collectionsListName));
    emit(ListsState.viewCollections(collectionsList: data));
  }

  Future<void> _deleteSelectedCollection(
      _DeleteSelecteCollection event, Emitter<ListsState> emit) async {
    data = await collectionRepo.fetchCollections();
    collectionRepo.deleteCollections(collections: listIdToDelete);
    emit(const ListsState.loading());
    emit(ListsState.viewCollections(collectionsList: data));
  }

  Future<void> _started(ListsEvent event, Emitter<ListsState> emit) async {
    data = await collectionRepo.fetchCollections();
    emit(const ListsState.loading());
    emit(ListsState.viewCollections(collectionsList: data));
  }
}
