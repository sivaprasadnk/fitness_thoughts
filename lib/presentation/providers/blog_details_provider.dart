import 'package:fitness_thoughts/core/locator.dart';
import 'package:fitness_thoughts/domain/use_case/get_post_details.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final blogDetailsProvider = FutureProvider.family((ref, int blogId) async {
  return await locator<GetPostDetails>().call(blogId.toInt());
});
