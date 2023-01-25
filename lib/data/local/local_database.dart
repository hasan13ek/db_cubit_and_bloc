import 'package:db_cubit_and_bloc/data/models/contact_model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';


class LocalDatabase {
  static final LocalDatabase getInstance = LocalDatabase._init();
  static Database? _database;

  factory LocalDatabase() {
    return getInstance;
  }

  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    } else {
      _database = await _initDB("contact.db");
      return _database!;
    }
  }

  Future<Database> _initDB(String dbName) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, dbName);
    return await openDatabase(path, version: 1, onCreate: (db, ver) async {
      String idType = "INTEGER PRIMARY KEY AUTOINCREMENT";
      String textType = "TEXT";
      String intType = "INTEGER";
      String boolType = "INTEGER";

      await db.execute('''
    CREATE TABLE $tableName (
    ${ContactFields.id} $idType,
    ${ContactFields.name} $textType,
    ${ContactFields.number} $textType,
    ${ContactFields.date} $textType
    )
    ''');
    });
  }

  LocalDatabase._init();

  static Future<ContactModel> addContact({required
      ContactModel contactModel}) async {
    final db = await getInstance.database;
    final id = await db.insert(tableName, contactModel.toJson());
    return contactModel.copyWith(id: id);
  }

  static Future<List<ContactModel>> getAllContacts() async {
    final db = await getInstance.database;
    final result =
    await db.query(tableName, columns: ContactFields.values);
    return result.map((json) => ContactModel.fromJson(json)).toList();
  }

  static Future<int> deleteAllContacts() async {
    final db = await getInstance.database;
    return await db.delete(tableName);
  }

  static Future<int> deleteContactById(int id) async {
    final db = await getInstance.database;
    var t = await db
        .delete(tableName, where: "${ContactFields.id}=?", whereArgs: [id]);
    if (t > 0) {
      return t;
    } else {
      return -1;
    }
  }


  static Future<ContactModel> updateCachedUser(ContactModel contactModel) async {
    Map<String, dynamic> col = {
      ContactFields.date: contactModel.date,
      ContactFields.name: contactModel.name,
      ContactFields.number: contactModel.number,
    };

    final db = await getInstance.database;
    int id =  await db.update(
      tableName,
      col,
      where: '${ContactFields.id} = ?',
      whereArgs: [contactModel.id],
    );
    // print("HAMMASI YAXSHI${cachedUser.summ}");
    // print("HAMMASI YAXSHI ID${cachedUser.id}");
    return contactModel.copyWith(id: id);
  }

  static Future close() async {
    final db = await getInstance.database;
    db.close();
  }
}
