

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_app_sisola/presenter/auth/auth.dart';
import 'package:mobile_app_sisola/presenter/login/view/login_form.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print('print login page');

    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 24),
        color: Colors.white,
        child: BlocConsumer<AuthBloc, AuthState>(
          listener: (context, state){
            if(state is AuthAuthenticated){
              Navigator.pop(context);
            }
          },
          builder: (context, state) {
            final authBloc = BlocProvider.of<AuthBloc>(context);

            print('state is $state');

            if (state is AuthNotAuthenticated) {
              return LoginForm();
            }
            if (state is AuthFail) {
              return Center(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(state.message),
                  TextButton(
                    onPressed: () {
                      authBloc.add(AppLoaded());
                    },
                    child: Text('Retry'),
                  )
                ],
              ));
            }
            return Center(
              child: Column(
                children: [
                  CircularProgressIndicator(
                    strokeWidth: 2,
                  ),
                  Text('Please Wait'),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
