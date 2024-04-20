package de.tum.`in`.tumcampus.widgets.calendar

import android.content.Context
import androidx.core.content.ContextCompat
import com.google.gson.annotations.SerializedName
import de.tum.`in`.tumcampus.R
import de.tum.`in`.tumcampus.util.argbToColor
import org.joda.time.DateTime

data class WidgetCalendarItem(
    @SerializedName("nr")
    val id: String,
    val title: String,
    @SerializedName("dtstart")
    val startDate: DateTime,
    @SerializedName("dtend")
    val endDate: DateTime,
    val location: String,
    val status: String,
    val color: Long?,
    var isFirstOnDay: Boolean = false
) {
    fun getEventColor(context: Context): Int {
        return if (color == null) {
            ContextCompat.getColor(context, R.color.color_primary)
        } else {
            argbToColor(color)
        }
    }
}
