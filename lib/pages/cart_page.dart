import 'package:flutter/material.dart';
import 'package:learningproject/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';

import '../models/cart.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: MyTheme.creameColor,
        appBar: AppBar(
          backgroundColor: Colors.deepPurpleAccent,
          title: "Cart".text.bold.center.white.make(),
        ),
        body: Flexible(
          flex: 1,
          child: Column(
            children: [
              _CartList().p32().expand(),
              Divider(),
              _CartTotal(),
            ],
          ),
        ));
  }
}

class _CartTotal extends StatelessWidget {
  const _CartTotal({super.key});

  @override
  Widget build(BuildContext context) {
    final _cart = CartModel();
    return SizedBox(
      height: 200,
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
        // "\$${_cart.totalPrice}"
        //     .text
        //     .xl5
        //     .color(context.theme.accentColor)
        //     .make(),
        30.widthBox,
        ElevatedButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: "Buying  is currently not supported in your region"
                        .text
                        .make(),
                  ));
                },
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(context.theme.buttonColor)),
                child: "Buy".text.white.make())
            .w16(context)
      ]),
    );
  }
}

class _CartList extends StatefulWidget {
  const _CartList({super.key});

  @override
  State<_CartList> createState() => __CartListState();
}

class __CartListState extends State<_CartList> {
  final _cart = CartModel();
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: _cart.items.length,
      itemBuilder: (context, index) => ListTile(
        leading: Icon(Icons.done),
        trailing: IconButton(
          icon: Icon(Icons.remove),
          onPressed: () {},
        ),
        title: _cart.items[index].name.text.make(),
      ),
    );
  }
}
