import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:moneynote4/state/assets_calendar/assets_calendar_response_state.dart';

import '../../extensions/extensions.dart';

////////////////////////////////////////////////

final assetsCalendarProvider = StateNotifierProvider.autoDispose<AssetsCalendarNotifier, AssetsCalendarResponseState>((ref) {
  final baseYm = DateTime.now();
  final prevYM = DateTime(baseYm.year, baseYm.month - 1);
  final nextYM = DateTime(baseYm.year, baseYm.month + 1);
  return AssetsCalendarNotifier(
      AssetsCalendarResponseState(baseYearMonth: baseYm.yyyymm, prevYearMonth: prevYM.yyyymm, nextYearMonth: nextYM.yyyymm));
});

class AssetsCalendarNotifier extends StateNotifier<AssetsCalendarResponseState> {
  AssetsCalendarNotifier(super.state);

  ///
  Future<void> setPrevYearMonth() async {
    final baseYm =
        DateTime(DateTime.parse('${state.baseYearMonth}-01 00:00:00').year, DateTime.parse('${state.baseYearMonth}-01 00:00:00').month - 1);
    final prevYM = DateTime(baseYm.year, baseYm.month - 1);
    final nextYM = DateTime(baseYm.year, baseYm.month + 1);
    state = state.copyWith(baseYearMonth: baseYm.yyyymm, prevYearMonth: prevYM.yyyymm, nextYearMonth: nextYM.yyyymm);
  }

  ///
  Future<void> setNextYearMonth() async {
    final baseYm =
        DateTime(DateTime.parse('${state.baseYearMonth}-01 00:00:00').year, DateTime.parse('${state.baseYearMonth}-01 00:00:00').month + 1);
    final prevYM = DateTime(baseYm.year, baseYm.month - 1);
    final nextYM = DateTime(baseYm.year, baseYm.month + 1);
    state = state.copyWith(baseYearMonth: baseYm.yyyymm, prevYearMonth: prevYM.yyyymm, nextYearMonth: nextYM.yyyymm);
  }
}

////////////////////////////////////////////////
