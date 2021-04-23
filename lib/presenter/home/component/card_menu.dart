import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mobile_app_sisola/model/data/data.dart';
import 'package:mobile_app_sisola/presenter/auth/auth.dart';
import 'package:mobile_app_sisola/utils/dialog/bottomsheet_container.dart';
import 'package:mobile_app_sisola/utils/dialog/content/unauthenticated.dart';

class CardMenu extends StatelessWidget {
  final List<MenuLayanan> _menu = [
    MenuLayanan(
        icon: FaIcon(FontAwesomeIcons.motorcycle, color: Colors.blue),
        name: 'Pengambilan BPKB',
        route: '/bpkb'),
    MenuLayanan(
        icon: FaIcon(FontAwesomeIcons.fileSignature, color: Colors.blue),
        name: 'Perpanjangan STNK',
        route: '/bpkb'),
    MenuLayanan(
        icon: FaIcon(FontAwesomeIcons.calendarAlt, color: Colors.blue),
        name: 'Ubah Jatuh Tempo',
        route: '/bpkb'),
    MenuLayanan(
        icon: FaIcon(
          FontAwesomeIcons.cashRegister,
          color: Colors.blue,
        ),
        name: 'Percepat Pelunasan',
        route: '/bpkb'),
    MenuLayanan(
        icon: FaIcon(FontAwesomeIcons.carCrash, color: Colors.blue),
        name: 'Claim Asuransi',
        route: '/bpkb'),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: GridView.builder(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: _menu.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
          ),
          itemBuilder: (context, index) {
            return TextButton(
              onPressed: () {
                print('State is $AuthState');

                BlocListener<AuthBloc, AuthState>(listener: (context, state) {
                  print('State is $state');

                  if (state is AuthAuthenticated) {
                    return BottomSheetContainer(context).showDialog(Container(
                      child: Text('Login'),
                    ));
                  } else {
                    return BottomSheetContainer(context)
                        .showDialog(UnAuthenticated());
                  }
                });
              },
              child: Wrap(
                alignment: WrapAlignment.center,
                children: [
                  _menu[index].icon,
                  Text(
                    _menu[index].name,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.overline,
                  )
                ],
              ),
            );
          }),
    );
  }
}
