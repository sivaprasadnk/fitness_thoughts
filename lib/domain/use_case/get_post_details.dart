import 'package:fitness_thoughts/data/models/blog_model.dart';
import 'package:fitness_thoughts/data/repository/repository_impl.dart';

class GetPostDetails {
  final RepositoryImpl repository;
  GetPostDetails(this.repository);

  Future<BlogModel> call(int id) async {
    return await repository.getPostDetails(id);
  }
}
