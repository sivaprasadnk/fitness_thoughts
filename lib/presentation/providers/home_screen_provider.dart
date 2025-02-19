import 'package:fitness_thoughts/core/locator.dart';
import 'package:fitness_thoughts/data/models/blog_model.dart';
import 'package:fitness_thoughts/domain/use_case/get_recent_posts.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreenNotifier extends StateNotifier<AsyncValue<List<BlogModel>>> {
  HomeScreenNotifier() : super(const AsyncValue.loading());

  Future<void> loadBlogs() async {
    try {
      final blogs = await locator<GetRecentPosts>().call(5);
      state = AsyncValue.data(blogs);
    } catch (e) {
      state = AsyncValue.error(e, StackTrace.current);
    }
  }
}

// Provider for Home Screen Data
final homeScreenProvider =
    StateNotifierProvider<HomeScreenNotifier, AsyncValue<List<BlogModel>>>(
        (ref) {
  return HomeScreenNotifier();
});
