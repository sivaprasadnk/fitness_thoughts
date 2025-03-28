// Mocks generated by Mockito 5.4.5 from annotations
// in fitness_thoughts/test/unit/mock_get_recent_posts.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i4;

import 'package:fitness_thoughts/data/models/blog_model.dart' as _i5;
import 'package:fitness_thoughts/data/repository/repository_impl.dart' as _i2;
import 'package:fitness_thoughts/domain/use_case/get_recent_posts.dart' as _i3;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: deprecated_member_use
// ignore_for_file: deprecated_member_use_from_same_package
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: must_be_immutable
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeRepositoryImpl_0 extends _i1.SmartFake
    implements _i2.RepositoryImpl {
  _FakeRepositoryImpl_0(Object parent, Invocation parentInvocation)
    : super(parent, parentInvocation);
}

/// A class which mocks [GetRecentPosts].
///
/// See the documentation for Mockito's code generation for more information.
class MockGetRecentPosts extends _i1.Mock implements _i3.GetRecentPosts {
  MockGetRecentPosts() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.RepositoryImpl get repository =>
      (super.noSuchMethod(
            Invocation.getter(#repository),
            returnValue: _FakeRepositoryImpl_0(
              this,
              Invocation.getter(#repository),
            ),
          )
          as _i2.RepositoryImpl);

  @override
  _i4.Future<List<_i5.BlogModel>> call(int? count) =>
      (super.noSuchMethod(
            Invocation.method(#call, [count]),
            returnValue: _i4.Future<List<_i5.BlogModel>>.value(
              <_i5.BlogModel>[],
            ),
          )
          as _i4.Future<List<_i5.BlogModel>>);
}
