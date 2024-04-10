package de.tum.`in`.tumcampus.util

import android.graphics.Color

fun argbToColor(argb: Long): Int {
    val alpha = ((argb shr 24) and 0xFF) / 255f
    val red = ((argb shr 16) and 0xFF) / 255f
    val green = ((argb shr 8) and 0xFF) / 255f
    val blue = (argb and 0xFF) / 255f
    return Color.argb(alpha, red, green, blue)
}