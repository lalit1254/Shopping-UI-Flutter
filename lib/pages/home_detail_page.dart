// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:learningproject/models/catalog.dart';
import 'package:learningproject/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';

class HomeDetailPage extends StatelessWidget {
  final Item catalog;
  const HomeDetailPage({
    Key? key,
    required this.catalog,
  })  : assert(catalog != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
        ), //for back button
        backgroundColor: MyTheme.creameColor,
        //we added bottom navigation bar at the bottom and copied the content of button bar fropm the catalog list
        bottomNavigationBar: Container(
          color: Colors.white,
          child: ButtonBar(
            alignment: MainAxisAlignment.spaceBetween,
            children: [
              "\$${catalog.price}".text.bold.xl4.red700.make(),
              ElevatedButton(
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content:
                              "Buying  is currently not supported in your region"
                                  .text
                                  .make(),
                        ));
                      },
                      style: ButtonStyle(
                          shape: MaterialStateProperty.all(
                        StadiumBorder(),
                      )),
                      child: "Buy".text.make())
                  .wh(100, 50)
            ],
          ).p32(),
        ),
        body: SafeArea(
          bottom: false,
          child: Column(children: [
            Hero(
              tag: Key(catalog.id.toString()),
              child: Image.network(catalog.image),
            ).h32(context),
            Expanded(
                child: VxArc(
              height: 60,
              arcType: VxArcType.CONVEY,
              edge: VxEdge.TOP,
              child: Container(
                color: Colors.white,
                width: context.screenWidth,
                //here inside the container we copied the content of catalog list
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    catalog.name.text.xl4
                        .color(MyTheme.darkbluishColor)
                        .bold
                        .make(),
                    catalog.desc.text.textStyle(context.captionStyle).xl.make(),
                    40.heightBox,
                    "Eos amet dolores et lorem duo, magna dolor dolor erat sea stet stet kasd sea. Labore lorem dolor clita ut dolor kasd invidunt ut no, vero dolore eirmod ea amet lorem aliquyam  magna dolor dolor erat sea stet stet kasd sea. Stet sit at sadipscing dolor amet erat. Duo lorem dolor."
                        .text
                        .textStyle(context.captionStyle)
                        .make()
                  ],
                ),
              ),
            ))
          ]),
        ));
  }
}
