import 'package:comelec/common/widgets/app_bar.dart';
import 'package:comelec/menu/pages/credit_card/credit_cards_page.dart';
import 'package:comelec/menu/pages/products_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MenuPage extends StatelessWidget {
  const MenuPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget(
        title: "Menu Page",
        actions: [
          IconButton(
            onPressed: null,
            icon: Icon(
              Icons.shopping_cart,
            ),
          )
        ],
      ),
      body: Container(
        margin: EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            width: 1.5,
            color: Colors.grey.shade300,
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: ListTile.divideTiles(
            context: context,
            tiles: [
              ListTile(
                leading: Icon(Icons.production_quantity_limits),
                title: Text("Products"),
                trailing: Icon(Icons.arrow_forward_ios_rounded),
                onTap: () => Get.to(
                      () => ProductsPage(),
                  transition: Transition.downToUp,
                ),
              ),
              ListTile(
                leading: Icon(Icons.credit_card),
                title: Text("Credit Cards"),
                trailing: Icon(Icons.arrow_forward_ios_rounded),
                onTap: () => Get.to(
                  () => CreditCardPage(),
                  transition: Transition.downToUp,
                ),
              ),
            ],
          ).toList(),
        ),
      ),
    );
  }
}
