import 'package:anakut_bank/src/features/reciept/setting/model/setting_model.dart';
import 'package:equatable/equatable.dart';

abstract class SettingEvent extends Equatable {
  SettingEvent([List props = const []]) : super();
  @override
  List<Object> get props => [];
}

class InitializeStarted extends SettingEvent {}

class SetStarted extends SettingEvent {
  final Setting setting;
  // ignore: avoid_init_to_null
  SetStarted({required this.setting});
}

class ErrorSetting extends SettingEvent {
  final dynamic error;
  ErrorSetting({required this.error});
}
