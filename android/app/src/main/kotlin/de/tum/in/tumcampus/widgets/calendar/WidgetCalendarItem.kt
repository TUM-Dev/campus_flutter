package de.tum.`in`.tumcampus.widgets.calendar

import android.content.Context
import androidx.core.content.ContextCompat
import de.tum.`in`.tumcampus.R
import de.tum.`in`.tumcampus.util.DateTimeSerializer
import de.tum.`in`.tumcampus.util.argbToColor
import kotlinx.serialization.SerialName
import kotlinx.serialization.Serializable
import java.time.LocalDateTime

@Serializable
data class WidgetCalendarItem(
    @SerialName("nr")
    val id: String,
    val status: String,
    val url: String? = null,
    val title: String,
    val description: String? = null,
    @Serializable(with = DateTimeSerializer::class)
    @SerialName("dtstart")
    val startDate: LocalDateTime,
    @Serializable(with = DateTimeSerializer::class)
    @SerialName("dtend")
    val endDate: LocalDateTime,
    val location: String? = null,
    val color: Long? = null,
    val isVisible: Boolean? = null,
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
