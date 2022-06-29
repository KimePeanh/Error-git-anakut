part of 'notification_bloc.dart';

abstract class NotificationEvent extends Equatable {
  NotificationEvent([List props = const []]) : super();

  @override
  List<Object> get props => [];
}

class FetchNotificationStarted extends NotificationEvent{}