part of 'full_card_bloc.dart';

@freezed
class FullCardEvent with _$FullCardEvent {
  const factory FullCardEvent.fetchFullInformation({required CardEntity card}) = _FetchFullInformation;
}
