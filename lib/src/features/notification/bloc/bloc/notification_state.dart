part of 'notification_bloc.dart';

abstract class NotificationState extends Equatable {
  NotificationState([List props = const []]) : super();
  
  @override
  List<Object> get props => [];
}

class FetchingNotification extends NotificationState {}

class FetchNotification extends NotificationState {}

class ErrorNotification extends NotificationState {
  final String error;
  ErrorNotification({required this.error});
}

