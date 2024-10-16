package de.tum.`in`.tumcampus.util

import android.content.Context
import de.tum.`in`.tumcampus.R
import java.time.Duration
import java.time.LocalDateTime

object DateTimeUtils {
    /**
     * Checks whether two DateTime contain the same day
     *
     * @return true if both dates are on the same day
     */
    fun isSameDay(first: LocalDateTime, second: LocalDateTime) =
        first.year == second.year && first.dayOfYear == second.dayOfYear

}

fun LocalDateTime.timeAgo(context: Context): String {
    val now = LocalDateTime.now()
    val duration = Duration.between(this, now)

    val years = duration.toDays() / 365
    val months = duration.toDays() / 30
    val days = duration.toDays()
    val hours = duration.toHours()
    val minutes = duration.toMinutes()

    return when {
        years > 0 -> formattedTimeAgo(context, R.plurals.yearsAgo, years.toInt())
        months > 0 -> formattedTimeAgo(context, R.plurals.monthsAgo, months.toInt())
        days > 0 -> formattedTimeAgo(context, R.plurals.daysAgo, days.toInt())
        hours > 0 -> formattedTimeAgo(context, R.plurals.hoursAgo, hours.toInt())
        minutes > 0 -> formattedTimeAgo(context, R.plurals.minutesAgo, minutes.toInt())
        else -> context.resources.getString(R.string.just_now)
    }
}

fun formattedTimeAgo(context: Context, id: Int, number: Int): String {
    val quantityString = context.resources.getQuantityString(id, number)
    return if (quantityString.contains("%d", ignoreCase = false)) {
        String.format(quantityString, number)
    } else {
        quantityString
    }
}
