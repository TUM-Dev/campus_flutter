package de.tum.`in`.tumcampus

import android.annotation.SuppressLint
import android.content.Context
import android.content.pm.ActivityInfo
import android.os.Bundle
import io.flutter.embedding.android.FlutterActivity


class MainActivity : FlutterActivity() {
    @SuppressLint("SourceLockedOrientationActivity")
    override fun onCreate(savedInstanceState: Bundle?) {
        if (isPhone(this)) {
            requestedOrientation = ActivityInfo.SCREEN_ORIENTATION_PORTRAIT
        }

        super.onCreate(savedInstanceState)
    }
}

fun isPhone(context: Context): Boolean {
    val resources = context.resources
    val configuration = resources.configuration
    val screenWidthDp = configuration.smallestScreenWidthDp
    return screenWidthDp <= resources.getInteger(R.integer.min_tablet_width_dp)
}