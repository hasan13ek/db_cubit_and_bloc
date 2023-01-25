import 'package:db_cubit_and_bloc/ui/add_screen.dart';
import 'package:db_cubit_and_bloc/ui/all_contacts_screen.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Text("Main Screen"),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 88.0,left: 150),
        child: Column(
          children: [
            TextButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (_)=>const AddContactsPage()));
            }, child: const Text("Add Screen")),
            TextButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (_)=>const AllContactsPage()));
            }, child: const Text("All Contacts ")),
            // TextButton(onPressed: (){
            //   Navigator.push(context, MaterialPageRoute(builder: (_)=>const UsersCardsPage1()));
            // }, child: const Text("Bloc")),
            // TextButton(onPressed: (){
            //   Navigator.push(context, MaterialPageRoute(builder: (_)=>const UsersCardsPage3()));
            // }, child: const Text("Single Bloc")),
          ],
        ),
      ),
    );
  }
}
