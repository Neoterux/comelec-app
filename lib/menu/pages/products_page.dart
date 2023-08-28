import 'package:comelec/common/widgets/app_bar.dart';
import 'package:comelec/common/widgets/product_card_widget.dart';
import 'package:comelec/menu/pages/new_product_card_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductsPage extends StatelessWidget {
  ProductsPage({super.key});

  final products = [
    {
      "image": "https://www.recetasnestle.com.ec/sites/default/files/inline-images/tipos-de-manzana-royal-gala.jpg",
      "name": "Apple",
      "unit_price": "0.75",
    },
    {
      "image": "",
      "name": "Pear",
      "unit_price": "1.00",
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () => Get.back(),
        ),
        title: "Products",
        actions: [
          IconButton(
            onPressed: () => Get.to(() => NewProductCardPage()),
            icon: Icon(
              Icons.add,
              color: Colors.black,
            ),
          ),
        ],
      ),
      body: Center(
        child: ListView.builder(
          itemCount: products.length,
          itemBuilder: (context, index) => ProductCardWidget(
            image: products[index]['image']!,
            name: products[index]['name']!,
            unitPrice: products[index]['unit_price']!,
          ),
        ),
      ),
    );
  }
}
