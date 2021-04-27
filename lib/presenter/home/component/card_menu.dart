import 'package:flutter/material.dart';
import 'package:mobile_app_sisola/model/data/data.dart';
import 'package:mobile_app_sisola/utils/dialog/bottomsheet_container.dart';
import 'package:mobile_app_sisola/utils/dialog/content/unauthenticated.dart';

class CardMenu extends StatefulWidget {
  final bool isLogin;

  CardMenu({required this.isLogin});

  @override
  _CardMenuState createState() => _CardMenuState();
}

class _CardMenuState extends State<CardMenu> {
  final List<MenuLayanan> _menu = [
    MenuLayanan(
        icon: 'assets/images/logo/bpkb.png',
        name: 'Pengambilan BPKB',
        route: '/bpkb'),
    MenuLayanan(
        icon: 'assets/images/logo/stnk.png',
        name: 'Perpanjangan STNK',
        route: '/bpkb'),
    MenuLayanan(
        icon: 'assets/images/logo/calendar_home.png',
        name: 'Ubah Jatuh Tempo',
        route: '/bpkb'),
    MenuLayanan(
        icon: 'assets/images/logo/laporan.png',
        name: 'Percepat Pelunasan',
        route: '/bpkb'),
    MenuLayanan(
        icon: 'assets/images/logo/insurance.png',
        name: 'Claim Asuransi',
        route: '/bpkb'),
  ];

  @override
  Widget build(BuildContext context) {
    void accessMenu() {
      print('tapped menu');

      if(widget.isLogin){
        return BottomSheetContainer(context).showDialog(Container(
            child: Text('Login'),
          ));
      } else {
        return BottomSheetContainer(context).showDialog(UnAuthenticated());
      }
    }

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Layanan', style: Theme.of(context).textTheme.subtitle1),
          GridView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: _menu.length,
              gridDelegate:
                  SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4),
              itemBuilder: (context, index) {
                return TextButton(
                  onPressed: () {
                    accessMenu();
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ImageIcon(
                        AssetImage(_menu[index].icon),
                        size: 36,
                        color: Colors.blue,
                      ),
                      Text(_menu[index].name,
                          style: Theme.of(context).textTheme.caption,
                          textAlign: TextAlign.center)
                    ],
                  ),
                );
              }),
        ],
      ),
    );
  }
}
