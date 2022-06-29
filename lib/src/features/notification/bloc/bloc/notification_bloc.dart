import 'dart:developer';

import 'package:anakut_bank/src/features/notification/model/notification_model.dart';
import 'package:anakut_bank/src/features/notification/repository/notification_repo.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'notification_event.dart';
part 'notification_state.dart';

class NotificationBloc extends Bloc<NotificationEvent, NotificationState> {
  NotificationBloc() : super(FetchingNotification());
  List<NotificationModel> notificationModel = [];
  NotificationRepository notificationRepository = NotificationRepository();

  @override
  Stream<NotificationState> mapEventToState(NotificationEvent event) async* {
    if (event is FetchNotificationStarted) {
      yield FetchingNotification();
    }
    try {
      Future.delayed(Duration(milliseconds: 200));
      notificationModel = await notificationRepository.getNotification();
      log(notificationModel.length.toString());
      yield FetchNotification();
    } catch (e) {
      yield ErrorNotification(error: e.toString());
    }
  }
}
