import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile_app_sisola/presenter/main/view/m_page.dart';
import 'package:mobile_app_sisola/presenter/main/view/main_page.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print('Access App');
    return MaterialApp(
      title: 'Sisola APP',
      theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          primarySwatch: Colors.blue,
          textTheme: GoogleFonts.openSansTextTheme(Theme.of(context).textTheme)),
      home: MainPage ()
      // home: MPage(),
      
      // BlocBuilder<AuthBloc, AuthState>(
      //   builder: (context, state) {
      //     print('at builder with state $state');
      //     if (state is AuthAuthenticated) {
      //       // show home page
      //       // return HomePage(
      //       //   user: state.user,
      //       // );
      //       //
      //       return MainPage();
      //     }
      //     // otherwise show login page
      //     return LoginPage();
      //   },
      // ),
    );
  }
}
