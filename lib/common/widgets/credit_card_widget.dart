import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CreditCardWidget extends StatelessWidget {
  final String bin;
  final String name;
  final String ccType;
  const CreditCardWidget({
    super.key,
    required this.bin,
    required this.name,
    required this.ccType,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: SizedBox(
        width: 70,
        height: 100,
        child: Image.asset("assets/images/$ccType.png"),
      ),
      title: Text("... $bin"),
      subtitle: Text(name),
      trailing: const IconButton(
        icon: Icon(
          Icons.delete,
          color: Colors.red,
        ),
        onPressed: null,
      ),
    );
  }
}
