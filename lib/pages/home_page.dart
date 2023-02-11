// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:learningproject/models/catalog.dart';
import 'package:learningproject/pages/cart_page.dart';
import 'package:learningproject/pages/home_widgets/catalog_header.dart';
import 'package:learningproject/pages/home_widgets/catalog_list.dart';
import 'package:learningproject/utlis/routes.dart';
import 'package:learningproject/widgets/drawer.dart';
import 'package:learningproject/widgets/item_widget.dart';
import 'package:learningproject/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';

class Homepage extends StatefulWidget {
  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final int days = 30;

  final String name = "Lalit";

  @override
  void initState() {
    super.initState(); //init is used to pass data to build
    loadData();
  }

  loadData() async {
    await Future.delayed(Duration(seconds: 1));
    //rootbundule is used to get json just like to get we use image.network
    var catalogJson = await rootBundle.loadString("assets/files/catalog.json");
    var decodedData = jsonDecode(catalogJson);
    var productsData = decodedData["products"];
    CatalogModel.items = List.from(productsData)
        .map<Item>((item) => Item.fromMap(item))
        .toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {  
    //no need for dummy list now
    //final dummyList = List.generate(20, (indexNo lorem consetetur tempor ipsum magna sit, clita vero rebum ipsum justo et, dolor voluptua sadipscing no gubergren erat diam. Stet invidunt sadipscing et diam, et lorem kasd dolore amet sit diam. Takimata sanctus dolores sed lorem. Dolores nonumy ipsum diam sed ipsum sea amet amet nonumy. Sit sadipscing ut.) => CatalogModel.items[0]);
    return Scaffold(
      backgroundColor: context.cardColor,
     
     appBar: AppBar(
      backgroundColor: Colors.transparent,
      centerTitle: true,
      
     
        
     title: Text("Catalogs", style: TextStyle(color: MyTheme.darkbluishColor, fontWeight: FontWeight.bold, fontSize: 27,),),
     ),
     floatingActionButton: FloatingActionButton(onPressed:() => Navigator.pushNamed(context, MyRoutes.cartRoute),
     backgroundColor: context.theme.buttonColor,
     child: Icon(CupertinoIcons.cart),
     ),
      
      body: SafeArea(
        child: Container(
          padding: Vx.mV32,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            
              CatalogHeader(),
              if (CatalogModel.items != null && CatalogModel.items.isNotEmpty)
                CatalogList().py16().expand()
              else
                CircularProgressIndicator().centered().expand(),
            ],
            
          ),
        ),
    
      ),
 drawer: MyDrawer(),
      

      //here in body we want to see list of items so listview,
      // body: Padding(
      //   padding: const EdgeInsets.all(16.0),
      //   child: (CatalogModel.items != null && CatalogModel.items.isNotEmpty)
      //       ?
      //       // ListView.builder(
      //       //   itemCount: CatalogModel.items.length,
      //       //   itemBuilder: (context, index) {
      //       //     return ItemWidget(
      //       //       item: CatalogModel.items[index],
      //       //     );
      //       //   },
      //       // )
      //       GridView.builder(
      //           gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      //               crossAxisCount: 2,
      //               mainAxisSpacing: 15,
      //               crossAxisSpacing: 16),
      //           itemBuilder: (context, index) {
      //             final item=CatalogModel.items[index];
      //             return Card(
      //               clipBehavior: Clip.antiAlias,
      //               shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      //               child: GridTile(
      //                 header: Text(item.name),
      //                 child: Image.network(item.image),
      //                 footer: Text(item.price.toString())));
      //           },
      //           itemCount: CatalogModel.items.length,
      //         )
      //       : Center(
      //           child: CircularProgressIndicator(),
      //         ),
      //),
    );
  }
}

