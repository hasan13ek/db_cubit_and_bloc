import 'package:db_cubit_and_bloc/data/local/local_database.dart';
import 'package:db_cubit_and_bloc/data/models/contact_model.dart';

class ContactRepository {
  Future<int> deleteAllContacts() => LocalDatabase.deleteAllContacts();

  Future<int> deleteContactById({required int id}) => LocalDatabase.deleteContactById(id);

  Future<ContactModel> addContact({required ContactModel contactModel}) =>
      LocalDatabase.addContact(contactModel: contactModel);

  Future<List<ContactModel>> getAllContacts() => LocalDatabase.getAllContacts();

  Future<ContactModel> updateContacts({required ContactModel contactModel}) =>
      LocalDatabase.updateCachedUser(contactModel);
  
  
}
