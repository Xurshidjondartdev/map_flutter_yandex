package com.example.map_flutter_yandex

import io.flutter.embedding.android.FlutterActivity
import android.app.Application
import com.yandex.mapkit.MapKitFactory
import androidx.annotation.NonNull
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugins.GeneratedPluginRegistrant

class MainActivity: FlutterActivity() {
    override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
        MapKitFactory.setApiKey("43db56d1-69d0-4020-b65d-f2c8e2f02d5b")
        super.configureFlutterEngine(flutterEngine)
    }
}
