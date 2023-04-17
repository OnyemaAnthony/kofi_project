import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:carshop_mobile/models/user_model.dart';
import 'package:equatable/equatable.dart';

import '../../repositories/user_repository.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc extends Bloc<AuthenticationEvent, AuthenticationState> {
  UserRepository? repository;
  AuthenticationBloc({this.repository}) : super(AuthenticationInitial()) {
    on<SignUpEvent>(_mapSignUpEventToState);
  }

  FutureOr<void> _mapSignUpEventToState(SignUpEvent event, Emitter<AuthenticationState> emit)async {
    emit(AuthenticationLoadingState());
      final response = await repository!.signUp(event.userModel);
      response.fold((l) {
        //implement error here
      }, (r) {
        //implement success
        emit(Authenticated(r));
      });

  }
}
