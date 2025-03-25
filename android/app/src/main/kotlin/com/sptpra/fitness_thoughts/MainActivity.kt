package com.sptpra.fitness_thoughts

import android.os.Bundle
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel
import android.content.pm.PackageManager
import android.content.pm.PackageInfo

class MainActivity: FlutterActivity(){
    private val CHANNEL = "app_version"

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setupMethodChannel()
    }

    private fun setupMethodChannel() {
        MethodChannel(flutterEngine!!.dartExecutor.binaryMessenger, CHANNEL).setMethodCallHandler { call, result ->
            if (call.method == "getVersion") {
                result.success(getVersion())
            } else {
                result.notImplemented()
            }
        }
    }

    private fun getVersion(): String {
        return try {
            val packageInfo: PackageInfo = packageManager.getPackageInfo(packageName, 0)
            val versionName = packageInfo.versionName
            val versionCode = packageInfo.longVersionCode
            "v$versionName+$versionCode"
        } catch (e: PackageManager.NameNotFoundException) {
            "vUnknown+0"
        }
    }
}
