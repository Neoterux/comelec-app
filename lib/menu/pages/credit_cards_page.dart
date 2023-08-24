import 'package:comelec/common/widgets/app_bar.dart';
import 'package:comelec/common/widgets/credit_card_widget.dart';
import 'package:comelec/menu/pages/new_credit_card_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CreditCardPage extends StatelessWidget {
  CreditCardPage({super.key});

  final cards = [
    {
      "bin": "1234",
      "name": "Jairo",
      "ccType": "visa",
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
        title: "Credit Cards",
        actions: [
          IconButton(
            onPressed: () => Get.to(() => NewCreditCardPage()),
            icon: Icon(
              Icons.add_card,
              color: Colors.black,
            ),
          ),
        ],
      ),
      body: Center(
        child: ListView.builder(
          itemCount: cards.length,
          itemBuilder: (context, index) => CreditCardWidget(
            bin: cards[index]['bin']!,
            name: cards[index]['name']!,
            ccType: cards[index]['ccType']!,
          ),
        ),
      ),
    );
  }
}
