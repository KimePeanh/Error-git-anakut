part of 'transfer_bloc.dart';

@immutable
abstract class TransferState {}

class FetchingTra extends TransferState {}

class FetchedTra extends TransferState {}

class ErrorTra extends TransferState {
  final String error;
  ErrorTra({required this.error});
}
