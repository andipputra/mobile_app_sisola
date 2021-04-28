import 'package:flutter/material.dart';
import 'package:mobile_app_sisola/model/data/data.dart';
import 'package:mobile_app_sisola/utils/style/color_style.dart';

class HomeProduk extends StatelessWidget {
  final List<Produk>? listProduk;

  HomeProduk({this.listProduk});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.only(top: 16),
      child: Column(
        children: [
          Container(
              padding: EdgeInsets.only(top: 16),
              width: size.width,
              color: Colors.cyan[50],
              // decoration: BoxDecoration(
              //     gradient: LinearGradient(
              //         begin: Alignment.topLeft,
              //         end: Alignment.bottomRight,
              //         colors: <Color>[
              //       CostumColor.gradientBegin,
              //       CostumColor.gradientEnd,
              //     ])),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Padding(
                    //   padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
                    //   child: Text('Produk',
                    //       style: TextStyle(
                    //           color: Colors.white,
                    //           fontSize: 22,
                    //           fontWeight: FontWeight.bold)),
                    // ),
                    Container(
                      height: size.height * 0.15,
                      child: GridView.builder(
                          itemCount: listProduk!.length,
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 1),
                          itemBuilder: (context, idx) => Container(
                                margin: EdgeInsets.symmetric(horizontal: 4),
                                child: Wrap(
                                  children: [
                                    // Card(
                                    //     // color: Colors.blue,
                                    //     clipBehavior: Clip.antiAliasWithSaveLayer,
                                    //     shape: RoundedRectangleBorder(
                                    //       borderRadius: BorderRadius.circular(16.0),
                                    //     ),
                                    //     child: Padding(
                                    //       padding: const EdgeInsets.all(8.0),
                                    //       child: Image.network(
                                    //         listProduk![idx].images!,
                                    //         fit: BoxFit.fitHeight,
                                    //       ),
                                    //     )),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 16.0),
                                      child: Image.network(
                                        listProduk![idx].images!,
                                        fit: BoxFit.fitHeight,
                                      ),
                                    ),
                                    Text(
                                      listProduk![idx].title!,
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: Colors.black87, fontSize: 12),
                                    )
                                  ],
                                ),
                              )),
                    ),
                  ])),
        ],
      ),
    );
  }
}
