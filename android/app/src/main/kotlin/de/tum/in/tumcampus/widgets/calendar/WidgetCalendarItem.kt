package de.tum.`in`.tumcampus.widgets.calendar

import android.content.Context
import android.graphics.Color
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
            when (type) {
                CalendarEventType.CANCELED -> Color.parseColor("#F44336")
                CalendarEventType.LECTURE -> Color.parseColor("#4CAF50")
                CalendarEventType.EXERCISE -> Color.parseColor("#9800FF")
                else -> ContextCompat.getColor(context, R.color.color_primary)
            }
        } else {
            argbToColor(color)
        }
    }

    private val type: CalendarEventType
        get() {
            return when {
                isCanceled -> CalendarEventType.CANCELED
                title.endsWith("VO") || title.endsWith("VU") || title.endsWith("VI") -> CalendarEventType.LECTURE
                title.endsWith("UE") -> CalendarEventType.EXERCISE
                else -> CalendarEventType.OTHER
            }
        }

    private val isCanceled: Boolean
        get() {
            return status == "CANCEL"
        }
}
