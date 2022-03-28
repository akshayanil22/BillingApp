import 'package:billing_app/drop_down_item.dart';
import 'package:billing_app/model/product_model.dart';
import 'package:flutter/material.dart';

import 'bar_scan.dart';
import 'database_handler.dart';

class AddProduct extends StatefulWidget {
  const AddProduct({Key? key}) : super(key: key);

  @override
  State<AddProduct> createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {

  late DatabaseHandler handler;

  late String nameOfProduct;
  late String descriptionOfProduct;

  late double priceOfProduct;

  late String unitOfProduct;

  late String qrCodeOfProduct;

  Future<int> addProducts(String name1,double price1,String unit1) async {

    Product productDetails = Product(name: name1, price: price1, unit: unit1);
    return await handler.insertProduct(productDetails);
  }

  @override
  void initState() {
    handler = DatabaseHandler();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView(
          children: [
            Container(
              margin: EdgeInsets.only(top: 10),
              child: Row(
                children: [
                  Container(
                    width: 120,
                    height: 120,
                    decoration: BoxDecoration(
                        color: Colors.blueGrey[100],
                        image: const DecorationImage(
                            image: AssetImage('assets/image.png')),
                        borderRadius: BorderRadius.circular(20)),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        TextField(
                          decoration: InputDecoration(
                              hintText: 'Item Name',
                              label: const Text(
                                'Name',
                              ),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10))),
                          onChanged: (v){
                            nameOfProduct = v;
                          },
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        TextField(
                          decoration: InputDecoration(
                              hintText: 'Item Description',
                              label: const Text(
                                'Description',
                              ),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10)),),
                          onChanged: (v){
                            descriptionOfProduct = v;
                          },
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
                padding: const EdgeInsets.all(20),
                margin: const EdgeInsets.symmetric(vertical: 50),
                height: 200,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.blueGrey),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: TextField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              label: Text('Item Price'),
                              hintText: 'Price',
                            ),
                            onChanged: (v){
                              priceOfProduct = double.parse(v);
                            },
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: ElevatedButton.icon(
                            style: ElevatedButton.styleFrom(primary: Colors.green),
                            onPressed: () {
                              _navigateAndDisplaySelection(context);
                            },
                            icon: Icon(Icons.qr_code),
                            label: Text('QR Code'),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: const [
                        // Expanded(
                        //   child: TextField(
                        //     decoration: InputDecoration(
                        //       border: OutlineInputBorder(
                        //           borderRadius: BorderRadius.circular(10)),
                        //       label: const Text('Item Code'),
                        //       hintText: 'Code',
                        //     ),
                        //   ),
                        // ),
                        // const SizedBox(
                        //   width: 10,
                        // ),
                        Expanded(child: DropDownItem()),
                      ],
                    ),
                  ],
                )),
            const SizedBox(height: 100,),
            SizedBox(
                height: 50,
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(primary: Colors.green),
                  onPressed: (){
                    addProducts(nameOfProduct, priceOfProduct, 'count');
                  }, child: Text('Add'),)),
          ],
        ),
      ),
    );
  }

  void _navigateAndDisplaySelection(BuildContext context) async {
    // Navigator.push returns a Future that completes after calling
    // Navigator.pop on the Selection Screen.
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => BarScan()),
    );

    // After the Selection Screen returns a result, hide any previous snackbars
    // and show the new result.
    ScaffoldMessenger.of(context)
      ..removeCurrentSnackBar()
      ..showSnackBar(SnackBar(content: Text('$result')));

    qrCodeOfProduct = result;
  }
}
