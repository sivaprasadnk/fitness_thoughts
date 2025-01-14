import 'package:dio/dio.dart';
import 'package:fitness_thoughts/core/common_strings.dart';
import 'package:fitness_thoughts/data/models/blog_model.dart';
import 'package:flutter/material.dart';

abstract class RemoteDatasource {
  Future<List<BlogModel>> getRecentPosts();
  Future<BlogModel> getFeaturePost();
}

class RemoteDatasourceImpl extends RemoteDatasource {
  Dio dio = Dio();

  @override
  Future<List<BlogModel>> getRecentPosts() async {
    var url = '${baseUrl}recent-posts';
    var response = await dio.getUri(Uri.parse(url));
    var json = response.data;
    var list = json['data'];
    // debugPrint("## data :$list");
    var blogs = (list as List).map((e) => BlogModel.fromJson(e)).toList();
    debugPrint("## blogs length :${blogs.length}");
    return blogs;
  }

  @override
  Future<BlogModel> getFeaturePost() async {
    var url = '${baseUrl}featured-post';
    var response = await dio.getUri(Uri.parse(url));
    return BlogModel.fromJson(response.data['data']);
  }
}
