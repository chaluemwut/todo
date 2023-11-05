import 'package:get/get.dart';
import 'package:sqflite/sqflite.dart';
import 'package:todo/models/home_item_model.dart';

class SQLLifeService extends GetxService {
  Database? database;

  @override
  void onInit() async {
    await initDb();
    super.onInit();
  }

  Future<void> initDb() async {
    database = await openDatabase(
      'todo.db',
      onConfigure: (db) async {
        await db.execute(
            '''create table if not exists todo (uuid text primary key, title text, description text, created_at text DEFAULT CURRENT_TIMESTAMP, status text, image_path text)
            ''');
      },
    );
  }

  Future<List<Map>> query() async {
    if (database == null) {
      await initDb();
    }
    return await database!
        .rawQuery('select * from todo order by created_at desc');
  }

  Future<List<Map>> querySort(String sortField) async {
    if (database == null) {
      await initDb();
    }
    String sql = 'select * from todo order by $sortField';
    print(sql);
    return await database!.rawQuery(sql);
  }

  Future<List<Map>> queryTitleAndDescription(String keyword) async {
    if (database == null) {
      await initDb();
    }
    String sql = '''select *
    from todo
    where title like "%$keyword%" or description like "%$keyword%"
    ''';
    print(sql);
    return await database!.rawQuery(sql);
  }

  void insert(HomeItemModel homeItemModel) async {
    if (database == null) {
      await initDb();
    }
    await database!.insert('todo', homeItemModel.toJson());
  }

  void update(HomeItemModel homeItemModel) async {
    if (database == null) {
      await initDb();
    }
    await database!.update('todo', homeItemModel.toJson(),
        where: 'uuid=?', whereArgs: [homeItemModel.uuid]);
  }
}
