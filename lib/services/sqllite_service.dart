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
            '''create table if not exists todo (uuid text primary key, title text, description text, created_at text DEFAULT CURRENT_TIMESTAMP, status text, image_path text)
            ''');
      },
    );
    super.onInit();
  }

  Future<List<Map>> query() async {
    return await database.rawQuery('select * from todo order by created_at desc');
  }

  Future<List<Map>> querySort(String sortField) async {
    String sql = 'select * from todo order by $sortField';
    print(sql);
    return await database.rawQuery(sql);
  }

  Future<List<Map>> queryTitleAndDescription(String keyword) async {
    String sql = '''select *
    from todo
    where title like "%${keyword}%" or description like "%${keyword}%"
    ''';
    print(sql);
    return await database.rawQuery(sql);
  }

  void insert(HomeItemModel homeItemModel) async {
    await database.insert('todo', homeItemModel.toJson());
  }
}
