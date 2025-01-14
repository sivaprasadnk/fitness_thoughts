import 'package:fitness_thoughts/data/models/blog_model.dart';
import 'package:fitness_thoughts/data/repository/repository_impl.dart';

class GetFeaturedPost {
  final RepositoryImpl repository;
  GetFeaturedPost(this.repository);
  Future<BlogModel> call() async {
    return await repository.getFeaturePost();
  }
}
