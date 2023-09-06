import 'package:comelec/common/widgets/app_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:comelec/bloc/item/item_bloc.dart';

class EditProductCardPage extends StatefulWidget {

  int item_id = 0;
  String name = "";
  String description = "";
  int unit_price = 0;
  int unit = 0;
  int active = 0;

  EditProductCardPage(int id, String nameA, String descriptionA, int unit_priceA, int unitA, int activeA){
    item_id = id;
    name  = nameA;
    description = descriptionA;
    unit_price = unit_priceA;
    unit = unitA;
    active = activeA;
    super.key;
  }

  @override
  State<EditProductCardPage> createState() => _EditProductCardPageState(item_id, name, description, unit_price, unit, active);
}

class _EditProductCardPageState extends State<EditProductCardPage> {
  final formKey = GlobalKey<FormState>();
  late ItemBloc bloc;
  int? _ccSelected;

  int item_id = 0;
  var body = {
    "item_id": 0,
    "name": "",
    "shortname": "",
    "description": "",
    "unit_price": 0,
    "unit": 0,
    "active": 1
  };

  _EditProductCardPageState(int id, String name, String description, int unit_price, int unit, int active){
    item_id = id;
    body['name'] = body['shortname']  = name;
    body['description'] = description;
    body['unit_price'] = unit_price;
    body['unit'] = unit;
    body['active'] = active;
  }



  @override
  void initState() {
    super.initState();
    bloc = context.read<ItemBloc>();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () => Get.close(2),
        ),
        title: "Edit Product",
        actions: [
          IconButton(
            onPressed: () => bloc.add(UpdateItem(body, item_id)),
            icon: const Icon(
              Icons.save,
              color: Colors.black,
            ),
          ),
          IconButton(
            onPressed: () => bloc.add(DeleteItem(item_id)),
            icon: const Icon(
              Icons.delete,
              color: Colors.red,
            ),
          ),
        ],
      ),
      body: BlocListener<ItemBloc, ItemState>(
        listener: (context, state) {
          late SnackBar snackBar = const SnackBar(
            content: LinearProgressIndicator(),
          );
          if (state is LoadingItem) {
            snackBar = const SnackBar(
              content: LinearProgressIndicator(),
            );
          }
          if (state is CreatedItem) {
            snackBar = SnackBar(
              content: Text(state.message['message']),
              action: SnackBarAction(
                label: 'Cerrar',
                onPressed: () => Get.close(2),
              ),
            );
          }
          if (state is ErrorItem) {
            snackBar = const SnackBar(
              content: Text("Error al guardar el item"),
            );
          }
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        },
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    "Product Name",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  TextFormField(onChanged: (value) => {body['name'] = body['shortname']  = value},
                      initialValue: body['name'].toString()),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    "Description",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  TextFormField(onChanged: (value) => body['description'] = value,
                      initialValue: body['description'].toString()),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Units",
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            TextFormField(
                                onChanged: (value) => body['unit'] = int.parse(value),
                                initialValue: body['unit'].toString()),
                          ],
                        ),
                      ),
                      const SizedBox(width: 40),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Price per Unit",
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            TextFormField(
                                onChanged: (value) =>
                                body['unit_price'] = int.parse(value),
                                initialValue: body['unit_price'].toString()),
                          ],
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
