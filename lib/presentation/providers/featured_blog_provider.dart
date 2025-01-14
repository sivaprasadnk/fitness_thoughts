import 'package:fitness_thoughts/core/locator.dart';
import 'package:fitness_thoughts/domain/use_case/get_featured_post.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

var featuredBlogProvider = FutureProvider((ref) async {
  return await locator<GetFeaturedPost>().call();
});
