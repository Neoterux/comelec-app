import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:comelec/menu/pages/edit_product_card_page.dart';
import 'package:get/get.dart';

class ProductCardWidget extends StatelessWidget {
  final String? image;
  final String name;
  final String unitPrice;
  final String unit;
  final String description;
  final String active;
  final int item_id;
  const ProductCardWidget({
    super.key,
    required this.image,
    required this.name,
    required this.unitPrice,
    required this.unit,
    required this.description,
    required this.active,
    required this.item_id,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: SizedBox(
        width: 70,
        height: 100,
        child: image == null
            ? Image.asset("assets/images/product-placeholder.png")
            : CachedNetworkImage(
                imageUrl: image!,
                progressIndicatorBuilder: (context, url, downloadProgress) =>
                    CircularProgressIndicator(value: downloadProgress.progress),
                errorWidget: (context, url, error) =>
                    Image.asset("assets/images/product-placeholder.png"),
              ),
      ),
      title: Text(name),
      subtitle: Text("\$ " + unitPrice),
      trailing:  IconButton(
        onPressed: () => Get.to(() => EditProductCardPage(item_id,name,description,double.parse(unitPrice).toInt(),double.parse(unit).toInt(),int.parse(active)) ),
        icon: Icon(
          Icons.edit,
          color: Colors.green,
        ),
      ),
    );
  }
}
