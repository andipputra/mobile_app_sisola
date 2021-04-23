import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:mobile_app_sisola/model/repository/auth_repository.dart';
import 'package:mobile_app_sisola/presenter/auth/auth.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(AuthBloc authBloc, AuthRepository authRepo)
      : _authBloc = authBloc,
        _authRepo = authRepo,
        super(LoginInitial());

  final AuthBloc _authBloc;
  final AuthRepository _authRepo;

  void login(String username, String password) async {
    emit(LoginProcessing());
    try {
      final hasil = await _authRepo.login(username, password);

      if (hasil == null) {
        emit(LoginFailure('Login Gagal'));
      } else {
        _authBloc.add(UserLoggedIn(hasil));
        emit(LoginSuccess());
        emit(LoginInitial());
      }
    } catch (e) {
      emit(LoginFailure(e.toString()));
    }
  }
}
