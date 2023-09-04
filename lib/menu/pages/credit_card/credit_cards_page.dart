import 'package:comelec/bloc/credit_card/credit_card_bloc.dart';
import 'package:comelec/common/widgets/app_bar.dart';
import 'package:comelec/common/widgets/credit_card_widget.dart';
import 'package:comelec/menu/pages/credit_card/new_credit_card_page.dart';
import 'package:comelec/repositories/credit_card_respository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

class CreditCardPage extends StatefulWidget {
  CreditCardPage({super.key});

  @override
  State<CreditCardPage> createState() => _CreditCardPageState();
}

class _CreditCardPageState extends State<CreditCardPage> {
  final cards = [
    {
      "bin": "1234",
      "name": "Jairo",
      "ccType": 1,
    }
  ];

  List<dynamic> creditCards = [];

  late CreditCardBloc bloc;

  @override
  Widget build(BuildContext context) {
    bloc = context.read<CreditCardBloc>();

    return BlocProvider(
      create: (_) =>
          CreditCardBloc(RepositoryProvider.of<CreditCardRepository>(_))
            ..add(const GetCreditCards()),
      child: Scaffold(
        appBar: AppBarWidget(
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
            onPressed: () => Get.back(),
          ),
          title: "Credit Cards",
          actions: [
            IconButton(
              onPressed: () => Get.to(() => NewCreditCardPage()),
              icon: const Icon(
                Icons.add_card,
                color: Colors.black,
              ),
            ),
          ],
        ),
        body: BlocBuilder<CreditCardBloc, CreditCardState>(
          builder: (context, state) {
            if (state is LoadedCreditCard) {
              creditCards = state.creditCards;
              return Center(
                child: ListView.builder(
                  itemCount: creditCards.length,
                  itemBuilder: (context, index) => CreditCardWidget(
                      bin: creditCards[index]['number']!,
                      name: creditCards[index]['nickname']!,
                      ccType: creditCards[index]['active']!,
                      onDelete: () =>
                          _onDeleteCc(creditCards[index]['card_id'], index)),
                ),
              );
            }
            return const Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }

  _onDeleteCc(id, index) {
    setState(() {
      creditCards.removeAt(index);
    });
    bloc.add(DeleteCreditCard(id));
  }
}
