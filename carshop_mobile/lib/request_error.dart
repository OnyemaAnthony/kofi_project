class RequestError {
  final dynamic error;

  RequestError(this.error);

  String get message {
    try{
      return error.message;
    }catch (e){
      return "$e";
    }
  }
}
