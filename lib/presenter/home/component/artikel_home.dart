import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:mobile_app_sisola/model/data/data.dart';

class HomeArtikel extends StatelessWidget {
  HomeArtikel({this.listArtikel});
  final List<Artikel>? listArtikel;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 16.0, top: 8, bottom: 4),
          child:
              Text('Artikel', style: Theme.of(context).textTheme.subtitle1),
        ),
        Container(
          height: size.height * 0.2,
          child: ListView.builder(
              physics: ClampingScrollPhysics(),
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: listArtikel!.length,
              itemBuilder: (context, idx) => Container(
                    width: size.width * 0.5,
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Card(
                            color: Colors.blue,
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16.0),
                            ),
                            child: Image.network(
                              listArtikel![idx].images!,
                              fit: BoxFit.fill,
                            )),
                        Text(
                          listArtikel![idx].title!,
                          style: Theme.of(context).textTheme.subtitle2,
                        )
                      ],
                    ),
                  )),
        ),
      ],
    );
  }
}
