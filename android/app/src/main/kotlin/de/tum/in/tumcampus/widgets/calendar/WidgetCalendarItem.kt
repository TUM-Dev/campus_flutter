package de.tum.`in`.tumcampus.widgets.calendar

import com.google.gson.annotations.SerializedName
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
    var color: Long = 4278216125,
    var isFirstOnDay: Boolean = false
)
