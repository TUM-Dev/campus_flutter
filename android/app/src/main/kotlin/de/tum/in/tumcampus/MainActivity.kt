package de.tum.`in`.tumcampus

import android.app.Activity
import android.annotation.SuppressLint
import android.content.Context
import android.content.pm.ActivityInfo
import android.os.Bundle
import de.tum.`in`.tumcampus.util.AddContact
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.embedding.engine.plugins.activity.ActivityAware
import io.flutter.embedding.engine.plugins.activity.ActivityPluginBinding
import io.flutter.plugin.common.MethodChannel


class MainActivity : FlutterActivity(), ActivityAware {
    @SuppressLint("SourceLockedOrientationActivity")
    override fun onCreate(savedInstanceState: Bundle?) {
        if (isPhone(this)) {
            requestedOrientation = ActivityInfo.SCREEN_ORIENTATION_PORTRAIT
        }

        super.onCreate(savedInstanceState)
    }
    
    private var activity: Activity? = null

    override fun onAttachedToActivity(binding: ActivityPluginBinding) {
        activity = binding.activity
    }

    override fun onDetachedFromActivityForConfigChanges() {
        activity = null
    }

    override fun onReattachedToActivityForConfigChanges(binding: ActivityPluginBinding) {
        activity = binding.activity
    }

    override fun onDetachedFromActivity() {
        activity = null
    }

    private val CHANNEL = "add_contact"

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine!!)
        MethodChannel(flutterEngine!!.dartExecutor.binaryMessenger, CHANNEL).setMethodCallHandler {
            call, result ->
                // This method is invoked on the main thread.
                println("Method call received: ${call.method}")
                if (call.method == "addPersonAsContact") {
                    println("Adding contact")
                    result.success(AddContact.addPersonAsContact(call.argument("contact"), this))
                }
        }
    }
}

fun isPhone(context: Context): Boolean {
    val resources = context.resources
    val configuration = resources.configuration
    val screenWidthDp = configuration.screenWidthDp
    return screenWidthDp <= resources.getDimension(R.dimen.min_tablet_width_dp)
}