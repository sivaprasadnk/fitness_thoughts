import 'package:fitness_thoughts/data/data_source/local_datasource.dart';
import 'package:fitness_thoughts/data/data_source/remote_datasource.dart';
import 'package:fitness_thoughts/data/models/blog_model.dart';
import 'package:fitness_thoughts/data/models/system_config_model.dart';
import 'package:fitness_thoughts/domain/repository/repository.dart';
import 'package:flutter/material.dart';
import 'package:sqflite_common/sqlite_api.dart';

class RepositoryImpl extends Repository {
  final RemoteDatasourceImpl remoteDatasource;
  final LocalDatasourceImpl localDatasource;
  RepositoryImpl(this.remoteDatasource, this.localDatasource);
  @override
  Future<List<BlogModel>> getPosts() async {
    try {
      return await remoteDatasource.getPosts();
    } catch (err) {
      return [];
    }
  }

  @override
  Future<SystemConfig> getSystemConfig(String token) async {
    try {
      return await remoteDatasource.getSystemConfig(token);
    } catch (err) {
      return SystemConfig(
        id: 0,
        versionNumber: 100,
        buildNumber: 1,
        isLatest: true,
      );
    }
  }

  @override
  Future<Database> openLocalDatabase() async {
    return await localDatasource.openLocalDatabase();
  }
  
  @override
  Future<BlogModel> getPostDetails(int id) async {
    return await remoteDatasource.getPostDetails(id);
  }
  
  @override
  Future<List<BlogModel>> getRecentPosts(int count) async {
    try {
      return await remoteDatasource.getRecentPosts(count);
    } catch (err) {
      debugPrint("error @getRecentPosts :$err");
      return [];
    }
  }
}
