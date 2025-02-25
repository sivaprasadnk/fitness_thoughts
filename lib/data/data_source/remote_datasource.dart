import 'package:fitness_thoughts/core/interceptor/dio_client.dart';
import 'package:fitness_thoughts/data/models/blog_model.dart';
import 'package:fitness_thoughts/data/models/system_config_model.dart';
import 'package:flutter/foundation.dart';
// import 'package:http/http.dart' as http;

abstract class RemoteDatasource {
  Future<List<BlogModel>> getPosts();
  Future<List<BlogModel>> getRecentPosts(int count);
  Future<BlogModel> getPostDetails(int id);
  Future<SystemConfig> getLatestVersion();
  Future<SystemConfig> getSystemConfig();
}

class RemoteDatasourceImpl extends RemoteDatasource {
final DioClient client;
  RemoteDatasourceImpl(this.client);
  @override
  Future<List<BlogModel>> getPosts() async {
    // var url = '${baseUrl}blogs';
    var url = kDebugMode ? 'blogs/dev' : "blogs";
    var response = await client.getRequest(url);

    var blogs = (response.data as List)
        .map((e) => BlogModel.fromJson(e))
        .toList();
        
    return blogs;
  }
  
  @override
  Future<SystemConfig> getLatestVersion() async {
    // var url = '${baseUrl}version';
    var response = await client.getRequest('version');
    // var list =
    //     (response.data as List)
    //     .map((e) => SystemConfig.fromJson(e))
    //     .toList();
    return SystemConfig.fromJson(response.data);
  }
  
  @override
  Future<BlogModel> getPostDetails(int id) async {
    // var url = '${baseUrl}blog/$id';
    var url = kDebugMode ? "blog/dev/$id" : "blog/$id";
    var response = await client.getRequest(url);
    return BlogModel.fromJson(response.data);
  }
  
  @override
  Future<List<BlogModel>> getRecentPosts(int count) async {
    var url = kDebugMode ? "blogs/dev/recent/$count" : "blogs/recent/$count";
    var response = await client.getRequest(url);
    var blogs = (response.data as List)
        .map((e) => BlogModel.fromJson(e))
        .toList();
    debugPrint("@@ blogs length :${blogs.length}");
    return blogs;
  }
  
  @override
  Future<SystemConfig> getSystemConfig() async {
    var response = await client.getRequest('version');
    // var list =
    //     (response.data as List)
    //     .map((e) => SystemConfig.fromJson(e))
    //     .toList();
    return SystemConfig.fromJson(response.data);
  }
}
