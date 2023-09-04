import 'package:comelec/bloc/credit_card/credit_card_bloc.dart';
import 'package:comelec/common/widgets/app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

class NewCreditCardPage extends StatefulWidget {
  const NewCreditCardPage({super.key});

  @override
  State<NewCreditCardPage> createState() => _NewCreditCardPageState();
}

class _NewCreditCardPageState extends State<NewCreditCardPage> {
  final formKey = GlobalKey<FormState>();
  late CreditCardBloc bloc;
  int? _ccSelected;

  final creditCards = [
    {"image": "visa", "value": 0},
    {"image": "mastercard", "value": 1},
    {"image": "diners-club", "value": 2},
    {"image": "american-express", "value": 3},
    {"image": "discover", "value": 4},
  ];

  var body = {
    "number": "",
    "nickname": "",
    "expiration_date": "",
    "ccv": "",
    "active": 0
  };

  @override
  void initState() {
    super.initState();
    bloc = context.read<CreditCardBloc>();
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
            onPressed: () => bloc.add(CreateCreditCard(body)),
            icon: const Icon(
              Icons.save,
              color: Colors.black,
            ),
          ),
        ],
      ),
      body: BlocListener<CreditCardBloc, CreditCardState>(
        listener: (context, state) {
          late SnackBar snackBar;
          if (state is LoadingCreditCard) {
            snackBar = const SnackBar(
              content: LinearProgressIndicator(),
            );
          }
          if (state is CreatedCreditCard) {
            snackBar = SnackBar(
              content: Text(state.message['message']),
              action: SnackBarAction(
                label: 'Cerrar',
                onPressed: () => Get.close(2),
              ),
            );
          }
          if (state is ErrorCreditCard) {
            snackBar = const SnackBar(
              content: Text("Error al guardar la tarjeta"),
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
                                    onTap: () => setState(() {
                                      _ccSelected = creditCard['value'] as int;
                                      body['active'] = _ccSelected!;
                                    }),
                                    child: Container(
                                      decoration: _ccSelected != null &&
                                              _ccSelected == creditCard['value']
                                          ? BoxDecoration(
                                              border: Border.all(
                                                color: Colors.green,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                            )
                                          : null,
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
                  TextFormField(onChanged: (value) => body['number'] = value),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    "Card Holder",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  TextFormField(onChanged: (value) => body['nickname'] = value),
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
                                onChanged: (value) => body['ccv'] = value),
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
                                onChanged: (value) =>
                                    body['expiration_date'] = value),
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
