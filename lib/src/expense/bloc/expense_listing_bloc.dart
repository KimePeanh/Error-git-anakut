import 'package:anakut_bank/src/expense/models/expense.dart';
import 'package:anakut_bank/src/expense/repository/expense_listing_repository.dart';
import 'package:anakut_bank/src/features/exchnage/model/exchnage_model.dart';
import 'package:anakut_bank/src/utils/helper/helper.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_picker/PickerLocalizations.dart';
import 'package:flutter_picker/flutter_picker.dart';
import 'package:intl/intl.dart';

import 'expense_listing_event.dart';
import 'expense_listing_state.dart';

class ExpenseListingBloc
    extends Bloc<ExpenseListingEvent, ExpenseListingState> {
  ExpenseListingBloc() : super(InitializingExpenseList());

  ExpenseListingRepository expenseListingRepository =
      ExpenseListingRepository();
  late int page;
  List<ExchangeHistoryModel> expenseList = [];
  String? dateRange;
  int rowPerPage = 10;
  String? startDate;
  String? endDate;
  @override
  Stream<ExpenseListingState> mapEventToState(
      ExpenseListingEvent event) async* {
    if (event is InitializeExpenseList) {
      yield InitializingExpenseList();
      try {
        page = 1;
        dateRange = event.dateRange;
        setEndDateAndStartDate();
        expenseList = await expenseListingRepository.getExpenseList(
            page: page,
            rowPerPage: rowPerPage,
            startDate: startDate,
            endDate: endDate);
        page++;
        print(expenseList);
        print(startDate);
        print(expenseList.length);
        yield InitializedExpenseList();
      } catch (e) {
        print(e.toString());
        yield ErrorInitializingExpenseList(error: e.toString());
      }
    }
    if (event is FetchExpenseList) {
      yield FetchingExpenseList();
      try {
        List<ExchangeHistoryModel> _tempExpenseList =
            await expenseListingRepository.getExpenseList(
                page: page,
                rowPerPage: rowPerPage,
                startDate: startDate,
                endDate: endDate);
        expenseList.addAll(_tempExpenseList);
        page++;
        print(expenseList.length);
        if (_tempExpenseList.length < rowPerPage) {
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
          "${now.year}-${intToStringWithPrefixZero(now.month)}-${intToStringWithPrefixZero(now.day)}";
      endDate =
          "${now.year}-${intToStringWithPrefixZero(now.month)}-${intToStringWithPrefixZero(now.day)} 23:59:59";
    } else if (dateRange == "This week") {
      dateRange = "This week";
      DateTime startDateThisWeek = findFirstDateOfTheWeek(now);
      DateTime endDateThisWeek = findLastDateOfTheWeek(now);
      startDate =
          "${now.year}-${intToStringWithPrefixZero(startDateThisWeek.month)}-${intToStringWithPrefixZero(startDateThisWeek.day)}";
      if (intToStringWithPrefixZero(startDateThisWeek.month) == "12" &&
          (intToStringWithPrefixZero(endDateThisWeek.month) == "01")) {
        endDate =
            "${now.year + 1}-${intToStringWithPrefixZero(endDateThisWeek.month)}-${intToStringWithPrefixZero(endDateThisWeek.day)} 23:59:59";
      } else {
        endDate =
            "${now.year}-${intToStringWithPrefixZero(endDateThisWeek.month)}-${intToStringWithPrefixZero(endDateThisWeek.day)} 23:59:59";
      }
    } else if (dateRange == "This month") {
      dateRange = "This month";
      DateTime lastDateOfMonth = DateTime(now.year, now.month + 1, 0);
      startDate = "${now.year}-${intToStringWithPrefixZero(now.month)}-01";
      endDate =
          "${now.year}-${intToStringWithPrefixZero(now.month)}-${intToStringWithPrefixZero(lastDateOfMonth.day)} 23:59:59";
    } else if (dateRange == "This year") {
      dateRange = "This year";
      DateTime lastDateOfYear = DateTime(now.year + 1, 1, 0);
      startDate = "${now.year}-01-01";
      endDate =
          "${now.year}-12-${intToStringWithPrefixZero(lastDateOfYear.day)} 23:59:59";
    } else {
      startDate = dateRange!.split("/").first;
      endDate = dateRange!.split("/").last + " 23:59:59";
      dateRange = "$startDate to ${dateRange!.split("/").last}";
    }
  }

  String formattedDate(String date) {
    try {
      String _formattedDate = date.split(' ').last == date
          ? (date.split('-').last +
              "-" +
              date.split('-')[1] +
              "-" +
              date.split('-').first)
          : (date.split(" ").first.split("-").last +
              "-" +
              date.split(" ").first.split("-")[1] +
              "-" +
              date.split(" ").first.split("-").first +
              " " +
              date.split(" ").last);
      return _formattedDate;
    } catch (e) {
      return "Error formatting date";
    }
  }

  String intToStringWithPrefixZero(int value) {
    if (value.toString().length == 1) {
      return "0" + value.toString();
    }
    return value.toString();
  }

  DateTime findFirstDateOfTheWeek(DateTime dateTime) {
    return dateTime.subtract(Duration(days: dateTime.weekday - 1));
  }

  DateTime findLastDateOfTheWeek(DateTime dateTime) {
    return dateTime
        .add(Duration(days: DateTime.daysPerWeek - dateTime.weekday));
  }

  showPickerDateRange(BuildContext context,
      {required void onConfirmed(String startDate, String endDate)}) {
    late String _startDate;
    late String _endDate;

    final DateFormat formatter = DateFormat('yyyy-MM-dd');
    Picker ps = Picker(
        confirmText: "Confirm",
        cancelText: "Cancel",
        hideHeader: true,
        adapter: DateTimePickerAdapter(
            type: PickerDateTimeType.kYMD, isNumberMonth: false),
        onConfirm: (Picker picker, List value) {
          _startDate = formatter
              .format((picker.adapter as DateTimePickerAdapter).value!);
        });

    Picker pe = Picker(
        hideHeader: true,
        adapter: DateTimePickerAdapter(type: PickerDateTimeType.kYMD),
        onConfirm: (Picker picker, List value) {
          _endDate = formatter
              .format((picker.adapter as DateTimePickerAdapter).value!);
        });

    List<Widget> actions = [
      TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text(PickerLocalizations.of(context).cancelText!)),
      TextButton(
          onPressed: () {
            Navigator.pop(context);
            ps.onConfirm!(ps, ps.selecteds);
            pe.onConfirm!(pe, pe.selecteds);
            onConfirmed(_startDate, _endDate);
          },
          child: Text(PickerLocalizations.of(context).confirmText!))
    ];

    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Selete Date"),
            actions: actions,
            content: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Text("Start:"),
                  ps.makePicker(),
                  Text("End:"),
                  pe.makePicker()
                ],
              ),
            ),
          );
        });
  }
}
