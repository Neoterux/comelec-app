import 'package:comelec/common/widgets/app_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ShoppingCartPage extends StatefulWidget {
  const ShoppingCartPage({super.key});

  @override
  State<ShoppingCartPage> createState() => _ShoppingCartPageState();
}

class _ShoppingCartPageState extends State<ShoppingCartPage> {
  final cartContent = [
    {
      "item_id": null,
      "description": 'Item test 1',
      "unit_price": 2.3,
      "quantity": 10,
      "something": "Value",
      "image_url": '',
    },
    {
      "item_id": null,
      "description": 'Notebook 15"',
      "unit_price": 654.45,
      "quantity": 2,
      "something": "Value",
      "image_url": '',
    },
    {
      "item_id": null,
      "description": 'Mechanical Keyboard',
      "unit_price": 78.54,
      "quantity": 3,
      "something": "Value",
      "image_url": '',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Get.back(),
        ),
        title: "Shopping Cart",
      ),
      body: Stack(
        children: [
          Center(
            child: ListView.builder(
              itemCount: cartContent.length,
              itemBuilder: (ctx, index) => ShoppingCartItem(
                itemName: cartContent[index]['description'].toString(),
                itemQuantity:
                    int.parse(cartContent[index]['quantity'].toString()),
                itemUnitPrice: (cartContent[index]['unit_price']) as double,
              ),
            ),
          ),
          Align(
              alignment: Alignment.bottomCenter,
              child: ElevatedButton.icon(
                onPressed: () => {},
                icon: const Icon(Icons.account_balance_wallet),
                label: const Text("Proceed With Checkout"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black87,
                  elevation: 10,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(100.0)
                  )
                ),
              ),
              /*IconButton(
                onPressed: null,
                icon: Icon(Icons.account_balance_wallet)
            ),*/
              )
        ],
      ),
    );
  }
}

class ShoppingCartItem extends StatelessWidget {
  final String itemName;
  final int itemQuantity;
  final double itemUnitPrice;
  final TextEditingController _controller = TextEditingController();

  ShoppingCartItem(
      {super.key,
      required this.itemName,
      required this.itemQuantity,
      required this.itemUnitPrice}) {
    _controller.text = "$itemQuantity";
  }

  double getPrice() {
    return itemQuantity * itemUnitPrice;
  }

  void validateAndSubmit(String value) {
    // TODO: Validate the given value and make the magic to return of submit
  }

  void changeQuantityValue(dynamic value) {
    // TODO: Set the value of the quantity calculating with `value`
  }

  @override
  Widget build(BuildContext context) {
    return Card(
        child: ListTile(
      leading: SizedBox(
        width: 50,
        height: 100,
        child: Image.asset("assets/images/no-image.jpg"),
      ),
      title: Text(itemName),
      subtitle: Text(
          "Price: \$ ${((getPrice() * 1.12) * 100).roundToDouble() / 100}"),
      trailing: ConstrainedBox(
        constraints: const BoxConstraints(minWidth: 120, maxWidth: 140),
        child: IntrinsicWidth(
          child: TextField(
            keyboardType: TextInputType.number,
            textAlign: TextAlign.center,
            textAlignVertical: TextAlignVertical.center,
            controller: _controller,
            onSubmitted: validateAndSubmit,
            decoration: InputDecoration(
                contentPadding: EdgeInsets.zero,
                border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0))),
                prefixIcon: IconButton(
                  icon: const Icon(Icons.remove),
                  onPressed: () => changeQuantityValue(-1.0),
                  iconSize: 16.0,
                ),
                suffixIcon: IconButton(
                  icon: const Icon(Icons.add),
                  onPressed: () => changeQuantityValue(1.0),
                  iconSize: 16.0,
                )),
          ),
        ),
      ),
    ));
  }
}
