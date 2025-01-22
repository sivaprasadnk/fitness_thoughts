import 'package:fitness_thoughts/data/models/blog_model.dart';
import 'package:fitness_thoughts/data/models/version_model.dart';
import 'package:sqflite/sqflite.dart';

abstract class Repository {
  Future<List<BlogModel>> getPosts();
  Future<VersionModel> getLatestVersion();
  Future<Database> openLocalDatabase();
}
