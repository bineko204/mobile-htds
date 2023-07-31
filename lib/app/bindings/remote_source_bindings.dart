import 'package:get/get.dart';
import 'package:htds_mobile/app/data/remote/go_sign_data_source.dart';
import 'package:htds_mobile/app/data/remote/go_sign_data_source_impl.dart';

import '/app/data/remote/github_remote_data_source.dart';
import '/app/data/remote/github_remote_data_source_impl.dart';

class RemoteSourceBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<GithubRemoteDataSource>(
      () => GithubRemoteDataSourceImpl(),
      tag: (GithubRemoteDataSource).toString(),
    );
    Get.lazyPut<GoSignRemoteDataSource>(
          () => GoSignRemoteDataSourceImpl(),
      tag: (GoSignRemoteDataSource).toString(),
    );
  }
}
