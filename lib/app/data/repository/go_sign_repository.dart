import 'package:htds_mobile/app/data/model/authenticate_gosign_model.dart';

import '/app/core/model/github_search_query_param.dart';
import '/app/data/model/github_project_search_response.dart';

abstract class GoSignRepository {
  Future<AuthenticateGosignModel> authenticate();
}
