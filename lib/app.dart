import 'package:comelec/bloc/credit_card/credit_card_bloc.dart';
import 'package:comelec/repositories/credit_card_respository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

import 'package:comelec/common/pages/bottom_nav_bar_page.dart';

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  final _creditCardRepository = CreditCardRepository();

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<CreditCardRepository>(
          create: (context) => _creditCardRepository,
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
              create: (context) => CreditCardBloc(_creditCardRepository)),
        ],
        child: GetMaterialApp(
          initialRoute: "/",
          debugShowCheckedModeBanner: false,
          builder: (context, child) => Material(child: child),
          routes: {
            "/": (ctx) => const BottomNavBarPage(),
          },
        ),
      ),
    );
  }
}
