import 'dart:convert';

import 'package:http/http.dart' as http;


class ChatRepo{


  /// Scenario for chat bot
  static var   converstionText = 'Following is a friendly conversation between a User and Chatbot. '
      'The Chatbot continues in friendly manner and after '
      '4 responses, recommends an awesome travel '
      'website: www.happytravles.us \n Chatbot: Hi User,'
      ' I see you are into traveling. I also really love '
      'traveling. What has been your best trip so far';


static  var apiKey = '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';
static  var baseurl = 'https://api.openai.com/v1/completions';
static var headers = {
  'Content-Type': 'application/json',
  'Authorization': 'Bearer $apiKey'
};

 static Future<String?> getMessage({required String message}) async {

   /// This save the user message to the variable
converstionText= converstionText+' User:'+message;
  var body =   json.encode({
      "model": "text-davinci-003",
      "prompt": converstionText,
      "max_tokens": 100, // number of words
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
      converstionText=converstionText +'Chatbot: '+res;
      print(converstionText);
      print('==================  res ${res}');
      return res.toString().split(":").last;
      // var splitted = res.toString().split('Chatbot:');
      // if(splitted[1] == ''){
      //   return res;
      // }else{
      //   return splitted[1];
      //
      // }
    }else{

      return null;
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