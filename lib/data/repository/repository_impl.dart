import 'package:fitness_thoughts/data/data_source/remote_datasource.dart';
import 'package:fitness_thoughts/data/models/blog_model.dart';
import 'package:fitness_thoughts/data/models/version_model.dart';
import 'package:fitness_thoughts/domain/repository/repository.dart';
import 'package:flutter/material.dart';

class RepositoryImpl extends Repository {
  final RemoteDatasourceImpl remoteDatasource;
  RepositoryImpl(this.remoteDatasource);
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

  // @override
  // Future<BlogModel> getFeaturePost() async {
  //   return await remoteDatasource.getFeaturePost();
  // }
}
