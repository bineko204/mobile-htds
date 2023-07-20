import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

const platform = MethodChannel('go.sign.sdk.chanel');

class GoSdkChanel {
  static Future registerDevice(String token) async {
    final res = await platform.invokeMethod("registerDevice", {"token": token});
    debugPrint(res);
  }

  static Future authorisationPendingRequest(String token, String request,
      String hashAlgorithm, String transactionID) async {
    final res = await platform
        .invokeMethod("authorisationPendingRequest", {
      "token": token,
      "request": request,
      "hashAlgorithm": hashAlgorithm,
      "transactionID": transactionID,
    });
    debugPrint(res);
  }
}