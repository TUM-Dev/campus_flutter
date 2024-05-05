package de.tum.`in`.tumcampus

import android.annotation.SuppressLint
import android.content.Context
import android.content.pm.ActivityInfo
import android.os.Bundle
import io.flutter.embedding.android.FlutterActivity


class MainActivity : FlutterActivity() {
    @SuppressLint("SourceLockedOrientationActivity")
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)

        requestedOrientation = if (isTablet(this)) {
            ActivityInfo.SCREEN_ORIENTATION_UNSPECIFIED
        } else {
            ActivityInfo.SCREEN_ORIENTATION_PORTRAIT
        }
    }
}

fun isTablet(context: Context): Boolean {
    val resources = context.resources
    val configuration = resources.configuration
    val screenWidthDp = configuration.screenWidthDp
    return screenWidthDp >= resources.getDimension(R.dimen.min_tablet_width_dp)
}