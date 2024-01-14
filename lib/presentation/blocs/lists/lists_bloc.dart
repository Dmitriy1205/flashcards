import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'lists_event.dart';

part 'lists_state.dart';

part 'lists_bloc.freezed.dart';

class ListsBloc extends Bloc<ListsEvent, ListsState> {
  ListsBloc() : super(const ListsState.initial()) {
    on<ListsEvent>(_mapEventToState);
  }

  final List<Map<String, dynamic>> collectionsList = [
    {'name': 'Deck1', 'toDelete': false},
    {'name': 'English', 'toDelete': false},
    {'name': 'Cities', 'toDelete': false},
    {'name': 'Names', 'toDelete': false},
    {'name': 'Memo', 'toDelete': false},
  ];

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
    collectionsList.add({'name': event.name, 'toDelete': false});
    emit(const ListsState.loading());
    emit(const ListsState.initial());
  }

  Future<void> _selectCollection(
      _SelectCollection event, Emitter<ListsState> emit) async {
    print('collectionsListName in bloc');
    emit(ListsState.viewCards(collectionsListName: event.collectionsListName));
    emit(const ListsState.loading());
    emit(const ListsState.initial());
  }

  Future<void> _deleteSelectedCollection(
      _DeleteSelecteCollection event, Emitter<ListsState> emit) async {
    collectionsList.removeWhere((element) => element['toDelete']);
    emit(const ListsState.loading());
    emit(const ListsState.initial());
  }

  Future<void> _started(ListsEvent event, Emitter<ListsState> emit) async {
    emit(const ListsState.loading());
    emit(const ListsState.initial());
  }
}
