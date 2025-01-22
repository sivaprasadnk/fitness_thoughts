import 'package:fitness_thoughts/data/repository/repository_impl.dart';
import 'package:sqflite/sqflite.dart';

class OpenLocaldb {
  final RepositoryImpl repository;
  OpenLocaldb(this.repository);
  Future<Database> call() async {
    return await repository.openLocalDatabase();
  }
}
