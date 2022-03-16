import 'package:billing_app/widgets/product_list_widgets.dart';
import 'package:flutter/material.dart';

class ProductList extends StatelessWidget {
  const ProductList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (context,index){
        return ProductListWidget();
      },
    );
  }
}

