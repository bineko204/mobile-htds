package com.example.htds_mobile

import androidx.annotation.NonNull
import com.viettel.biometrics.signature.helpers.GoSignSDK
import com.viettel.biometrics.signature.helpers.GoSignSDKSetup
import com.viettel.biometrics.signature.listener.ServiceApiListener
import com.viettel.biometrics.signature.listener.ServiceApiListenerEmpty
import com.viettel.biometrics.signature.network.request.PendingAuthorisationRequest
import com.viettel.biometrics.signature.network.response.CertificateResponse
import com.viettel.biometrics.signature.network.response.ResponseError
import com.viettel.biometrics.signature.ultils.BiometricApiType
import io.flutter.embedding.android.FlutterFragmentActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel


class MainActivity : FlutterFragmentActivity() {
    private val CHANNEL = "go.sign.sdk.chanel"
    override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        GoSignSDKSetup.initialize(application, "https://remotesigning.viettel.vn:8773", "Xác thực")
        MethodChannel(
            flutterEngine.dartExecutor.binaryMessenger,
            CHANNEL
        ).setMethodCallHandler { call, result ->
            val token = call.argument<String>("token")
            if (call.method == "registerDevice") {
                GoSignSDK.get().registerDevice(
                    this,
                    token,
                    BiometricApiType.AUTO,
                    object : ServiceApiListener<CertificateResponse?> {
                        override fun onSuccess(data: CertificateResponse?) {
                            result.success(data)
                        }

                        override fun showLoading() {
                        }

                        override fun hideLoading() {
                        }

                        override fun onFail(error: ResponseError) {
                            result.error(
                                error.errorType.toString(),
                                error.errorMessage,
                                error.toString()
                            )
                        }
                    })
            }
            if (call.method == "authorisationPendingRequest") {
                val request: PendingAuthorisationRequest = PendingAuthorisationRequest()
                request.request = call.argument("request")
                request.hashAlgorithm = call.argument("hashAlgorithm")
                request.transactionID = call.argument("transactionID")
                GoSignSDK.get().authorisationPendingRequest(this,
                    token, request, BiometricApiType.AUTO, object : ServiceApiListenerEmpty {
                        override fun onSuccess() {
                            result.success("success")
                        }

                        override fun showLoading() {
                            TODO("Not yet implemented")
                        }

                        override fun hideLoading() {
                            TODO("Not yet implemented")
                        }

                        override fun onFail(error: ResponseError) {
                            result.error(
                                error.errorType.toString(),
                                error.errorMessage,
                                error.toString()
                            )
                        }
                    })
            }
        }
    }


}
