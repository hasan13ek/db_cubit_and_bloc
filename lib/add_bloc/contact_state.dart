import 'package:db_cubit_and_bloc/data/models/contact_model.dart';
import 'package:equatable/equatable.dart';

class AddState extends Equatable {
  final ContactModel contactModel;

  const AddState({required this.contactModel});

  AddState copyWith({ContactModel? contactModel}) =>
      AddState(
        contactModel: contactModel ?? this.contactModel,
      );

  @override
  List<Object?> get props => [contactModel];
}
