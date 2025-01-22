import 'package:fitness_thoughts/data/models/blog_model.dart';

abstract class Repository {
  Future<List<BlogModel>> getPosts();
  // Future<BlogModel> getFeaturePost();
}
