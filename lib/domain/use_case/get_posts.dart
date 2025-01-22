import 'package:fitness_thoughts/data/models/blog_model.dart';
import 'package:fitness_thoughts/data/repository/repository_impl.dart';

class GetPosts {
  final RepositoryImpl repository;
  GetPosts(this.repository);
  Future<List<BlogModel>> call() async {
    return await repository.getPosts();
  }
}
