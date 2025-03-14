import 'package:flutter/material.dart';

class ProductsCard extends StatelessWidget {
  final String title;
  final double price;
  final String images;
  final Color backGroundcolor;
  const ProductsCard({
    super.key,
    required this.title,
    required this.price,
    required this.images,
    required this.backGroundcolor,
  });
//const Color.fromARGB(255, 219, 247, 177),
  @override
  Widget build(BuildContext context) {
    return Card(
      color: backGroundcolor,
      child: Column(
        children: [
          Image(
            image: AssetImage(images),
            height:200,
            width:200,
          ),
          Text(
            title,
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            '₹$price',
            style:const  TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                fontFamily: 'Satisy'),
          ),
          const SizedBox(
            height: 5,
          ),
        ],
      ),
    );
  }
}
