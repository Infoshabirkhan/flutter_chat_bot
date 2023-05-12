import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:text_to_speech/models/chat_model.dart';
import 'package:text_to_speech/repo/api_response.dart';

import '../repo/chat_gpt3_repo.dart';

part 'chat_state.dart';

class ChatCubit extends Cubit<ChatState> {

  ChatCubit() : super(ChatInitial());

  getMessage({required String message}) async {


    emit(ChatLoading());

   var result =    await  ChatRepo.getMessage(message: message);


   if(result == 200){
     emit(ChatLoaded(message: ChatModel.aiResponse));
   }else{
     emit(ChatError( errorMessage: ApiResponse.getErrorMessage(statusCode: result)));
   }
  }
}
