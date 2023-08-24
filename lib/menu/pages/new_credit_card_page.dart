import 'package:comelec/common/widgets/app_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NewCreditCardPage extends StatelessWidget {
  NewCreditCardPage({super.key});

  final formKey = GlobalKey<FormState>();

  final creditCards = [
    {"image": "visa"},
    {"image": "mastercard"},
    {"image": "diners-club"},
    {"image": "american-express"},
    {"image": "discover"},
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
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  "Credit Card type",
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
                        children: creditCards
                            .map(
                              (creditCard) => Container(
                                margin: const EdgeInsets.only(right: 10),
                                child: InkWell(
                                  borderRadius: BorderRadius.circular(5),
                                  onTap: null,
                                  child: SizedBox(
                                    width: 70,
                                    height: 100,
                                    child: Image.asset(
                                      "assets/images/${creditCard['image']}.png",
                                    ),
                                  ),
                                ),
                              ),
                            )
                            .toList(),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  "Credit Card Number",
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
                  "Card Holder",
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
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "CVV",
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
                    const SizedBox(width: 40),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Date",
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
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
