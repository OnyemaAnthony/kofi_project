part of 'authentication_bloc.dart';

abstract class AuthenticationEvent extends Equatable {
  const AuthenticationEvent();
}
class SignUpEvent extends AuthenticationEvent{
  final UserModel userModel;

 const SignUpEvent(this.userModel);
  @override
  List<Object?> get props => [];

}