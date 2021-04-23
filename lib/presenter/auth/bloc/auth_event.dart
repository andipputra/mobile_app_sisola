part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class AppLoaded extends AuthEvent {
  AppLoaded();

  @override
  List<Object> get props => [];
}

class UserLoggedIn extends AuthEvent {

  final User user;

  UserLoggedIn(this.user);

  @override
  List<Object> get props => [user];

}

class UserLoggedOut extends AuthEvent {
  UserLoggedOut();

  @override
  List<Object> get props => [];
}