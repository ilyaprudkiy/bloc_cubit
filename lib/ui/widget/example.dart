import 'package:bloc_cubit/domain/bloc/users_bloc.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Example extends StatelessWidget {
  const Example({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [TitleWidget(), IncrementWidget(), DecrementWidget()],
      )),
    );
  }
}

class TitleWidget extends StatelessWidget {
  const TitleWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<UserCubit>();
    return StreamBuilder<UserState>(
        stream: cubit.stream,
        initialData: cubit.state,
        builder: (context, snapshot) {
          final age = snapshot.requireData.currentUser.age;
          return Text('$age');
        });
  }
}

class DecrementWidget extends StatelessWidget {
  const DecrementWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<UserCubit>();
    return TextButton(
        style: TextButton.styleFrom(
            foregroundColor: Colors.white, backgroundColor: Colors.blue),
        onPressed: bloc.decrement,
        child: const Text(
          '-',
          style: TextStyle(color: Colors.white),
        ));
  }
}

class IncrementWidget extends StatelessWidget {
  const IncrementWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<UserCubit>();
    return TextButton(
        style: TextButton.styleFrom(
            foregroundColor: Colors.white, backgroundColor: Colors.blue),
        onPressed: bloc.increment,
        child: const Text(
          '+',
          style: TextStyle(color: Colors.white),
        ));
  }
}
