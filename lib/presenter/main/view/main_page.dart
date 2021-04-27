import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_app_sisola/presenter/auth/auth.dart';
import 'package:mobile_app_sisola/presenter/home/view/home_page.dart';
import 'package:mobile_app_sisola/utils/dialog/bottomsheet_container.dart';
import 'package:mobile_app_sisola/utils/dialog/content/unauthenticated.dart';
import 'package:mobile_app_sisola/utils/widget/header_bar.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final PageController _myPage = PageController(initialPage: 0);

  var _isAuth = false;

  @override
  Widget build(Object context) {
    final _page = <Widget>[
      HomePage(
        isLogin: _isAuth,
      ),
      Container(
        child: Text('2'),
      ),
      Container(
        child: Text('3'),
      ),
      Container(
        child: Text('4'),
      ),
    ];

    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthAuthenticated) {
          _isAuth = true;
        }
      },
      child: Scaffold(
        appBar: AppBar(
            automaticallyImplyLeading: false,
            // backgroundColor: Colors.transparent,
            // shadowColor: Colors.transparent,
            // title: HeaderBar(),
            elevation: 0,
            centerTitle: true,
            title: HeaderBar(),
            backgroundColor: Colors.white12
            // flexibleSpace: HeaderAssets().headerDecoration,
            ),
        body: SafeArea(
          child: PageView(
            controller: _myPage,
            children: _page,
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
              setState(() {
                _myPage.jumpToPage(2);
              });
            });
          },
          backgroundColor: Colors.blue,
          elevation: 0.0,
          shape: CircleBorder(
            side: BorderSide(
              width: 2.0,
              color: Colors.white,
            ),
          ),
          child: ImageIcon(
            AssetImage('assets/images/logo/calculator.png'),
            size: 24,
            color: Colors.white,
          ),
        ),
        bottomNavigationBar: BottomAppBar(
          shape: CircularNotchedRectangle(),
          color: Colors.blue,
          notchMargin: 4,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Expanded(
                child: IconButton(
                  icon: ImageIcon(
                    AssetImage('assets/images/logo/home.png'),
                    size: 24,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    setState(() {
                      _myPage.jumpToPage(0);
                    });
                  },
                ),
              ),
              Expanded(
                child: IconButton(
                  icon: ImageIcon(
                    AssetImage('assets/images/logo/contract.png'),
                    size: 24,
                    color: Colors.white,
                  ),
                  onPressed: () async {
                    if (_isAuth) {
                      setState(() {
                        _myPage.jumpToPage(1);
                      });
                    } else {
                      return BottomSheetContainer(this.context)
                          .showDialog(UnAuthenticated());
                    }
                  },
                ),
              ),
              Spacer(),
              Expanded(
                child: IconButton(
                  icon: ImageIcon(
                    AssetImage('assets/images/logo/head_phone.png'),
                    size: 24,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    setState(() {
                      _myPage.jumpToPage(3);
                    });
                  },
                ),
              ),
              Expanded(
                child: IconButton(
                  icon: ImageIcon(
                    AssetImage('assets/images/logo/people.png'),
                    size: 24,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    if (_isAuth) {
                      setState(() {
                        _myPage.jumpToPage(4);
                      });
                    } else {
                      return BottomSheetContainer(this.context)
                          .showDialog(UnAuthenticated());
                    }
                  },
                ),
              ),
            ],
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      ),
    );
  }
}
