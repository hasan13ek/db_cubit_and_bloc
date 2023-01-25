import 'package:db_cubit_and_bloc/add_bloc/contact_bloc.dart';
import 'package:db_cubit_and_bloc/data/repositories/contact_repository.dart';
import 'package:db_cubit_and_bloc/delete_bloc/delete_bloc.dart';
import 'package:db_cubit_and_bloc/ui/add_screen.dart';
import 'package:db_cubit_and_bloc/ui/main_screen.dart';
import 'package:db_cubit_and_bloc/update_bloc/update_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(
      MultiRepositoryProvider(providers: [
        RepositoryProvider(create: (context)=>ContactRepository()),
      ], child: MultiBlocProvider(providers: [
        BlocProvider(create: (context)=>UpdateBloc(contactRepository: context.read<ContactRepository>())),
        BlocProvider(create: (context)=>DeleteBloc(contactRepository: context.read<ContactRepository>())),
        BlocProvider(create: (context)=>AddBloc(contactRepository: context.read<ContactRepository>()))
      ], child: MyApp()))

  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MainScreen(),
    );
  }
}


