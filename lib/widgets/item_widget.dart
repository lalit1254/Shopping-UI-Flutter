import 'package:flutter/material.dart';
import 'package:learningproject/models/catalog.dart';

class ItemWidget extends StatelessWidget {
  final Item item;

  const ItemWidget({super.key, required this.item}) : assert(item != null);

  @override
  Widget build(BuildContext context) {
    //we are using ListTile widget which is easiest way to show items in list.
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Card(
        elevation: 2,

        //we wrapped listtile with card to see as box
        child: ListTile(
          onTap: () {
            print("${item.name} pressed");
          },
          //by doing this we get image from item_widget
          leading: Image.network(item.image),
          title: Text(item.name),
          subtitle: Text(item.desc),
          trailing: Text(
            "\$${item.price}",
            textScaleFactor: 1.2,
            //first dollar is for dollar sign and second to write price.
            style: TextStyle(
              color: Colors.deepPurple,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
