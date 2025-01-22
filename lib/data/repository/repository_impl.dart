import 'package:fitness_thoughts/data/data_source/local_datasource.dart';
import 'package:fitness_thoughts/data/data_source/remote_datasource.dart';
import 'package:fitness_thoughts/data/models/blog_model.dart';
import 'package:fitness_thoughts/data/models/version_model.dart';
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
  Future<VersionModel> getLatestVersion() async {
    try {
      return await remoteDatasource.getLatestVersion();
    } catch (err) {
      debugPrint("## error :$err");
      return VersionModel(
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

  // @override
  // Future<BlogModel> getFeaturePost() async {
  //   return await remoteDatasource.getFeaturePost();
  // }
}
