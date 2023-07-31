import UIKit
import Flutter
import GoSignSDKLite

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
      initGoSDK()
    GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
    
    func initGoSDK() {
        API.host = "https://remotesigning.viettel.vn:8773"
        
        let controller : FlutterViewController = window?.rootViewController as! FlutterViewController
        let goSignChannel = FlutterMethodChannel(name: "go.sign.sdk.chanel", binaryMessenger: controller.binaryMessenger)
        
        goSignChannel.setMethodCallHandler({(call: FlutterMethodCall, result: @escaping FlutterResult) -> Void in
            if (call.method == "registerDevice") {
                let arguments = call.arguments as? [String: String]
                guard let authenToken = arguments?["token"] else {
                    result(false)
                    return
                }
                
                API.registerDevice(authenToken: authenToken) { response in
                    switch response {
                        case .success:
                            result("success")
                        case .failure(let error):
                            print("\(error)")
                            result("fail")
                    }
                }
            } else if(call.method == "authorisationPendingRequest") {
                let arguments = call.arguments as? [String: String]
                
                guard let authenToken = arguments?["token"], let request = arguments?["request"], let hashAlgorithm = arguments?["hashAlgorithm"], let transactionID = arguments?["transactionID"] else {
                    result(false)
                    return
                }
                
                let pendingAuthorisationAPIResponse: GoSignSDKLite.PendingAuthorisationAPIResponse = GoSignSDKLite.PendingAuthorisationAPIResponse(
                transactionID: transactionID, request: request, hashAlgorithm: hashAlgorithm)
                
                API.authoriseaPendingRequest(authenToken: authenToken, pendingAuthorisationAPIResponse: pendingAuthorisationAPIResponse) { response in
                    switch response {
                        case .success:
                            result("success")
                        case .failure(let error):
                            print("\(error)")
                            result("fail")
                        }
                }
                
            }
        })
    }
}
