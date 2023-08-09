import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:htds_mobile/app/data/model/authenticate_gosign_model.dart';
import 'package:htds_mobile/app/data/remote/go_sign_data_source.dart';

import '/app/core/base/base_remote_source.dart';
import '/app/data/model/github_project_search_response.dart';

class GoSignRemoteDataSourceImpl extends BaseRemoteSource
    implements GoSignRemoteDataSource {
  @override
  Future<AuthenticateGosignModel> authenticateClient(
      String clientId, String clientSecret, String grantType) {
    var endpoint =
        "https://remotesigning.viettel.vn:8773/vtss/service/ras/v1/authenticate";
    var dioCall = Dio().post(
      endpoint,
      data: {
        'client_id': clientId,
        'client_secret': clientSecret,
        'grant_type': grantType
      },
      options: Options(
          contentType: Headers.formUrlEncodedContentType,
      ),
    );

    try {
      return callApiWithErrorParser(dioCall)
          .then((response) => _parseAuthenticateGosignResponse(response));
    } catch (e) {
      rethrow;
    }
  }


  AuthenticateGosignModel _parseAuthenticateGosignResponse(Response<dynamic> response) {
    return AuthenticateGosignModel.fromJson(response.data);
  }

  @override
  Future<AuthenticateGosignModel> authenticateUser(userId, token) {
    var endpoint =
        "https://remotesigning.viettel.vn:8773/vtss/service/ras/v1/user/enrol";
    var dioCall = Dio().post(
      endpoint,
      data: {
        'user_id': userId
      },
      options: Options(
        contentType: Headers.jsonContentType,
        headers: {
          "Authorization": "Bearer $token"
        }
      ),
    );

    try {
      return callApiWithErrorParser(dioCall)
          .then((response) => _parseAuthenticateGosignResponse(response));
    } catch (e) {
      rethrow;
    }
  }

}
