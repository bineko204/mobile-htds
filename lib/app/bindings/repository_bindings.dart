import 'package:get/get.dart';
import 'package:htds_mobile/app/data/repository/go_sign_repository.dart';
import 'package:htds_mobile/app/data/repository/go_sign_repository_impl.dart';

import '/app/data/repository/github_repository.dart';
import '/app/data/repository/github_repository_impl.dart';

class RepositoryBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<GithubRepository>(
      () => GithubRepositoryImpl(),
      tag: (GithubRepository).toString(),
    );
    Get.lazyPut<GoSignRepository>(
          () => GoSignRepositoryImpl(),
      tag: (GoSignRepository).toString(),
    );
  }
}
