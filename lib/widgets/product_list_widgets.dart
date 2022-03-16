import 'package:flutter/material.dart';

class ProductListWidget extends StatelessWidget {
  const ProductListWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      width: double.infinity,
      height: 100,
      decoration: BoxDecoration(
          color: Colors.lightGreen[100],
          borderRadius: BorderRadius.circular(10)
      ),
      child: Row(
        children: [
          Container(
            height: 80,
            width: 80,
            decoration: BoxDecoration(
              color: Colors.blueGrey,
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 20),
            height: 80,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text('Name'),
                SizedBox(height: 5,),
                Text('Code No',style: TextStyle(
                    color: Colors.grey
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
            child: Center(child: Text('₹40')),
          )
        ],
      ),
    );
  }
}
