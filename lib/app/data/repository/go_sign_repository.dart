import 'package:htds_mobile/app/data/model/authenticate_gosign_model.dart';


abstract class GoSignRepository {
  Future<AuthenticateGosignModel> authenticateClient();
  Future<AuthenticateGosignModel> authenticateUser(userId, token);
}
