import 'package:dio/dio.dart';
import 'package:fitness_thoughts/core/common_strings.dart';
import 'package:fitness_thoughts/data/models/blog_model.dart';
import 'package:fitness_thoughts/data/models/version_model.dart';
import 'package:flutter/material.dart';

abstract class RemoteDatasource {
  Future<List<BlogModel>> getPosts();
  Future<VersionModel> getLatestVersion();
  // Future<BlogModel> getFeaturePost();
}

class RemoteDatasourceImpl extends RemoteDatasource {
  Dio dio = Dio();

  @override
  Future<List<BlogModel>> getPosts() async {
    var url = '${baseUrl}blogs';
    var response = await dio.getUri(Uri.parse(url));
    // var json = response.data;

    var blogs = (response.data as List)
        .map((e) => BlogModel.fromJson(e))
        .toList()
        .where((blog) => blog.isActive!)
        .toList();

    // debugPrint("## data :$list");
    // var blogs = (list as List)
    //     .map((e) => BlogModel.fromJson(e))
    //     .toList()
    //     .where((blog) => blog.isActive == "Y")
    //     .toList();
    debugPrint("## blogs length :${blogs.length}");
    return blogs;
  }
  
  @override
  Future<VersionModel> getLatestVersion() async {
    var url = '${baseUrl}version';
    var response = await dio.getUri(Uri.parse(url));
    debugPrint("version response :${response.data}");
    var list =
        (response.data as List).map((e) => VersionModel.fromJson(e)).toList();
    return list.firstWhere((e) => e.isLatest!);
  }

  // @override
  // Future<BlogModel> getFeaturePost() async {
  //   var url = '${baseUrl}featured-post';
  //   var response = await dio.getUri(Uri.parse(url));
  //   return BlogModel.fromJson(response.data['data']);
  // }
}
