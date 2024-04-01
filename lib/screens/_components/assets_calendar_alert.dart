// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:moneynote4/extensions/extensions.dart';
import 'package:moneynote4/screens/_components/assets_list_alert.dart';

import '../../state/assets_calendar/assets_calendar_notifier.dart';
import '../../state/holiday/holiday_notifier.dart';
import '../../utility/utility.dart';

class AssetsCalendarAlert extends ConsumerWidget {
  AssetsCalendarAlert({super.key, required this.assetsInfoMap});

  final Map<String, AssetsInfo> assetsInfoMap;

  DateTime _calendarMonthFirst = DateTime.now();
  final List<String> _youbiList = ['Sunday', 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday'];
  List<String> _calendarDays = [];

  final Utility _utility = Utility();

  late BuildContext _context;
  late WidgetRef _ref;

  ///
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    _context = context;
    _ref = ref;

    final assetsCalendarState = ref.watch(assetsCalendarProvider);

    return AlertDialog(
      backgroundColor: Colors.transparent,
      insetPadding: EdgeInsets.zero,
      content: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: SizedBox(
          width: context.screenSize.width * 1.5,
          height: MediaQuery.of(context).size.height - 50,
          child: DefaultTextStyle(
            style: const TextStyle(fontSize: 12),
            child: Column(
              children: [
                Container(width: context.screenSize.width),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(color: Colors.blueGrey.withOpacity(0.2), borderRadius: BorderRadius.circular(10)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          IconButton(
                            onPressed: () {
                              ref.read(assetsCalendarProvider.notifier).setPrevYearMonth();
                            },
                            icon: Icon(Icons.arrow_back_ios, color: Colors.white.withOpacity(0.8), size: 14),
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                            child: Text(assetsCalendarState.baseYearMonth),
                          ),
                          IconButton(
                            onPressed: () {
                              ref.read(assetsCalendarProvider.notifier).setNextYearMonth();
                            },
                            icon: Icon(Icons.arrow_forward_ios, color: Colors.white.withOpacity(0.8), size: 14),
                          ),
                        ],
                      ),
                      Container(),
                    ],
                  ),
                ),
                const SizedBox(height: 5),
                Expanded(child: _getCalendar()),
              ],
            ),
          ),
        ),
      ),
    );
  }

  ///
  Widget _getCalendar() {
    final assetsCalendarState = _ref.watch(assetsCalendarProvider);

    _calendarMonthFirst = DateTime.parse('${assetsCalendarState.baseYearMonth}-01 00:00:00');

    final monthEnd = DateTime.parse('${assetsCalendarState.nextYearMonth}-00 00:00:00');

    final diff = monthEnd.difference(_calendarMonthFirst).inDays;
    final monthDaysNum = diff + 1;

    final youbi = _calendarMonthFirst.youbiStr;
    final youbiNum = _youbiList.indexWhere((element) => element == youbi);

    final weekNum = ((monthDaysNum + youbiNum) <= 35) ? 5 : 6;

    _calendarDays = List.generate(weekNum * 7, (index) => '');

    for (var i = 0; i < (weekNum * 7); i++) {
      if (i >= youbiNum) {
        final gendate = _calendarMonthFirst.add(Duration(days: i - youbiNum));

        if (_calendarMonthFirst.month == gendate.month) {
          _calendarDays[i] = gendate.day.toString();
        }
      }
    }

    final list = <Widget>[];
    for (var i = 0; i < weekNum; i++) {
      list.add(_getCalendarRow(week: i));
    }

    return SingleChildScrollView(child: DefaultTextStyle(style: const TextStyle(fontSize: 10), child: Column(children: list)));
  }

  ///
  Widget _getCalendarRow({required int week}) {
    final holidayState = _ref.watch(holidayProvider);

    final list = <Widget>[];

    for (var i = week * 7; i < ((week + 1) * 7); i++) {
      final generateYmd =
          (_calendarDays[i] == '') ? '' : DateTime(_calendarMonthFirst.year, _calendarMonthFirst.month, _calendarDays[i].toInt()).yyyymmdd;

      final youbiStr =
          (_calendarDays[i] == '') ? '' : DateTime(_calendarMonthFirst.year, _calendarMonthFirst.month, _calendarDays[i].toInt()).youbiStr;

      list.add(
        Expanded(
          child: Container(
            margin: const EdgeInsets.all(1),
            padding: const EdgeInsets.all(2),
            decoration: BoxDecoration(
              border: Border.all(
                color: (_calendarDays[i] == '')
                    ? Colors.transparent
                    : (generateYmd == DateTime.now().yyyymmdd)
                        ? Colors.orangeAccent.withOpacity(0.4)
                        : Colors.white.withOpacity(0.1),
                width: 3,
              ),
              color: (_calendarDays[i] == '')
                  ? Colors.transparent
                  : _utility.getYoubiColor(
                      date: DateTime(_calendarMonthFirst.year, _calendarMonthFirst.month, _calendarDays[i].toInt()),
                      youbiStr: youbiStr,
                      holiday: holidayState.data),
            ),
            child: (_calendarDays[i] == '')
                ? const Text('')
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(_calendarDays[i].padLeft(2, '0')),
                        ],
                      ),
                      const SizedBox(height: 5),
                      ConstrainedBox(
                        constraints: BoxConstraints(minHeight: _context.screenSize.height / 5),
                        child: (assetsInfoMap[generateYmd] == null)
                            ? Container()
                            : (assetsInfoMap[generateYmd]!.dispFlag == false)
                                ? Container()
                                : Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [Container(), Text(assetsInfoMap[generateYmd]!.goldCost.toString().toCurrency())],
                                      ),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Container(),
                                          Text(
                                            assetsInfoMap[generateYmd]!.goldPrice.toString().toCurrency(),
                                            style: const TextStyle(color: Colors.yellowAccent),
                                          )
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Container(),
                                          Text(
                                            assetsInfoMap[generateYmd]!.goldDiff.toString().toCurrency(),
                                            style: const TextStyle(color: Color(0xFFFBB6CE)),
                                          )
                                        ],
                                      ),
                                      const SizedBox(height: 10),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [Container(), Text(assetsInfoMap[generateYmd]!.stockCost.toString().toCurrency())],
                                      ),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Container(),
                                          Text(
                                            assetsInfoMap[generateYmd]!.stockPrice.toString().toCurrency(),
                                            style: const TextStyle(color: Colors.yellowAccent),
                                          )
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Container(),
                                          Text(
                                            assetsInfoMap[generateYmd]!.stockDiff.toString().toCurrency(),
                                            style: const TextStyle(color: Color(0xFFFBB6CE)),
                                          )
                                        ],
                                      ),
                                      const SizedBox(height: 10),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [Container(), Text(assetsInfoMap[generateYmd]!.shintakuCost.toString().toCurrency())],
                                      ),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Container(),
                                          Text(
                                            assetsInfoMap[generateYmd]!.shintakuPrice.toString().toCurrency(),
                                            style: const TextStyle(color: Colors.yellowAccent),
                                          )
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Container(),
                                          Text(
                                            assetsInfoMap[generateYmd]!.shintakuDiff.toString().toCurrency(),
                                            style: const TextStyle(color: Color(0xFFFBB6CE)),
                                          )
                                        ],
                                      ),
                                      const SizedBox(height: 10),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Container(),
                                          Text(
                                            (assetsInfoMap[generateYmd]!.goldDiff +
                                                    assetsInfoMap[generateYmd]!.stockDiff +
                                                    assetsInfoMap[generateYmd]!.shintakuDiff)
                                                .toString()
                                                .toCurrency(),
                                            style: const TextStyle(color: Color(0xFFFBB6CE)),
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                      ),
                    ],
                  ),
          ),
        ),
      );
    }

    return Row(crossAxisAlignment: CrossAxisAlignment.start, children: list);
  }
}
