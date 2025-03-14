import 'package:ecom/global_variables.dart';
import 'package:ecom/product_details.dart';
import 'package:ecom/products_card.dart';
import 'package:flutter/material.dart';

class ProductList extends StatefulWidget {
  const ProductList({super.key});

  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  final List<String> filters = const [
    'ALL',
    'fashion',
    'watches',
    'groceries',
    'mobiles'
  ];
  late String selectedFilter;
  int currentPage = 0;

  @override
  void initState() {
    super.initState();
    selectedFilter = filters[0];
  }

  @override
  Widget build(BuildContext context) {
    const border = OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(30)),
    );

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 1),
        child: Column(
          children: [
            const TextField(
              cursorColor: Color.fromARGB(159, 0, 0, 0),
              decoration: InputDecoration(
                hintText: 'Search',
                hintStyle: TextStyle(fontWeight: FontWeight.w500),
                prefixIcon: Icon(Icons.search),
                border: border,
                focusedBorder: border,
              ),
            ),
            SizedBox(
              height: 120,
              child: ListView.builder(
                itemCount: filters.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  final filter = filters[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedFilter = filter;
                        });
                      },
                      child: Chip(
                        backgroundColor: selectedFilter == filter
                            ? Colors.yellow
                            : const Color.fromRGBO(245, 247, 249, 2),
                        label: Text(
                          filter,
                          style: const TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold),
                        ),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 15),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25)),
                      ),
                    ),
                  );
                },
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: products.length,
                scrollDirection: Axis.vertical,
                itemBuilder: (context, index) {
                  final product = products[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) {
                          return ProductDetails(product: product);
                        }),
                      );
                    },
                    child: ProductsCard(
                      title: product['title'] as String,
                      price: product['price'] as double,
                      images: product['imageUrl'] as String,
                      backGroundcolor: index.isEven
                          ? const Color.fromARGB(255, 221, 225, 214)
                          : const Color.fromRGBO(230, 243, 244, 1),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
