import 'package:comelec/common/widgets/app_bar.dart';
import 'package:flutter/material.dart';

class CashDrawerPage extends StatelessWidget {
  const CashDrawerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: AppBarWidget(
        title: "Cash Drawer Page",
        actions: [
          IconButton(
            onPressed: null,
            icon: Icon(
              Icons.shopping_cart,
            ),
          )
        ],
      ),
      body: Center(
        child: Text("Cash Drawer Page"),
      ),
    );
  }
}
