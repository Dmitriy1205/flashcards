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
    {'name': 'Memo', 'toDelete': false}
  ];

  bool isEditMode = false;

  Future<void> _mapEventToState(ListsEvent event, Emitter<ListsState> emit) =>
      event.map(
        createNewList: (event) => _createNewList(event, emit),
        deleteSelected: (event) => _deleteSelected(event, emit),
        editCard: (event) => _editCard(event, emit),
        selectCard: (event) => _selectCard(event, emit),
        selectCollection: (event) => _selectCollection(event, emit),
        selectProfile: (event) => _selectProfile(event, emit),
        started: (event) => _started(event, emit),
        deleteSelectedCollection: (event) =>
            _deleteSelectedCollection(event, emit),
      );

  Future<void> _createNewList(_CreateNewList event,
      Emitter<ListsState> emit) async {
    print('_createNewList in bloc');
    collectionsList.add({'name': event.name, 'toDelete': false});
    emit(ListsState.newList());
  }

  Future<void> _deleteSelected(ListsEvent event,
      Emitter<ListsState> emit) async {}

  Future<void> _editCard(ListsEvent event, Emitter<ListsState> emit) async {}

  Future<void> _selectCard(ListsEvent event, Emitter<ListsState> emit) async {}

  Future<void> _selectCollection(_SelectCollection event,
      Emitter<ListsState> emit) async {
    print('viewCards in bloc');
    emit(const ListsState.viewCards());
  }

  Future<void> _deleteSelectedCollection(_DeleteSelecteCollection event,
      Emitter<ListsState> emit) async {
    collectionsList.removeWhere((element) =>  element['toDelete']);
    emit(const ListsState.newList());
  }

  Future<void> _selectProfile(ListsEvent event,
      Emitter<ListsState> emit) async {}

  Future<void> _started(ListsEvent event, Emitter<ListsState> emit) async {}
}
