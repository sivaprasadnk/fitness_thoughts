import 'package:fitness_thoughts/data/models/blog_model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

abstract class LocalDatasource {
  Future<Database> openLocalDatabase();
  Future<void> insertBlogs(List<BlogModel> blogs);
  Future<List<BlogModel>> getBlogs();
}

class LocalDatasourceImpl extends LocalDatasource {
  @override
  Future<Database> openLocalDatabase() async {
    return await openDatabase(
      join(await getDatabasesPath(), 'blog_database.db'),
      // When the database is first created, create a table to store dogs.
      onCreate: (db, version) {
        // Run the CREATE TABLE statement on the database.
        return db.execute(
          'CREATE TABLE blogs(id INTEGER PRIMARY KEY, title TEXT, subTitle TEXT, content Text, dateString TEXT, imageAssetPath TEXT, imageNetworkPath TEXT,)',
        );
      },
      // Set the version. This executes the onCreate function and provides a
      // path to perform database upgrades and downgrades.
      version: 1,
    );
  }

  @override
  Future<void> insertBlogs(List<BlogModel> blogs) async {
    final db = await openLocalDatabase();

    for (var blog in blogs) {
      await db.insert(
        'blogs',
        blog.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    }
  }

  @override
  Future<List<BlogModel>> getBlogs() async {
    final db = await openLocalDatabase();

    final List<Map<String, Object?>> blogMaps = await db.query('blogs');

    return [
      for (final {
            'id': id as int,
            'title': title as String,
            'subTitle': subTitle as String,
            'content': content as String,
            'dateString': dateString as String,
          } in blogMaps)
        BlogModel(
          id: id,
          title: title,
          subTitle: subTitle,
          content: content,
          dateString: dateString,
        ),
    ];
  }
}
