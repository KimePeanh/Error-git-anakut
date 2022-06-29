import 'package:anakut_bank/src/features/exchnage/model/exchnage_model.dart';
import 'package:anakut_bank/src/features/exchnage/repository/exchange_repository.dart';
import 'package:anakut_bank/src/utils/helper/helper.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:intl/intl.dart';

part 'history_exchange_event.dart';
part 'history_exchange_state.dart';

class HistoryExchangeBloc
    extends Bloc<HistoryExchangeEvent, HistoryExchangeState> {
  HistoryExchangeBloc({this.Helper}) : super(InitializingExpenseList());
  helper? Helper;
  late int page;
  int rowperpage = 8;
  String? dateRange;
  String? startDate;
  String? endDate;
  ExchangeRepository _exchangeRepository = ExchangeRepository();
  List<ExchangeHistoryModel> history = [];
  String now = new DateFormat('yyyy-MM-dd').format(DateTime.now());

  @override
  Stream<HistoryExchangeState> mapEventToState(
      HistoryExchangeEvent event) async* {
    if (event is InitializeExpenseList) {
      yield InitializingExpenseList();
      try {
        page = 1;
        dateRange = event.dateRange;
        setEndDateAndStartDate();
        history = await _exchangeRepository.getExchangeHistory(
            page: page,
            rowperpage: rowperpage,
            start: startDate!,
            end: endDate!);
        page++;
        yield InitializedExpenseList();
      } catch (e) {
        yield ErrorInitializingExpenseList(error: e.toString());
      }
    }
    if (event is FetchExpenseList) {
      yield FetchingExpenseList();
      try {
        List<ExchangeHistoryModel> _tempExpenseList =
            await _exchangeRepository.getExchangeHistory(
            page: page,
            rowperpage: rowperpage,
            start: startDate!,
            end: endDate!);
        history.addAll(_tempExpenseList);
        page++;
        if (_tempExpenseList.length < rowperpage) {
          yield EndOfExpenseList();
        } else {
          yield FetchedExpenseList();
        }
      } catch (e) {
        yield ErrorInitializingExpenseList(error: e.toString());
      }
    }
    if (event is TriggerList) {
      yield FetchingExpenseList();
      yield FetchedExpenseList();
    }
  }

  void setEndDateAndStartDate() {
      DateTime now = DateTime.now();
      if (dateRange == "Today") {
        dateRange = "Today";
        startDate =
            "${now.year}-${Helper!.intToStringWithPrefixZero(now.month)}-${Helper!.intToStringWithPrefixZero(now.day)}";
        endDate =
            "${now.year}-${Helper!.intToStringWithPrefixZero(now.month)}-${Helper!.intToStringWithPrefixZero(now.day)} 23:59:59";
      } else if (dateRange == "This week") {
        dateRange = "This week";
        DateTime startDateThisWeek = Helper!.findFirstDateOfTheWeek(now);
        DateTime endDateThisWeek = Helper!.findLastDateOfTheWeek(now);
        startDate =
            "${now.year}-${Helper!.intToStringWithPrefixZero(startDateThisWeek.month)}-${Helper!.intToStringWithPrefixZero(startDateThisWeek.day)}";
        if (Helper!.intToStringWithPrefixZero(startDateThisWeek.month) == "12" &&
            (Helper!.intToStringWithPrefixZero(endDateThisWeek.month) == "01")) {
          endDate =
              "${now.year + 1}-${Helper!.intToStringWithPrefixZero(endDateThisWeek.month)}-${Helper!.intToStringWithPrefixZero(endDateThisWeek.day)} 23:59:59";
        } else {
          endDate =
              "${now.year}-${Helper!.intToStringWithPrefixZero(endDateThisWeek.month)}-${Helper!.intToStringWithPrefixZero(endDateThisWeek.day)} 23:59:59";
        }
      } else if (dateRange == "This month") {
        dateRange = "This month";
        DateTime lastDateOfMonth = DateTime(now.year, now.month + 1, 0);
        startDate =
            "${now.year}-${Helper!.intToStringWithPrefixZero(now.month)}-01";
        endDate =
            "${now.year}-${Helper!.intToStringWithPrefixZero(now.month)}-${Helper!.intToStringWithPrefixZero(lastDateOfMonth.day)} 23:59:59";
      } else if (dateRange == "This year") {
        dateRange = "This year";
        DateTime lastDateOfYear = DateTime(now.year + 1, 1, 0);
        startDate = "${now.year}-01-01";
        endDate =
            "${now.year}-12-${Helper!.intToStringWithPrefixZero(lastDateOfYear.day)} 23:59:59";
      } else {
        startDate = dateRange!.split("/").first;
        endDate = dateRange!.split("/").last + " 23:59:59";
        dateRange = "$startDate to ${dateRange!.split("/").last}";
      }
  }
}
