import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:text_to_speech/models/chat_model.dart';


class ChatListCubit extends Cubit<List<ChatModel>> {
  ChatListCubit(super.initialState);


  getList({required List<ChatModel> list}){
    emit(list);
  }

}
