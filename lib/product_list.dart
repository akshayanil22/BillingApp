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
          return snapshot.data!.isEmpty?const Center(child:Text('No Data'))  :ListView.builder(
            itemCount: snapshot.data?.length,
            itemBuilder: (BuildContext context, int index) {
              return GestureDetector(
                onLongPress: () async{
                  await handler.deleteProduct(snapshot.data![index].id!);
                  setState(() {
                    snapshot.data!.remove(snapshot.data![index]);
                  });
                },
                child: ProductListWidget(
                  productImage: 'assets/image.png',
                  name: snapshot.data![index].name,
                  price: snapshot.data![index].price,
                ),
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
