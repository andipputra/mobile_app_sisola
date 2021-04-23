import 'package:flutter/material.dart';

import 'color_style.dart';

class HeaderAssets {
  Image headerLogo = Image.asset(
    'assets/images/BCAmf-logo.png',
    height: 300,
    width: 230,
  );
  Widget headerDecoration = Container(
    decoration: BoxDecoration(
      color: Colors.transparent,
        gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: <Color>[
          CostumColor.gradientEnd,
          CostumColor.gradientBegin
        ])),
  );
}
