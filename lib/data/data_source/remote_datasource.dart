import 'package:fitness_thoughts/core/common_strings.dart';
import 'package:fitness_thoughts/core/interceptor/dio_client.dart';
import 'package:fitness_thoughts/data/models/blog_model.dart';
import 'package:fitness_thoughts/data/models/version_model.dart';
// import 'package:http/http.dart' as http;

abstract class RemoteDatasource {
  Future<List<BlogModel>> getPosts();
  Future<BlogModel> getPostDetails(int id);
  Future<VersionModel> getLatestVersion();
}

class RemoteDatasourceImpl extends RemoteDatasource {
final DioClient client;
  RemoteDatasourceImpl(this.client);
  @override
  Future<List<BlogModel>> getPosts() async {
    var url = '${baseUrl}blogs';
    // client.interceptors.add(
    //   RetryOnConnectionChangeInterceptor(
    //     requestRetrier: DioConnectivityRequestRetrier(
    //       connectivity: locator<Connectivity>(),
    //       dio: locator<Dio>(),
    //     ),
    //   ),
    // );
    var response = await client.getRequest('blogs');

    var blogs = (response.data as List)
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
    // client.interceptors.add(
    //   RetryOnConnectionChangeInterceptor(
    //     requestRetrier: DioConnectivityRequestRetrier(
    //       connectivity: locator<Connectivity>(),
    //       dio: locator<Dio>(),
    //     ),
    //   ),
    // );
    var response = await client.getRequest('version');
    var list =
        (response.data as List)
        .map((e) => VersionModel.fromJson(e))
        .toList();
    return list.firstWhere((e) => e.isLatest!);
  }
  
  @override
  Future<BlogModel> getPostDetails(int id) async {
    // var url = '${baseUrl}blog/$id';
    var response = await client.getRequest('blog/$id');
    return BlogModel.fromJson(response.data);
  }
}
