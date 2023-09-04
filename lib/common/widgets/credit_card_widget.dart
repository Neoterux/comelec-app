import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CreditCardWidget extends StatelessWidget {
  final String bin;
  final String name;
  final int ccType;
  final Function onDelete;
  static const List<String> ccTypes = [
    "visa",
    "mastercard",
    "diners-club",
    "american-express",
    "discover"
  ];

  const CreditCardWidget({
    super.key,
    required this.bin,
    required this.name,
    required this.ccType,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: SizedBox(
        width: 70,
        height: 100,
        child: Image.asset(
            "assets/images/${ccTypes[ccType > 4 ? 4 : ccType]}.png"),
      ),
      title: Text("... ${bin.substring(0, 5)}"),
      subtitle: Text(name),
      trailing: IconButton(
        icon: const Icon(
          Icons.delete,
          color: Colors.red,
        ),
        onPressed: () => onDelete(),
      ),
    );
  }
}
