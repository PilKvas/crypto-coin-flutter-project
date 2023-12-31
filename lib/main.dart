import 'package:crypto_application/crypto_currencies_app.dart';
import 'package:crypto_application/features/crypto_list/bloc/cubit/theme_cubit.dart';
import 'package:crypto_application/repositories/crypto_coins/crypto_coins_interface.dart';
import 'package:crypto_application/repositories/crypto_coins/crypto_coins_repository.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

void main() async {
  GetIt.I.registerLazySingleton<CryptoCoinsInterface>(
    () => CryptoCoinsRepository(dio: Dio()),
  );
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ThemeCubit(),
        ),
      ],
      child: const CryptoCurrenciesApp(),
    ),
  );
}
