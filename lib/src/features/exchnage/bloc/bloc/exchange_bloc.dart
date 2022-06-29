import 'package:anakut_bank/src/features/exchnage/model/exchnage_model.dart';
import 'package:anakut_bank/src/features/exchnage/repository/exchange_repository.dart';
import 'package:anakut_bank/src/utils/helper/helper.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'exchange_event.dart';
part 'exchange_state.dart';

class ExchangeBloc extends Bloc<ExchangeEvent, ExchangeState> {
  ExchangeRepository _exchangeRepository = ExchangeRepository();
  ExchangeModel? exchangeModel;
  List<ExchangeModel> rate = [];
  late int page;
  int rowperpage = 8;
  String? dateRange;
  String? startDate;
  helper? Helper;
  String? endDate;
  List<ExchangeHistoryModel> history = [];

  @override
  ExchangeBloc() : super(FetchingExchnage());

  @override
  Stream<ExchangeState> mapEventToState(ExchangeEvent event) async* {
    if (event is FetchExchangeStarted) {
      yield FetchingExchnage();
      try {
        rate.clear();
        page = 1;
        Future.delayed(Duration(microseconds: 200));
        rate = await _exchangeRepository.getCurrency(
            page: page, rowperpage: rowperpage);
        //rate.addAll(_tempresult);
        page++;
        print(rate.length);
        yield FetchedExchange();
      } catch (e) {
        print(e.toString());
        yield ErrorFetching(error: e.toString());
      }
    }
    if (event is Refresh) {
      yield FetchingExchnage();
      try {
        List<ExchangeModel> _temp = await _exchangeRepository.getCurrency(
            page: page, rowperpage: rowperpage);
        rate.addAll(_temp);
        page++;
        print(page);
        print(rowperpage);
        if (_temp.length < rowperpage) {
          yield End();
        } else {
          yield FetchedExchange();
        }
      } catch (e) {
        print(e.toString());
        yield ErrorFetching(error: e.toString());
      }
    }
    // if (event is FetchExHistoryEven) {
    //   yield FetchingExHistory();
    //   try {
    //     page = 1;
    //     history = await _exchangeRepository.getExchangeHistory(
    //         page: page,
    //         rowperpage: rowperpage,
    //         start: startDate!,
    //         end: endDate!);
    //     page++;
    //     print(history.length);
    //     yield FetchedExHistory();
    //   } catch (e) {
    //     print(e.toString());
    //     yield ErrorFetching(error: e.toString());
    //   }
    // }
    // if (event is FetchExHistoryRefresh) {
    //   yield FetchingExHistory();
    //   try {
    //     List<ExchangeHistoryModel> _temp =
    //         await _exchangeRepository.getExchangeHistory(
    //             page: page,
    //             rowperpage: rowperpage,
    //             start: startDate!,
    //             end: endDate!);
    //     history.addAll(_temp);
    //     print(history.length);
    //     page++;
    //     if (_temp.length < rowperpage) {
    //       yield EndOfHistory();
    //     } else {
    //       yield FetchedExHistory();
    //     }
    //   } catch (e) {
    //     yield ErrorFetching(error: e.toString());
    //   }
    // }
    // if (event is RefreshHistory) {
    //   yield FetchingExHistory();
    //   try {
    //     if (history.length != 0) {
    //       history.clear();
    //     }
    //     page = 1;
    //     List<ExchangeHistoryModel> _temp =
    //         await _exchangeRepository.getExchangeHistory(
    //             page: page,
    //             rowperpage: rowperpage,
    //             start: startDate!,
    //             end: endDate!);
    //     page++;
    //     yield FetchedExHistory();
    //   } catch (e) {
    //     yield ErrorFetching(error: e.toString());
    //   }
    // }
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
