import 'package:fitness_thoughts/data/models/blog_model.dart';
import 'package:fitness_thoughts/data/models/version_model.dart';
import 'package:sqflite/sqflite.dart';

abstract class Repository {
  Future<List<BlogModel>> getPosts();
  Future<List<BlogModel>> getRecentPosts(int count);
  Future<BlogModel> getPostDetails(int id);
  Future<VersionModel> getLatestVersion();
  Future<Database> openLocalDatabase();
}
