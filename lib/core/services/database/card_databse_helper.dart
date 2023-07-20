import 'package:basic_ecommerce_app_with_getx/model/card_product_model.dart';
import 'package:basic_ecommerce_app_with_getx/tools/constance.dart';
import 'package:sqflite/sqflite.dart';

class CardDataBaseHelper {
  CardDataBaseHelper._();
  static final CardDataBaseHelper db = CardDataBaseHelper._();

  static Database? _database;
  Future<Database?> get database async {
    if (_database != null) return _database;
    _database = await initDB();
    return _database;
  }

  Future<List<CardProductModel>> getAllPruoducts() async {
    var dbClient = await database;
    List<Map> maps = await dbClient!.query(tabelCartProduct);
    List<CardProductModel> list = maps.isNotEmpty
        ? maps.map((e) => CardProductModel.fromJson(e)).toList()
        : [];
    return list;
  }

  initDB() async {
    String path = await getDatabasesPath();
    return await openDatabase(
      path + 'card.db',
      version: 1,
      onCreate: (Database db, int version) async {
        await db.execute('''
        CREATE TABLE $tabelCartProduct (
          $columnName TEXT NOT NULL,
          $columnImage TEXT NOT NULL,
          $columnPrice TEXT NOT NULL,
          $columnQuantity INTEGER NOT NULL

        )
        ''');
      },
    );
  }
}
