import 'package:flutter/material.dart';
import 'package:mobile_app_sisola/model/data/data.dart';

class HomeProduk extends StatelessWidget {
  final List<Produk>? listProduk;

  HomeProduk({this.listProduk});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 16.0),
          child: Text('Produk', style: Theme.of(context).textTheme.headline6),
        ),
        Container(
          color: Colors.blue,
          padding: EdgeInsets.symmetric(vertical: 8),
          height: size.height * 0.12,
          child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: listProduk!.length,
              itemBuilder: (context, idx) => Card(
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Image.network(
                    listProduk![idx].images!,
                    fit: BoxFit.fitHeight,
                  ))),
        ),
      ],
    );
  }
}
