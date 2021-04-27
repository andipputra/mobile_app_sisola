import 'package:flutter/material.dart';

class HeaderBar extends StatelessWidget {
// String title;

//   HeaderBar({
//     this.title,
//     Key key,
//   }) : super(key: key,);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: Colors.transparent,
      ),
      child: Center(

          child: Image.asset(
        'assets/images/logo/logo-BMF.png',
        fit: BoxFit.scaleDown,
      )),

      // margin: EdgeInsets.all(3),
      // child: Row(
      //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //   children: [
      //     Column(
      //       children: [
      //         Row(
      //           children: [
      //             Image.asset('assets/images/logo/BCAmf-logo.png'),
      //           ],
      //         )
      //       ],
      //     ),
      //     Column(
      //       children: [
      //         Row(
      //           children: [
      //             Card(
      //               elevation: 0,
      //               color: Colors.grey[300],
      //               shape: RoundedRectangleBorder(
      //                   borderRadius: BorderRadius.circular(10)),
      //               child: InkWell(
      //                 hoverColor: Colors.grey,
      //                 onTap: () {
      //                   print('tapped');
      //                 },
      //                 child: Container(
      //                   color: Colors.transparent,
      //                   width: MediaQuery.of(context).size.width * 0.08,
      //                   height: MediaQuery.of(context).size.width * 0.08,
      //                   child: Column(
      //                     mainAxisAlignment: MainAxisAlignment.center,
      //                     children: [
      //                       LayoutBuilder(
      //                         builder: (BuildContext context,
      //                             BoxConstraints constraints) {
      //                           return Icon(
      //                             Icons.notifications,
      //                             size: constraints.biggest.width * 0.8,
      //                             color: Colors.grey[600],
      //                           );
      //                         },
      //                       ),
      //                     ],
      //                   ),
      //                 ),
      //               ),
      //             ),
      //           ],
      //         )
      //       ],
      //     )
      //   ],
      // ),
    );
  }
}
