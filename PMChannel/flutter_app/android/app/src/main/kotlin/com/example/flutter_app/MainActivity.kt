package com.example.flutter_app


import android.os.BatteryManager
import android.os.Build
import androidx.annotation.RequiresApi
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel


class MainActivity : FlutterActivity() {
    private val channel = "by.soulsodev.flutter_app/battery_channel"

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, channel)
                .setMethodCallHandler { call: MethodCall, result: MethodChannel.Result ->
                    if (call.method == "getBatteryLevel") {
                        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.LOLLIPOP) {
                            result.success(batteryLevel)
                        } else {
                            result.success(call.argument<Any>("default_level"))
                        }
                    } else {
                        result.notImplemented()
                    }
                }
    }

    @get:RequiresApi(api = Build.VERSION_CODES.LOLLIPOP)
    val batteryLevel: Int
        get() {
            val batteryLevel: Int
            val manager = this.getSystemService(BATTERY_SERVICE) as BatteryManager
            batteryLevel = manager.getIntProperty(BatteryManager.BATTERY_PROPERTY_CAPACITY)
            return batteryLevel
        }
}
