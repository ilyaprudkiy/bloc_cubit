import 'package:bloc_cubit/domain/bloc/users_bloc.dart';
import 'package:bloc_cubit/ui/widget/example.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Provider<UserCubit>(
      create: (_) => UserCubit(),
      child: const Example(),
      dispose: (context, value) => value.close(),
    ));
  }
}
