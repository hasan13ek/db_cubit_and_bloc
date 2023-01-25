import 'package:db_cubit_and_bloc/add_bloc/contact_bloc.dart';
import 'package:db_cubit_and_bloc/add_bloc/contact_event.dart';
import 'package:db_cubit_and_bloc/ui/widgets/textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

TextEditingController nameController = TextEditingController();
TextEditingController phoneNumberController = TextEditingController();

class AddContactsPage extends StatelessWidget {
  const AddContactsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: const Text(
          'Add Contact',
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
              BlocProvider.of<AddBloc>(context).add(UpdateAdd(
                  name: nameController.text,
                  number: phoneNumberController.text,
                  date: DateTime.now().toString()));

              BlocProvider.of<AddBloc>(context).add(AddContact());
              Navigator.pop(context);
            },
            child: const Text(
              'Add contact',
              style: TextStyle(fontSize: 18),
            ),
          )
        ],
      ),
    );
  }
}
