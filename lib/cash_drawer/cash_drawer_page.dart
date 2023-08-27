import 'package:comelec/common/widgets/app_bar.dart';
import 'package:comelec/menu/pages/new_credit_card_page.dart';
import 'package:comelec/menu/pages/shopping_cart_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CashDrawerPage extends StatelessWidget {
  const CashDrawerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
        title: "Cash Drawer Page",
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart, color: Colors.black26,),
            tooltip: "Shopping Cart",
            onPressed: () => Get.to(() => const ShoppingCartPage()),
          )
        ],
      ),
      body: Center(
        child: Text("Cash Drawer Page"),
      ),
    );
  }
}
