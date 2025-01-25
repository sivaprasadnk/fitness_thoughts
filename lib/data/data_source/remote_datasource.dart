// import 'package:dio/dio.dart';
import 'dart:convert';

import 'package:fitness_thoughts/core/common_strings.dart';
import 'package:fitness_thoughts/data/models/blog_model.dart';
import 'package:fitness_thoughts/data/models/version_model.dart';
import 'package:http/http.dart' as http;

abstract class RemoteDatasource {
  Future<List<BlogModel>> getPosts();
  Future<VersionModel> getLatestVersion();
  // Future<BlogModel> getFeaturePost();
}

class RemoteDatasourceImpl extends RemoteDatasource {
final http.Client client;
  RemoteDatasourceImpl(this.client);
  @override
  Future<List<BlogModel>> getPosts() async {
    var url = '${baseUrl}blogs';
    var response = await client.get(Uri.parse(url));

    var blogs = (jsonDecode(response.body) as List)
        .map((e) => BlogModel.fromJson(e))
        .toList()
        .where((blog) => blog.isActive!)
        .toList();
    blogs.sort((a, b) => a.id!.compareTo(b.id!));    
    return blogs;
  }
  
  @override
  Future<VersionModel> getLatestVersion() async {
    var url = '${baseUrl}version';
    var response = await client.get(Uri.parse(url));
    var list =
        (jsonDecode(response.body) as List)
        .map((e) => VersionModel.fromJson(e))
        .toList();

    return list.firstWhere((e) => e.isLatest!);
  }

}
