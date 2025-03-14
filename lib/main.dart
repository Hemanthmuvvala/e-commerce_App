
import 'package:ecom/cart/cart_provider.dart';
import 'package:ecom/homescreen.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create:(context)=>CartProvider(),
      child: MaterialApp(
        title: 'Ecom',
       
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 9, 104, 245)),
         // scaffoldBackgroundColor:const Color.fromARGB(255, 237, 222, 86),
          useMaterial3: true,
          fontFamily:'Satisy',
          inputDecorationTheme:const InputDecorationTheme(
            prefixIconColor: Color.fromRGBO(119, 119, 119, 1)
          ),
        textTheme:const TextTheme(
          titleLarge:TextStyle(
                  fontFamily: 'Satisfy',
                  fontWeight: FontWeight.w900,
                  fontSize: 28,
                  color: Colors.black,
                  //
                ),
          titleMedium:TextStyle(
            fontSize:20,
            fontWeight:FontWeight.bold,
          )
        )
        ),
        debugShowCheckedModeBanner:false,
        
        home:const Homescreen(),
      ),
    );
  }
}

