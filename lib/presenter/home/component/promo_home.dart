import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:mobile_app_sisola/model/data/data.dart';
// import 'package:mobile_app_sisola/presenter/home/cubit/promo/promohome_cubit.dart';

class HomePromo extends StatelessWidget {
  HomePromo({this.listPromo});

  final List<Promo>? listPromo;
  
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 24),
      child: AspectRatio(
        aspectRatio: 14 / 5,
        child: Container(
            child: CarouselSlider(
                options: CarouselOptions(
                    autoPlay: true,
                    autoPlayInterval: Duration(seconds: 3),
                    viewportFraction: 1),
                items: listPromo!
                    .map(
                      (e) => Card(
                          color: Colors.blue,
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16.0),
                          ),
                          child: Image.network(e.images!)),
                    )
                    .toList())),
      ),
    );
  }
}

// class HomePromo extends StatefulWidget {
//   HomePromo({this.listPromo});

//   final List<Promo>? listPromo;
//   @override
//   _HomePromoState createState() => _HomePromoState();
// }

// class _HomePromoState extends State<HomePromo> {
//   // final promoHomeCubit = PromohomeCubit();

//   // @override
//   // Widget build(BuildContext context) {
//   //   return BlocProvider(
//   //     create: (context) => PromohomeCubit()..loadPromoList(),
//   //     child: Container(
//   //       color: Colors.blue,
//   //       padding: EdgeInsets.symmetric(vertical: 24),
//   //       child: AspectRatio(
//   //         aspectRatio: 14 / 5,
//   //         child: Container(
//   //           child: BlocBuilder<PromohomeCubit, PromohomeState>(
//   //             builder: (context, state) {
//   //               if (state is PromohomeLoaded) {
//   //                 return CarouselSlider(
//   //                     options: CarouselOptions(
//   //                         autoPlay: true,
//   //                         autoPlayInterval: Duration(seconds: 3),
//   //                         viewportFraction: 1),
//   //                     items: state.listPromo
//   //                         .map(
//   //                           (e) =>

//   //                           // Image.network(e.images!)

//   //                           Card(
//   //                             color: Colors.blue,
//   //                             clipBehavior: Clip.antiAliasWithSaveLayer,
//   //                             shape: RoundedRectangleBorder(
//   //                               borderRadius: BorderRadius.circular(16.0),
//   //                             ),
//   //                             child: Image.network(e.images!)
//   //                           ),
//   //                         )
//   //                         .toList());
//   //               }

//   //               return LoadingScreen();
//   //             },
//   //           ),
//   //         ),
//   //       ),
//   //     ),
//   //   );
//   // }
//   //
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: EdgeInsets.symmetric(vertical: 24),
//       child: AspectRatio(
//         aspectRatio: 14 / 5,
//         child: Container(
//             child: CarouselSlider(
//                 options: CarouselOptions(
//                     autoPlay: true,
//                     autoPlayInterval: Duration(seconds: 3),
//                     viewportFraction: 1),
//                 items: widget.listPromo!
//                     .map(
//                       (e) =>

//                           // Image.network(e.images!)

//                           Card(
//                               color: Colors.blue,
//                               clipBehavior: Clip.antiAliasWithSaveLayer,
//                               shape: RoundedRectangleBorder(
//                                 borderRadius: BorderRadius.circular(16.0),
//                               ),
//                               child: Image.network(e.images!)),
//                     )
//                     .toList())),
//       ),
//     );
//   }
// }
