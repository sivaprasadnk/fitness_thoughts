import 'package:fitness_thoughts/data/models/blog_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RecentBlogCubit extends Cubit<List<BlogModel>> {
  RecentBlogCubit() : super([]);

  void update(List<BlogModel> list) {
    emit(list);
  }
}
