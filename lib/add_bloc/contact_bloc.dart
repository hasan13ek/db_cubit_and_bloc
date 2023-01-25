import 'package:db_cubit_and_bloc/add_bloc/contact_event.dart';
import 'package:db_cubit_and_bloc/add_bloc/contact_state.dart';
import 'package:db_cubit_and_bloc/data/models/contact_model.dart';
import 'package:db_cubit_and_bloc/data/repositories/contact_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddBloc extends Bloc<AddEvent, AddState> {
  AddBloc({required this.contactRepository})
      : super(
          AddState(contactModel: ContactModel(name: "", date: "", number: "")),
        ) {
    on<UpdateAdd>(_updateAddScreen);
    on<AddContact>(_addContact);
  }

  final ContactRepository contactRepository;

  _updateAddScreen(UpdateAdd event, Emitter<AddState> emit) {
    ContactModel contactModel = state.contactModel
        .copyWith(date: event.date, name: event.name, number: event.number);
    emit(state.copyWith(contactModel: contactModel));
  }

  _addContact(AddContact event, Emitter<AddState> emit) {
    ContactModel contactModel = state.contactModel;
    contactRepository.addContact(contactModel: contactModel);
  }
}
