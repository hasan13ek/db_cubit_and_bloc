import 'package:db_cubit_and_bloc/data/repositories/contact_repository.dart';
import 'package:db_cubit_and_bloc/delete_bloc/delete_event.dart';
import 'package:db_cubit_and_bloc/delete_bloc/delete_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DeleteBloc extends Bloc<DeleteEvent,ContactDeleteState>{
  DeleteBloc({required this.contactRepository}):super(InitialStateDelete()){
  on<DeleteById>(_deleteById);
  }
  final ContactRepository contactRepository;


  _deleteById(DeleteById event, Emitter<ContactDeleteState> emitter){

    emitter(LoadInProgressDelete());
    contactRepository.deleteContactById(id: event.id);
  }

}