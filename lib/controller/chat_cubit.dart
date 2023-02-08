import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../repo/chat_gpt3_repo.dart';

part 'chat_state.dart';

class ChatCubit extends Cubit<ChatState> {

  ChatCubit() : super(ChatInitial());

  getMessage({required String message}) async {


    emit(ChatLoading());

   var result =    await  ChatRepo.getMessage(message: message);


   if(result !=null){
     emit(ChatLoaded(message: result));
   }else{
     emit(ChatError());
   }
  }
}
