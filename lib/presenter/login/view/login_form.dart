import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_app_sisola/model/repository/auth_repository.dart';
import 'package:mobile_app_sisola/presenter/auth/auth.dart';
import 'package:mobile_app_sisola/presenter/login/cubit/login_cubit.dart';

class LoginForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final authRepository = RepositoryProvider.of<AuthRepository>(context);
    final authBloc = BlocProvider.of<AuthBloc>(context);

    return Container(
      alignment: Alignment.center,
      child: BlocProvider<LoginCubit>(
        create: (context) => LoginCubit(authBloc, authRepository),
        child: _FormLogin(),
      ),
    );
  }
}

class _FormLogin extends StatefulWidget {
  @override
  __FormLoginState createState() => __FormLoginState();
}

class __FormLoginState extends State<_FormLogin> {
  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  final _passwordController = TextEditingController();
  final _emailController = TextEditingController();
  bool _autoValidate = false;

  @override
  Widget build(BuildContext context) {
    final _loginBloc = BlocProvider.of<LoginCubit>(context);

    void _onLoginButtonPressed() {
      if (_key.currentState!.validate()) {
        _loginBloc.login(_emailController.text, _passwordController.text);
      } else {
        setState(() {
          _autoValidate = true;
        });
      }
    }

    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is LoginFailure) {
          _showError(state.errorMessage);
        }
      },
      builder: (context, state) {
        if (state is LoginProcessing) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        return Form(
          key: _key,
          autovalidateMode: _autoValidate
              ? AutovalidateMode.always
              : AutovalidateMode.disabled,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Email address',
                    filled: true,
                    isDense: true,
                  ),
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  autocorrect: false,
                  validator: (value) {
                    if (value == null) {
                      return 'Email is required.';
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 12,
                ),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Password',
                    filled: true,
                    isDense: true,
                  ),
                  obscureText: true,
                  controller: _passwordController,
                  validator: (value) {
                    if (value == null) {
                      return 'Password is required.';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 16,
                ),
                MaterialButton(
                  color: Theme.of(context).primaryColor,
                  textColor: Colors.white,
                  padding: const EdgeInsets.all(16),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0)),
                  onPressed:
                      state is LoginProcessing ? () {} : _onLoginButtonPressed,
                  child: Text('LOG IN'),
                )
              ],
            ),
          ),
        );
      },
    );
  }

  void _showError(String error) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(error),
      backgroundColor: Theme.of(context).errorColor,
    ));
  }
}
