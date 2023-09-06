import 'package:comelec/common/widgets/app_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:comelec/bloc/item/item_bloc.dart';

class NewProductCardPage extends StatefulWidget {
  const NewProductCardPage({super.key});

  @override
  State<NewProductCardPage> createState() => _NewProductCardPageState();
}

class _NewProductCardPageState extends State<NewProductCardPage> {
  final formKey = GlobalKey<FormState>();
  late ItemBloc bloc;
  int? _ccSelected;

  var body = {
    "item_id": 0,
    "name": "",
    "shortname": "",
    "description": "",
    "unit_price": 0,
    "unit": 0,
    "active": 1
  };

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
        title: "New Credit Card",
        actions: [
          IconButton(
            onPressed: () => bloc.add(CreateItem(body)),
            icon: const Icon(
              Icons.save,
              color: Colors.black,
            ),
          ),
        ],
      ),
      body: BlocListener<ItemBloc, ItemState>(
        listener: (context, state) {
          late SnackBar snackBar;
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
                  TextFormField(onChanged: (value) => {body['name'] = body['shortname']  = value}),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    "Descripción",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  TextFormField(onChanged: (value) => body['description'] = value),
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
                                onChanged: (value) => body['unit'] = int.parse(value)),
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
                                body['unit_price'] = int.parse(value)),
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
