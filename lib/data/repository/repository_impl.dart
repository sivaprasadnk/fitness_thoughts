import 'package:fitness_thoughts/data/data_source/remote_datasource.dart';
import 'package:fitness_thoughts/data/models/blog_model.dart';
import 'package:fitness_thoughts/domain/repository/repository.dart';

class RepositoryImpl extends Repository {
  final RemoteDatasourceImpl remoteDatasource;
  RepositoryImpl(this.remoteDatasource);
  @override
  Future<List<BlogModel>> getPosts() async {
    var response = await remoteDatasource.getPosts();
    return response;
  }

  // @override
  // Future<BlogModel> getFeaturePost() async {
  //   return await remoteDatasource.getFeaturePost();
  // }
}
