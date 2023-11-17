import 'package:first_project_learningb/kernel/colors/colors_app.dart';
import 'package:first_project_learningb/modules/shop/adapters/screens/widgets/container_shop.dart';
import 'package:flutter/material.dart';

class Shop extends StatelessWidget {
  const Shop({super.key});

  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic> item = {
      'title': 'Samsung Galaxy S23 ULTRA', 'description':'Nuevo ¡Galaxy! S23 ULTRA, descubre todas sus funciones', 'initialRating':4.5, 'imageUri':'assets/images/logo-utez.png'
    };
    final Map<String, dynamic> item2 = {
      'title': 'iPhone 15 Pro Max', 'description':'Nuevo ¡IpHONE 15 PRO MAX! S23 ULTRA, descubre todas sus funciones', 'initialRating':4.5, 'imageUri':'assets/images/iphone15.jpg'
    };
    final Map<String, dynamic> item3 = {
      'title': 'XIAMI', 'description':'Nuevo ¡XIAOMI! S23 ULTRA, descubre todas sus funciones', 'initialRating':4.5, 'imageUri':'assets/images/iphone15.jpg'
    };
    final List items = [item, item2, item3];
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tienda'),
        backgroundColor: ColorsApp.primaryColor,
        foregroundColor: Colors.white,
        ),
        body: GridView.count(
          primary: false,
          padding: const EdgeInsets.all(8),
          crossAxisSpacing: 8,
          mainAxisSpacing: 10,
          crossAxisCount: 2,
          children: List.generate(items.length, (index){
            return ContainerShop( 
                title: items[index]['title'],
                description: items[index]['description'],
                initialRating: items[index]['initialRating'] ,
                imageUri: items[index]['imageUri']);
          })
        ),
      );
  }
  
}