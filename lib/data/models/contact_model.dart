const String tableName = "contact_app";

class ContactFields {
  static final List<String> values = [
    /// Add all fields
    id, name, number, date
  ];
  static const String id = "_id";
  static const String name = "name";
  static const String number = "number";
  static const String date = "date";
}

class ContactModel {
  final int? id;
  final String number;
  final String name;
  final String date;

  ContactModel(
      {this.id, required this.name, required this.date, required this.number});

  ContactModel copyWith(
      {int? id, String? name, String? number, String? date}) =>
      ContactModel(
          id: id ?? this.id,
          name: name ?? this.name,
          number: number ?? this.number,
          date: date ?? this.date);

  static ContactModel fromJson(Map<String, Object?> json) =>
      ContactModel(
          id: json[ContactFields.id] as int?,
          name: json[ContactFields.name] as String,
          number: json[ContactFields.number] as String,
          date: json[ContactFields.date] as String);

  Map<String, Object?> toJson() => {
    ContactFields.id: id,
    ContactFields.name: name,
    ContactFields.date: date,
    ContactFields.number: number
  };

  @override
  String toString() => '''
        ID: ${this.id} 
        USER NAME ${this.name} 
        SUMM ${this.number}
        DATE ${this.date}
      ''';
}
