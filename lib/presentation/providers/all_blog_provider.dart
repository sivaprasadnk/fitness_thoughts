import 'package:fitness_thoughts/core/locator.dart';
import 'package:fitness_thoughts/domain/use_case/get_posts.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final allBlogsProvider = FutureProvider((ref) async {
  return await locator<GetPosts>().call();
});

// class AllBlogNotifier extends StateNotifier<AsyncValue<List<BlogModel>>> {
//   AllBlogNotifier() : super(const AsyncValue.loading());

//   Future<void> loadBlogs() async {
//     try {
//       final blogs = await locator<GetRecentPosts>().call(5);
//       state = AsyncValue.data(blogs);
//     } catch (e) {
//       state = AsyncValue.error(e, StackTrace.current);
//     }
//   }
// }

// // Provider for Home Screen Data
// final allBlogProvider =
//     StateNotifierProvider<AllBlogNotifier, AsyncValue<List<BlogModel>>>((ref) {
//   return AllBlogNotifier();
// });
