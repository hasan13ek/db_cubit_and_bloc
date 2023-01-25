abstract class AddEvent {}

class UpdateAdd extends AddEvent {
  UpdateAdd({
    required this.name,
    required this.number,
    required this.date
  });

  final String name;
  final String number;
  final String date;
}

class AddContact extends AddEvent {}
