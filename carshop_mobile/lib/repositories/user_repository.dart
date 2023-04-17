import 'package:carshop_mobile/api_request.dart';
import 'package:carshop_mobile/request_error.dart';
import 'package:dartz/dartz.dart';
import 'package:carshop_mobile/models/user_model.dart';

class UserRepository {

  Future<Either<RequestError, UserModel>> signUp(UserModel user) async {
    ApiRequest request = ApiRequest();
    try {
      UserModel response = await request.post('url') as UserModel;
      return Right(response);
    } catch (e) {
      return Left(RequestError(e));
    }
  }
}
