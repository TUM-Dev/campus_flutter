package de.tum.`in`.tumcampus.widgets.calendar

import android.content.Context
import android.graphics.Color
import androidx.core.content.ContextCompat
import com.google.gson.annotations.SerializedName
import de.tum.`in`.tumcampus.R
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
        var isFirstOnDay: Boolean = false
) {
    fun getEventColor(context: Context): Int {
        return when (type) {
            CalendarEventType.CANCELED -> Color.parseColor("#F44336")
            CalendarEventType.LECTURE -> Color.parseColor("#4CAF50")
            CalendarEventType.EXERCISE -> Color.parseColor("#9800FF")
            else -> ContextCompat.getColor(context, R.color.color_primary);
        }
    }

    private val type: CalendarEventType
        get() {
            println(title)
            return when {
                isCanceled -> CalendarEventType.CANCELED
                title.endsWith("VO") || title.endsWith("VU") || title.endsWith("VI") -> CalendarEventType.LECTURE
                title.endsWith("UE") -> CalendarEventType.EXERCISE
                else -> CalendarEventType.OTHER
            }
        }

    private val isCanceled: Boolean
        get() {
            println(status)
            return status == "CANCEL"
        }
}
