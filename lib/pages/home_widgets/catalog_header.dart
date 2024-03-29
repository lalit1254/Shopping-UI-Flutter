import 'package:flutter/material.dart';
import 'package:learningproject/widgets/drawer.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:flutter/cupertino.dart';
import '../../widgets/themes.dart';

class CatalogHeader extends StatelessWidget {
  const CatalogHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        "Hot 'n' New ".text.xl3.bold.color(context.theme.accentColor).make(),
        "Trending Products".text.xl.make(),
      ],
    );
  }
}
