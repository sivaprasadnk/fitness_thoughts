import 'package:fitness_thoughts/data/models/blog_model.dart';
import 'package:fitness_thoughts/data/repository/repository_impl.dart';

class GetRecentPosts {
  final RepositoryImpl repository;
  GetRecentPosts(this.repository);
  Future<List<BlogModel>> call(int count) async {
    return await repository.getRecentPosts(count);
  }
}
