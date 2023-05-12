
class ApiResponse{



  static int ok = 200;
  static int created = 201;
  static int accepted = 201;
  static int badRequest = 400;
  static int unAuthorized = 401;
  static int forbidden = 403;
  static int notFound = 404;
  static int requestTimeOut = 408;
  static int tooManyRequest = 429;
  static int internalServerError = 500;
  static int socketException = 1000;



  static getErrorMessage({required int statusCode}){
    if(statusCode == unAuthorized){
      return 'UnAuthorized operation perform';
    }else if(statusCode == forbidden){
      return 'Request forbidden';
    }else if(statusCode == notFound){
      return 'No record found';
    }else if(statusCode == 408){
      return 'Request Time out';
    }else if(statusCode == tooManyRequest){
      return 'Too Many Request';
    }else if(statusCode == badRequest){
      return 'Bad Request';
    }else if(statusCode == internalServerError){
      return 'Server not responding';
    }else if (statusCode == 1000){
      return 'Weak or not internet';
    }else {
      return '$statusCode Something went wrong';
    }
  }
}