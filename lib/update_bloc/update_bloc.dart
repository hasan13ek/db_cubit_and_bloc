import 'package:db_cubit_and_bloc/data/repositories/contact_repository.dart';
import 'package:db_cubit_and_bloc/update_bloc/update_event.dart';
import 'package:db_cubit_and_bloc/update_bloc/update_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UpdateBloc extends Bloc<UpdateEvent, ContactUpdateState> {
  UpdateBloc({required this.contactRepository})
      : super(InitialState()) {
    on<Update>(_update);
  }

  final ContactRepository contactRepository;

  _update(Update event, Emitter<ContactUpdateState> emitter){

    emitter(LoadInProgress());
    contactRepository.updateContacts(contactModel: event.contactModel);
  }

}
