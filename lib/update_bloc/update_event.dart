import 'package:db_cubit_and_bloc/data/models/contact_model.dart';

abstract class UpdateEvent{}

class Update extends UpdateEvent{
  Update({required this.contactModel});
  final ContactModel contactModel;
}