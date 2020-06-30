import 'package:flutter/material.dart';
import 'package:admin_fashion_shop/Models/products.dart';

class ProductTile extends StatelessWidget {
  final Product product;
  ProductTile({this.product});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Image.asset(product.imagePath),
        title: Text(product.name),
        subtitle: Text('Product Description looong lines of writing'),
        trailing: InkWell(
          child: Icon(Icons.more_vert),
          onTap: () {
            //display options to edit or delete product
          },
        ),
        isThreeLine: true,
      ),
      color: Colors.black,
    );
  }
}
