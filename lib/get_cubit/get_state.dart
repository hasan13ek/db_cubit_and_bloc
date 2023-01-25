//------------------------- Fetch  State --------------------------------//

import 'package:db_cubit_and_bloc/data/models/contact_model.dart';

abstract class ContactFetchState{}

class InitialStateFetch extends ContactFetchState{}
class LoadInProgressFetch extends ContactFetchState{}
class LoadInSuccessFetch extends ContactFetchState{
  LoadInSuccessFetch({required this.contacts});
  final List<ContactModel> contacts;
}
class LoadInFailureFetch extends ContactFetchState{}