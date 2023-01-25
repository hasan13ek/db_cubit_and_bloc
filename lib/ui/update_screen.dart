import 'package:db_cubit_and_bloc/add_bloc/contact_bloc.dart';
import 'package:db_cubit_and_bloc/add_bloc/contact_event.dart';
import 'package:db_cubit_and_bloc/data/models/contact_model.dart';
import 'package:db_cubit_and_bloc/ui/widgets/textfield.dart';
import 'package:db_cubit_and_bloc/update_bloc/update_bloc.dart';
import 'package:db_cubit_and_bloc/update_bloc/update_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

TextEditingController nameController = TextEditingController();
TextEditingController phoneNumberController = TextEditingController();

class UpdatePage extends StatefulWidget {
  UpdatePage({super.key, required this.id});
  final int id;

  @override
  State<UpdatePage> createState() => _UpdatePageState();
}

class _UpdatePageState extends State<UpdatePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: const Text(
          'Update Contact',
          style: TextStyle(color: Colors.black, fontSize: 24),
        ),
      ),
      body: Column(
        children: [
          TextfieldWidget(
            word: 'Name',
            textController: nameController,
          ),
          TextfieldWidget(
            word: 'Phone number',
            textController: phoneNumberController,
          ),
          ElevatedButton(
            onPressed: () {
              BlocProvider.of<UpdateBloc>(context).add(Update(
                  contactModel: ContactModel(
                      name: nameController.text,
                      date: DateTime.now().toString(),
                      number: phoneNumberController.text,
                      id: widget.id)));

              Navigator.pop(context);
            },
            child: const Text(
              'Update contact',
              style: TextStyle(fontSize: 18),
            ),
          )
        ],
      ),
    );
  }
}
