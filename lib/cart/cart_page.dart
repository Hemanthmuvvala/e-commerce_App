import 'package:ecom/cart/cart_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    final cart = context.watch<CartProvider>().cart;
    //final cart = Provider.of<CartProvider>(context).cart;
    return Scaffold(
        appBar: AppBar(
          title: const Center(
              child: Text(
            'My cart',
            style: TextStyle(fontSize: 20),
          )),
        ),
        body: ListView.builder(
            itemCount: cart.length,
            itemBuilder: (context, index) {
              final cartItem = cart[index];
              return ListTile(
                leading: CircleAvatar(
                  backgroundImage: AssetImage(cartItem['imageUrl'] as String),
                  radius: 30,
                  // backgroundColor:Colors.yellow,
                ),
                trailing: IconButton(
                  onPressed: () {
                    showDialog(
                        //barrierDismissible:false,
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: const Text(
                              'Delete Product',
                              style: TextStyle(fontSize: 20),
                            ),
                            content:const  Text(
                                'Are you sure want to remove Product from cart ?'),
                            actions: [
                              TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: const Text(
                                    'No',
                                    style: TextStyle(
                                        color: Colors.blue,
                                        fontWeight: FontWeight.bold),
                                  )),
                              TextButton(
                                  onPressed: () {
                                    context
                                        .read<CartProvider>()
                                        .removeProduct(cartItem);
                                    Navigator.of(context).pop();
                                    // Provider.of<CartProvider>(context,
                                    //         listen: false)
                                    //     .removeProduct(cartItem);
                                  },
                                  child:const  Text(
                                    'Yes',
                                    style: TextStyle(
                                        color: Colors.red,
                                        fontWeight: FontWeight.bold),
                                  ))
                            ],
                          );
                        });
                  },
                  icon:const  Icon(Icons.delete),
                  color: Colors.red,
                ),
                title: Text(
                  cartItem['title'].toString(),
                  style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Italiana'),
                ),
                subtitle: Text(
                  'Size:${cartItem['size']}',
                  style:const TextStyle(fontSize: 15),
                ),
              );
            }));
  }
}
