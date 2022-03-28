import 'package:billing_app/widgets/product_list_widgets.dart';
import 'package:flutter/material.dart';

import 'database_handler.dart';
import 'model/product_model.dart';

class ProductList extends StatefulWidget {
  const ProductList({Key? key}) : super(key: key);

  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  late DatabaseHandler handler;

  @override
  void initState() {
    super.initState();
    handler = DatabaseHandler();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: handler.retrieveProducts(),
      builder: (BuildContext context, AsyncSnapshot<List<Product>> snapshot) {
        if (snapshot.hasData) {
          return ListView.builder(
            itemCount: snapshot.data?.length,
            itemBuilder: (BuildContext context, int index) {
              return ProductListWidget(
                productImage: 'assets/image1.jfif',
                name: snapshot.data![index].name,
              );
            },
          );
        }else if(snapshot.hasError){

          print(snapshot.error);
          return Center(child: Text(snapshot.error.toString()),);
        }

        else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
