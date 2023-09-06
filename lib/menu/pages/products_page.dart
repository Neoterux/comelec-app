import 'package:comelec/bloc/item/item_bloc.dart';
import 'package:comelec/common/widgets/app_bar.dart';
import 'package:comelec/common/widgets/product_card_widget.dart';
import 'package:comelec/menu/pages/new_product_card_page.dart';
import 'package:comelec/repositories/item_respository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

class ProductsPage extends StatelessWidget {
  ProductsPage({super.key});

  late ItemBloc bloc;

  List<dynamic> products = [];

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ItemBloc(RepositoryProvider.of<ItemRepository>(_))
        ..add(const GetItems()),
      child: Scaffold(
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
              icon: const Icon(
                Icons.add,
                color: Colors.black,
              ),
            ),
          ],
        ),
        body: BlocBuilder<ItemBloc, ItemState>(
          builder: (context, state) {
            if (state is LoadedItem) {
              products = state.items;
              return Center(
                child: ListView.builder(
                  itemCount: products.length,
                  itemBuilder: (context, index) => ProductCardWidget(
                    image: products[index]['image'],
                    name: products[index]['name'],
                    unitPrice: products[index]['unit_price'],
                  ),
                ),
              );
            }
            return const Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}
