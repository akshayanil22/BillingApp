import 'package:flutter/material.dart';

class ProductListWidget extends StatelessWidget {

  final String productImage;
  final String name;
  final double price;

  const ProductListWidget({Key? key, this.productImage = 'assets/image.png', required this.name,required this.price}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      width: double.infinity,
      height: 100,
      decoration: BoxDecoration(
          color: Colors.lightGreen[200],
          borderRadius: BorderRadius.circular(10)
      ),
      child: Row(
        children: [
          Container(
            height: 80,
            width: 80,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                image: AssetImage(productImage),
                fit: BoxFit.cover
              )
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 20),
            height: 80,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(name,style: const TextStyle(fontWeight: FontWeight.bold),),
                const SizedBox(height: 5,),
                const Text('Code No',style: TextStyle(
                  fontSize: 12,
                ),),
              ],
            ),
          ),
          const Spacer(),
          Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              color: Colors.blueGrey[100],
              borderRadius: BorderRadius.circular(100),
            ),
            child: Center(child: Text('₹${price.toString()}')),
          )
        ],
      ),
    );
  }
}
