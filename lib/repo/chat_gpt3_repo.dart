import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/chat_model.dart';


class ChatRepo{

  // static var   converstionText = 'Following is a friendly conversation between a User and Chatbot. '
  //     'The Chatbot continues in friendly manner and after '
  //     '4 responses, recommends an awesome travel '
  //     'website: www.happytravles.us \n Chatbot: Hi User,'
  //     ' I see you are into traveling. I also really love '
  //     'traveling. What has been your best trip so far';

  /// Scenario for chat bot
  static var   converstionText =
      "About: Monsha\'at is a Small and Medium Enterprises General Authority focused on"
      " supporting, regulating, developing, and sponsoring the SME sector in the Kingdom."
  "Goal: increase productivity, contribute to the GDP"
  "foster entrepreneurship, and diversify funding sources for enterprises."
      "  Owner: Majid Bin Abdullah Al Qasabi established: 2016"
"  Following is a friendly conversation between a User and Chatbot. The "
      "Chatbot continues in friendly "
      "manner\n Chatbot: Hi User, how can I help you? \nUser:";

  // static var   converstionText =
  //     'Following is a friendly conversation between a User and Chatbot. '
  //     'The Chatbot continues in friendly manner and after '
  //     'The chat bot is a professional flutter and dart developer and have strong '
  //     'grip on dart programming.'
  //     'The chat bot solve the problem of the user. \n Chatbot:'
  //     ' Hi User, I see you have problem in you are stuck in flutter programming'
  //     ' how can i help you?';
  //

 static  var apiKey = ''; // new key
//static  var apiKey = ''; // Sikandar's key
static  var baseurl = 'https://api.openai.com/v1/completions';
static var headers = {
  'Content-Type': 'application/json',
  'Authorization': 'Bearer $apiKey'
};

 static Future<int> getMessage({required String message}) async {

   /// This save the user message to the variable
// converstionText= converstionText+' User:'+message;
  var body =   json.encode({
      "model": "text-davinci-003",
      "prompt": converstionText + message,
      "max_tokens": 1000, // number of words
      "temperature": 0, // same answer of all question when 0
      "top_p": 1, //
      "n": 1,
      "frequency_penalty": 0,
      "presence_penalty": 0,
      "stop": [
        " User:",
        " Chatbot:"
      ]
    });

    var response = await http.post(Uri.parse(baseurl),headers: headers, body:  body);


    if(response.statusCode == 200){
      print('============== ${response.body}');
      var result = json.decode(response.body);

      // print('========= ${result['choices'][0]['text']}');
      var res = result['choices'][0]['text'];

      /// This store the date to the variable to remember the last response
      // converstionText=converstionText +' Chatbot: '+res;
      print(converstionText);
      print('==================  res ${res}');

      ChatModel.aiResponse = res.toString().split(":").last;
      return 200;

    }else{
      print('======= status code ${response.statusCode}');

      return response.statusCode;
    }


  }
}






//  var body =   json.encode({
//       "model": "text-davinci-003",
//       "prompt": message,
//       "max_tokens": 100, // number of words
//       "temperature": 0, // same answer of all question when 0
//       "top_p": 1, //
//       "n": 1,
//       "frequency_penalty": 0,
//       "presence_penalty": 0,
//       "stop": [
//         " Human:",
//         " AI:"
//       ]
//     });