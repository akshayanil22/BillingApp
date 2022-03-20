import 'package:billing_app/drop_down_item.dart';
import 'package:flutter/material.dart';

class AddProduct extends StatelessWidget {
  const AddProduct({Key? key}) : super(key: key);

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
                                  borderRadius: BorderRadius.circular(10))),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
                padding: EdgeInsets.all(20),
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
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: ElevatedButton.icon(
                            style: ElevatedButton.styleFrom(primary: Colors.green),
                            onPressed: () {},
                            icon: Icon(Icons.qr_code),
                            label: Text('QR Code'),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: TextField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              label: Text('Item Code'),
                              hintText: 'Code',
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Expanded(child: Container(child: DropDownItem())),
                      ],
                    ),
                  ],
                )),
            SizedBox(height: 100,),
            SizedBox(
                height: 50,
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(primary: Colors.green),
                  onPressed: (){}, child: Text('Add'),)),
          ],
        ),
      ),
    );
  }
}
