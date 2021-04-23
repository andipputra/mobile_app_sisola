import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:mobile_app_sisola/model/data/user.dart';
import 'package:mobile_app_sisola/model/repository/auth_repository.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository _authRepository;

  AuthBloc(AuthRepository authRepository)
      : _authRepository = authRepository,
        super(AuthInitial());

  @override
  Stream<AuthState> mapEventToState(
    AuthEvent event,
  ) async* {
    print('event is $event');

    if (event is AppLoaded) {
      print('appLoad');

      yield AuthLoading();
      try {
        print('try get user');
        final currentUser = await _authRepository.getCurrentUser();

        if (currentUser != null) {
          yield AuthAuthenticated(currentUser);
        } else {
          yield AuthNotAuthenticated();
        }
      } catch (exception) {
        yield AuthFail(exception.toString());
      }
    }

    if (event is UserLoggedIn) {
      yield AuthAuthenticated(event.user);
    }

    if (event is UserLoggedOut) {
      yield AuthNotAuthenticated();
    }
  }

  // Stream<AuthState> _mapAppLoadedToState(AppLoaded event) async* {
  //   print('accessted map loaded');

  //   yield AuthLoading();
  //   try {
  //     print('try get user');
  //     final currentUser = await _authRepository.getCurrentUser();

  //     if (currentUser != null) {
  //       yield AuthAuthenticated(currentUser);
  //     } else {
  //       yield AuthNotAuthenticated();
  //     }
  //   } catch (exception) {
  //     yield AuthFail(exception.toString());
  //   }
  // }

  // Stream<AuthState> _mapUserLoggedInToState(UserLoggedIn event) async* {
  //   yield AuthAuthenticated(event.user);
  // }

  // Stream<AuthState> _mapUserLoggedOutToState(UserLoggedOut event) async* {
  //   yield AuthNotAuthenticated();
  // }
}
