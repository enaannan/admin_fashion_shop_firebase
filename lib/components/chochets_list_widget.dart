import 'package:flutter/material.dart';
import 'package:admin_fashion_shop/components/productsTile.dart';
import 'package:provider/provider.dart';
import 'package:admin_fashion_shop/Models/chrochet_data.dart';

class CrochetProductListWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<CrochetData>(builder: (context, chrochetData, child) {
      return ListView.builder(
        itemBuilder: (context, index) {
          final product = chrochetData.chrochetProducts[index];
          return ProductTile(
            product: product,
          );
        },
        itemCount: chrochetData.productCount,
        scrollDirection: Axis.vertical,
      );
    });
  }
}
