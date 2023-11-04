import 'package:get/get.dart';
import 'package:sqflite/sqflite.dart';
import 'package:todo/models/home_item_model.dart';

class SQLLifeService extends GetxService {
  late Database database;

  @override
  void onInit() async {
    database = await openDatabase(
      'todo.db',
      onConfigure: (db) async {
        await db.execute(
            '''create table if not exists todo (uuid text primary key, title text, description text, created_at text DEFAULT CURRENT_TIMESTAMP, status text)
            ''');
      },
    );
    super.onInit();
  }

  Future<List<Map>> query() async {
    return await database.rawQuery('select * from todo order by created_at desc');
  }

  void insert(HomeItemModel homeItemModel) async {
    await database.insert('todo', homeItemModel.toJson());
  }
}
