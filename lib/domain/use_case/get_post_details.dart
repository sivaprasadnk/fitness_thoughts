import 'package:fitness_thoughts/data/models/blog_model.dart';
import 'package:fitness_thoughts/data/repository/repository_impl.dart';
import 'package:flutter/material.dart';

class GetPostDetails {
  final RepositoryImpl repository;
  GetPostDetails(this.repository);

  Future<BlogModel> call(int id) async {
    debugPrint("GetPostDetails call");
    return await repository.getPostDetails(id);
  }
}
