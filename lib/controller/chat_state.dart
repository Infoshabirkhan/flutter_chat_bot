part of 'chat_cubit.dart';

@immutable
abstract class ChatState {}

class ChatInitial extends ChatState {}
class ChatLoading extends ChatState {}
class ChatLoaded extends ChatState {
  final String message;

  ChatLoaded({required this.message});
}
class ChatError extends ChatState {
  final String errorMessage;

  ChatError({required this.errorMessage});
}
