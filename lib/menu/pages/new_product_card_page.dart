import 'package:comelec/common/widgets/app_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NewProductCardPage extends StatelessWidget {
  NewProductCardPage({super.key});

  final formKey = GlobalKey<FormState>();

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
        title: "New Credit Card",
        actions: const [
          IconButton(
            onPressed: null,
            icon: Icon(
              Icons.save,
              color: Colors.black,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Product Name",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                TextFormField(
                  controller: null,
                  validator: null,
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  "Product Image",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                SizedBox(
                  height: 50,
                  width: MediaQuery.of(context).size.width,
                  child: Center(
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children:[
                              Container(
                                margin: const EdgeInsets.only(right: 10),
                                child: InkWell(
                                  borderRadius: BorderRadius.circular(5),
                                  onTap: null,
                                  child: SizedBox(
                                    width: 150,
                                    height: 150,
                                    child: Image.asset(
                                      "assets/images/product-placeholder.png",
                                    ),
                                  ),
                                ),
                              ),
                        ]
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  "Description",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                TextFormField(
                  controller: null,
                  validator: null,
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  "Units",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                TextFormField(
                  controller: null,
                  validator: null,
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  "Price per Unit",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                TextFormField(
                  controller: null,
                  validator: null,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
