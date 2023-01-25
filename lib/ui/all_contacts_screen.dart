import 'package:db_cubit_and_bloc/data/repositories/contact_repository.dart';
import 'package:db_cubit_and_bloc/delete_bloc/delete_bloc.dart';
import 'package:db_cubit_and_bloc/delete_bloc/delete_event.dart';
import 'package:db_cubit_and_bloc/get_cubit/get_cubit.dart';
import 'package:db_cubit_and_bloc/get_cubit/get_state.dart';
import 'package:db_cubit_and_bloc/ui/update_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AllContactsPage extends StatefulWidget {
  const AllContactsPage({Key? key}) : super(key: key);

  @override
  State<AllContactsPage> createState() => _AllContactsPageState();
}

class _AllContactsPageState extends State<AllContactsPage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) =>
            GetCubit(contactRepository: context.read<ContactRepository>()),
        child: BlocBuilder<GetCubit, ContactFetchState>(
          builder: (context, state) {
            return Scaffold(
              appBar: AppBar(
                title: const Text("All contacts"),
              ),
              body: state is LoadInProgressFetch
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : state is LoadInSuccessFetch
                      ? Container(
                width: double.infinity,
                        height: double.infinity,
                        child: Expanded(
                          child: ListView.builder(
                            shrinkWrap: true,
                            physics: const BouncingScrollPhysics(),
                            itemCount: state.contacts.length,
                            itemBuilder: (context, index) {
                              return Container(
                                margin: const EdgeInsets.only(
                                  top: 15,
                                  bottom: 15,
                                  left: 20,
                                  right: 20,
                                ),
                                padding: const EdgeInsets.all(20),
                                height: 200,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: Colors.blue,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.start,
                                  crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          state.contacts[index].name
                                              .toString(),
                                          style: const TextStyle(
                                            fontSize: 22,
                                            color: Colors.white,
                                          ),
                                        ),
                                        const Spacer(),
                                      ],
                                    ),
                                    const SizedBox(height: 16),
                                    Text(
                                      state.contacts[index].number
                                          .toString(),
                                      style: const TextStyle(
                                        fontSize: 16,
                                        color: Colors.white,
                                      ),
                                    ),
                                    const SizedBox(height: 16),
                                    Row(
                                      children: [
                                        Text(
                                          state.contacts[index].date.replaceRange(15, 25, ''),
                                          style: const TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.w400,
                                            color: Colors.white,
                                          ),
                                        ),

                                        IconButton(onPressed: (){
                                          var id = state.contacts[index].id;
                                          Navigator.push(context, MaterialPageRoute(builder: (builder)=>UpdatePage(id:id!,)));
                                        }, icon: const Icon(Icons.update,color: Colors.red,)),
                                        IconButton(onPressed: (){
                                          var id = state.contacts[index].id;
                                          BlocProvider.of<DeleteBloc>(context).add(DeleteById(id: id!));
                                          setState(() {});

                                        }, icon: const Icon(Icons.delete,color: Colors.red,))


                                        // Image.asset('assets/images/bb.png')
                                      ],
                                    ),

                                  ],
                                ),
                              );
                            },
                          ),
                        ),
                      )
                      : const SizedBox(),
            );
          },
        ));
  }
}
