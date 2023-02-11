import 'package:flutter/material.dart';
import 'package:learningproject/models/cart.dart';
import 'package:learningproject/models/catalog.dart';
import 'package:learningproject/pages/home_detail_page.dart';
import 'package:learningproject/pages/home_page.dart';
import 'package:learningproject/pages/home_widgets/catalog_image.dart';
import 'package:velocity_x/velocity_x.dart';

class CatalogList extends StatelessWidget {
  const CatalogList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: CatalogModel.items.length,
      itemBuilder: (context, index) {
        final catalog = CatalogModel.items[index];
        //we wrapped catalogItem with inkwell so that we can use ontap so that when we press catalog image its shows the image
        return InkWell(
          child: CatalogItem(catalog: catalog),
          onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => HomeDetailPage(
                        catalog: catalog,
                      ))),
        );
      },
    );
  }
}

class CatalogItem extends StatelessWidget {
  final Item catalog;
  const CatalogItem({
    Key? key,
    required this.catalog,
  })  : assert(catalog != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return VxBox(
        child: Row(children: [
      Hero(
        tag: Key(catalog.id.toString()),
        child: CatalogImage(
          image: catalog.image,
        ),
      ),
      Expanded(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            catalog.name.text.lg.bold.make(),
            catalog.desc.text.textStyle(context.captionStyle).make(),
            10.heightBox,
            ButtonBar(
              alignment: MainAxisAlignment.spaceAround,
              children: [
                "\$${catalog.price}".text.bold.xl.green800.make(),
                _AddToCart(catalog: catalog)
              ],
            )
          ],
        ),
      )
    ])).gray100.rounded.square(200).make().p(13);
  }
}

class _AddToCart extends StatefulWidget {
  final Item catalog;
  const _AddToCart({
    Key? key,
    required this.catalog,
  }) : super(key: key);

  @override
  State<_AddToCart> createState() => _AddToCartState();
}

class _AddToCartState extends State<_AddToCart> {
  bool isAdded = false;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () {
          isAdded = isAdded.toggle();
          final _catalog = CatalogModel();
          final _cart = CartModel();
          _cart.catalog = _catalog;
          _cart.add(widget.catalog);

          setState(() {});
        },
        style: ButtonStyle(
            shape: MaterialStateProperty.all(
          StadiumBorder(),
        )),
        child: isAdded ? Icon(Icons.done) : "Add to Cart".text.make());
  }
}
