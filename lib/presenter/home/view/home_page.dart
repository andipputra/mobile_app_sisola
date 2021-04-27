import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_app_sisola/global/loading_screen.dart';
import 'package:mobile_app_sisola/presenter/home/component/home_component.dart';
import 'package:mobile_app_sisola/presenter/home/cubit/home/home_cubit.dart';
import 'package:mobile_app_sisola/utils/style/color_style.dart';

class HomePage extends StatefulWidget {
  final bool isLogin;

  HomePage({required this.isLogin});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit()..loadHome(),
      child: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          if (state is HomeLoaded) {
            return Container(
              child: SingleChildScrollView(
                child: Stack(
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height * 0.37,
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: <Color>[
                            CostumColor.gradientBegin,
                            CostumColor.gradientEnd,
                          ])),
                    ),
                    Container(
                      child: Column(
                        children: [
                          HomePromo(
                            listPromo: state.promo,
                          ),
                          CardMenu(
                            isLogin: widget.isLogin,
                          ),
                          HomeProduk(
                            listProduk: state.produk,
                          ),
                          HomeArtikel(
                            listArtikel: state.artikel,
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            );

            // return Container(
            //   decoration: BoxDecoration(
            //       gradient: LinearGradient(
            //           begin: Alignment.topLeft,
            //           end: Alignment.bottomRight,
            //           colors: <Color>[
            //         CostumColor.gradientEnd,
            //         CostumColor.gradientBegin
            //       ])),
            //   child: SizedBox.expand(
            //     child: Stack(
            //       children: [
            //         Align(
            //             alignment: Alignment.topCenter,
            //             child: HomePromo(
            //               listPromo: state.promo,
            //             )),
            //         // Align(alignment: Alignment.center, child: Text('Test'),),
            //         SizedBox.expand(
            //           child: DraggableScrollableSheet(
            //               initialChildSize: 0.7,
            //               minChildSize: 0.7,
            //               maxChildSize: 1.0,
            //               builder: (BuildContext context,
            //                   ScrollController scrollController) {
            //                 return Container(
            //                     decoration: BoxDecoration(
            //                         color: Colors.white,
            //                         borderRadius: BorderRadius.only(
            //                             topLeft: Radius.circular(24),
            //                             topRight: Radius.circular(24)),
            //                         boxShadow: [
            //                           BoxShadow(
            //                               color: Colors.grey, blurRadius: 10.0)
            //                         ]),
            //                     padding: EdgeInsets.symmetric(vertical: 16),
            //                     child: SingleChildScrollView(
            //                       controller: scrollController,
            //                       child: Column(
            //                         children: [
            //                           CardMenu(
            //                             isLogin: widget.isLogin,
            //                           ),
            //                           HomeProduk(
            //                             listProduk: state.produk,
            //                           ),
            //                           HomeArtikel(
            //                             listArtikel: state.artikel,
            //                           )
            //                         ],
            //                       ),
            //                     ));
            //               }),
            //         )

            //         // HomeArtikel(state.artikel)
            //       ],
            //     ),
            //   ),
            // );
          }

          return LoadingScreen();
        },
      ),
    );
  }
}
