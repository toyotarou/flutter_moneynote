import 'package:freezed_annotation/freezed_annotation.dart';

part 'assets_calendar_response_state.freezed.dart';

@freezed
class AssetsCalendarResponseState with _$AssetsCalendarResponseState {
  const factory AssetsCalendarResponseState({
    @Default('') String baseYearMonth,
    @Default('') String prevYearMonth,
    @Default('') String nextYearMonth,
  }) = _AssetsCalendarResponseState;
}
