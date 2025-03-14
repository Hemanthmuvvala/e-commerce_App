import 'package:ecom/cart/cart_page.dart';
import 'package:ecom/products/product_list.dart';
import 'package:ecom/profile.dart';
import 'package:flutter/material.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  int currentPage = 0; //page behaviour
  //This is used for the navigation through the bottomnavigationbar
  List<Widget> pages =  [ProductList(), CartPage(), Profile()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.yellow,
        leading: PopupMenuButton<String>(
          icon: const Icon(
            Icons.menu,
            color: Color.fromARGB(255, 9, 104, 245),
          ),
          onSelected: (value) {},
          itemBuilder: (BuildContext context) => [
            const PopupMenuItem(value: "profile", child: Text("Profile")),
            const PopupMenuItem(value: "settings", child: Text("Settings")),
            const PopupMenuItem(value: "logout", child: Text("Logout")),
          ],
        ),
        title: const Center(
          child: Text(
            'KiranaaShop',
            style: TextStyle(
              fontFamily: 'Italiana',
              fontWeight: FontWeight.w900,
              fontSize: 29,
              color: Color.fromARGB(255, 9, 104, 245),
            ),
          ),
        ),
      ),
      body: IndexedStack(
        index: currentPage,
        children: pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
          onTap: (value) {
            setState(() {
              currentPage = value;
            });
          },
          iconSize:25,
          currentIndex: currentPage,
          items: const [
            BottomNavigationBarItem(
              
              icon: Icon(
                Icons.home,
              ),
              //  activeIcon:Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.trolley,
              ),
              label: 'cart',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.account_circle),
              label: 'profile',
            )
          ]),
    );
  }
}
