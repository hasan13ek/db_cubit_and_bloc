import 'package:db_cubit_and_bloc/data/models/contact_model.dart';
import 'package:db_cubit_and_bloc/data/repositories/contact_repository.dart';
import 'package:db_cubit_and_bloc/get_cubit/get_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GetCubit extends Cubit<ContactFetchState>{
  GetCubit({required this.contactRepository}):super(InitialStateFetch()){
    _fetchAllContacts();
  }

  final ContactRepository contactRepository;

  _fetchAllContacts(){
    emit(LoadInProgressFetch());
    contactRepository.getAllContacts().asStream().listen((List<ContactModel> contacts) {
      emit(LoadInSuccessFetch(contacts: contacts));
    });
  }
}