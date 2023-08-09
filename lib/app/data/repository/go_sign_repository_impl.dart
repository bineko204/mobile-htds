import 'package:get/get.dart';
import 'package:htds_mobile/app/data/model/authenticate_gosign_model.dart';
import 'package:htds_mobile/app/data/remote/go_sign_data_source.dart';
import 'package:htds_mobile/app/data/repository/go_sign_repository.dart';

import '/app/core/model/github_search_query_param.dart';
import '/app/data/model/github_project_search_response.dart';
import '/app/data/remote/github_remote_data_source.dart';
import '/app/data/repository/github_repository.dart';

class GoSignRepositoryImpl implements GoSignRepository {
  final GoSignRemoteDataSource _remoteSource =
      Get.find(tag: (GoSignRemoteDataSource).toString());


  @override
  Future<AuthenticateGosignModel> authenticateClient() {
    return _remoteSource.authenticateClient("samples_test_client", "205640fd6ea8c7d80bb91c630b52d286d21ee511", "client_credentials");
  }

  @override
  Future<AuthenticateGosignModel> authenticateUser(userId, token) {
    return _remoteSource.authenticateUser(userId, token);
  }
}
