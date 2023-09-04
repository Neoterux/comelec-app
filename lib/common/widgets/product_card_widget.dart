import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class ProductCardWidget extends StatelessWidget {
  final String image;
  final String name;
  final String unitPrice;
  const ProductCardWidget({
    super.key,
    required this.image,
    required this.name,
    required this.unitPrice,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: SizedBox(
        width: 70,
        height: 100,
        child: image == ""
            ? Image.asset("assets/images/product-placeholder.png")
            : CachedNetworkImage(
                imageUrl: image,
                progressIndicatorBuilder: (context, url, downloadProgress) =>
                    CircularProgressIndicator(value: downloadProgress.progress),
                errorWidget: (context, url, error) =>
                    Image.asset("assets/images/product-placeholder.png"),
              ),
      ),
      title: Text(name),
      subtitle: Text("\$ " + unitPrice),
      trailing: const IconButton(
        icon: Icon(
          Icons.edit,
          color: Colors.green,
        ),
        onPressed: null,
      ),
    );
  }
}
