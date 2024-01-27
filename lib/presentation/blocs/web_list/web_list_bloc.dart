import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/entities/collection_entity/collection_entity.dart';
import '../../../domain/repositories/collection_repo/collection_repo_contract.dart';

part 'web_list_event.dart';

part 'web_list_state.dart';

part 'web_list_bloc.freezed.dart';

class WebListBloc extends Bloc<WebListEvent, WebListState> {
  final CollectionRepoContract collectionRepo;

  WebListBloc({
    required this.collectionRepo,
  }) : super(const WebListState.initial()) {
    on<WebListEvent>(_mapToState);
  }

  List<String> listIdToDelete = [];

  Future<void> _mapToState(
      WebListEvent event, Emitter<WebListState> emit) async {
    await event.map(
      fetchAllCollection: (e) => _fetchAllCollection(e, emit),
      createCollection: (e) => _createCollection(e, emit),
      editCollection: (e) => _editCollection(e, emit),
      deleteCollection: (e) => _deleteCollection(e, emit),
      updateCollection: (e) => _updateCollection(e, emit),
    );
  }

  Future<void> _fetchAllCollection(
      _FetchAllCollection event, Emitter<WebListState> emit) async {
    try {
      List<CollectionEntity> collection =
          await collectionRepo.fetchCollections();
      emit(WebListState.loaded(collectionsList: collection, isEdit: false));
    } on Exception catch (e) {
      emit(WebListState.error(error: e.toString()));
    }
  }

  Future<void> _createCollection(
      _CreateCollection event, Emitter<WebListState> emit) async {

    try {
      emit(const WebListState.loading());
      await collectionRepo.createCollection(collectionName: event.name);

      List<CollectionEntity> collection =
          await collectionRepo.fetchCollections();
      emit(WebListState.loaded(collectionsList: collection, isEdit: false));
    } on Exception catch (e) {
      emit(WebListState.error(error: e.toString()));
    }
  }

  Future<void> _editCollection(
      _EditCollection event, Emitter<WebListState> emit) async {
    try {
      List<CollectionEntity> collection =
          await collectionRepo.fetchCollections();
      emit(WebListState.loaded(
          collectionsList: collection, isEdit: event.isEdit));
    } on Exception catch (e) {
      emit(WebListState.error(error: e.toString()));
    }
  }

  Future<void> _deleteCollection(
      _DeleteCollection event, Emitter<WebListState> emit) async {
    try {
      emit(const WebListState.loading());
      await collectionRepo.deleteCollections(collections: listIdToDelete);
      List<CollectionEntity> collection =
          await collectionRepo.fetchCollections();
      emit(WebListState.loaded(collectionsList: collection, isEdit: false));
    } on Exception catch (e) {
      emit(WebListState.error(error: e.toString()));
    }
  }

  Future<void> _updateCollection(
      _UpdateCollection event, Emitter<WebListState> emit) async {
    try {
      emit(WebListState.loading());
      await collectionRepo.updateExistingCollection(collectionId: event.collectionId, name: event.name);
      List<CollectionEntity> collection =
          await collectionRepo.fetchCollections();
      emit(WebListState.loaded(collectionsList: collection, isEdit: false));
    } on Exception catch (e) {
      emit(WebListState.error(error: e.toString()));
    }
  }
}
