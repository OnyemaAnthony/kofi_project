part of 'authentication_bloc.dart';

abstract class AuthenticationState extends Equatable {
  const AuthenticationState();
}

class AuthenticationInitial extends AuthenticationState {
  @override
  List<Object> get props => [];
}
class Authenticated extends AuthenticationState{
  final UserModel? userModel;

  const Authenticated(this.userModel);

  @override
  List<Object?> get props =>[];
}

class AuthenticationLoadingState extends AuthenticationState{
  @override
  List<Object?> get props => [];
}

class AuthenticationErrorState extends AuthenticationState{
  final String errorMessage;

  const AuthenticationErrorState(this.errorMessage);
  @override
  List<Object?> get props => [];

}
